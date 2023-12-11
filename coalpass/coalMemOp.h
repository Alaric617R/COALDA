#ifndef COAL_MEM_OP_H
#define COAL_MEM_OP_H

#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/AliasSetTracker.h"
#include "llvm/Support/Format.h"
#include "llvm/IR/CFG.h"
#include "llvm/Pass.h"

#include  <iostream>
#include <deque>
#include <optional>
#include <unordered_set>
#include <unordered_map>
#include <string>
#include <memory>
#include <map>

#include "debugLog.h"
#include "coalMemAST.h"

using std::deque;
using std::unique_ptr;
using std::shared_ptr;
using std::optional;
using std::unordered_map;
using std::unordered_set;
using std::string;
using std::nullopt;
using std::map;
using namespace llvm;

extern unordered_set<const char*> OffsetAllowedOpcodeFSM;
extern Instruction* GlobalTidRegister;
extern Instruction* LocalTidRegister;
extern Instruction* BlockDimRegister;
extern Instruction* BlockIndexRegister;
extern Instruction* multDimIndexRegister;


struct OffsetEquation{
    shared_ptr<CoalMemExprASTBase> expr;
};


struct CalcTreeNode{
    Value* inst;
    // since SSA and we're only in same basic block, parent node should only be one
    CalcTreeNode* parentNode;
    unordered_set<CalcTreeNode*> childNodesSet;
    OffsetEquation nodeExpression;
    static bool opcodeInFSM(Value* inst);
    static void setupCalcTreeNode(CalcTreeNode* curNode, Value* inst, CalcTreeNode* parentNode);
    static void freeTreeNodes(CalcTreeNode* root_to_free);
    static void calcOffsetEquation(CalcTreeNode* root);
    static void calcPtrSrc(CalcTreeNode* root);
    void prettyPrint();
};

struct GEPWrapper{
    GetElementPtrInst* GEP;
    Value*  PointerOp;
    Value*  OffsetOp;
};

/**
 * AST for CoalMemory formula:
 * Stride * (ThreadIdx | TID) + StrideOffset
 * 1. @param Stride: constant. Size of packet struct in words. In rgb, it's three (R,G,B)
 * 2. @param ThreadIdx: flag that this memory operation is in parallel
 * 3. @param TID: ThreadIdx + BlockDim * BlockIndex (present if has multiple thread blocks)
 * 4. @param StrideOffset: The particular sub-field a single load/store that tries to access (<= @param Stride)
*/
struct ViableOffsetEquation{

    int stride;
    /// @brief  offset <= stride - 1
    int offset;
    /// TID or ThreadIdx alone
    bool batchedTID;

    string str() const{
        string tid = (batchedTID) ? "TID" : "TheadIdx";
        return std::to_string(stride) + " * " + tid + " + " + std::to_string(offset);
    }
    /// invariant of @param exprsDeque: has been applied distributive rule: no add operand
    static optional<ViableOffsetEquation> constructFromOffsetExprOrNo(deque<shared_ptr<CoalMemExprASTBase>> exprsDeque);
    friend bool operator==(const ViableOffsetEquation& lhs, const ViableOffsetEquation& rhs);
    friend bool operator!=(const ViableOffsetEquation& lhs, const ViableOffsetEquation& rhs);
};


struct CoalPointerOpAnalysisResult{
    /// offset of pointer operand
    ViableOffsetEquation offsetEquation;
    /// pointer source
    ConstArgExprAST srcPtrExpr = ConstArgExprAST(CoalMemConstExprASTToken_t::None, nullptr);
};

// class of LoadInst that can be coalesced
struct CoalLoad{
// data
    LoadInst* origLoadInst;
    /// offset of pointer operand
    ViableOffsetEquation offsetEquation;
    /// pointer source
    ConstArgExprAST srcPtrExpr = ConstArgExprAST(CoalMemConstExprASTToken_t::None, nullptr);

    string str(){
        string tid_str;
        if (offsetEquation.batchedTID) tid_str = "GlobalTID";
        else tid_str = "LocalThreadIdx";
        return string_format("Ptr Source: [%s]\tPtr Offset: [Stride = %d]\t[StrideOffset = %d]\t[%s]\n", srcPtrExpr.str().c_str(), offsetEquation.stride, offsetEquation.offset, tid_str.c_str());
    }
    void print(){
        string tid_str;
        if (offsetEquation.batchedTID) tid_str = "GlobalTID";
        else tid_str = "LocalThreadIdx";
        errs() << *origLoadInst << "\thas potential to be coalesced.\n";
        errs() << "Ptr Source: [" << srcPtrExpr.str() << "]\t" << *srcPtrExpr.getArg() << '\n';
        errs() << format("Ptr Offset: [Stride = %d]\t[StrideOffset = %d]\t[%s]\n", offsetEquation.stride, offsetEquation.offset, tid_str.c_str());
    }
    /// if the passed in LoadInst can be coalesced, return CoalLoad struct. Else, nullopt
    static optional<CoalLoad> createCoalLoadOrNo(LoadInst* loadCandInst);

};

/**  for CoalStore:
 *   1. value operand must be CoalLoad
 *   2. ptr operand must be able to be transferred to ViableOffsetEquation
 *   3. equation for value op and ptr op must be the same
 */
struct CoalStore{
// data
    StoreInst* origStoreInst;
    /// value operand
    CoalLoad valOpCoalLoad;
    /// ptr operand
    CoalPointerOpAnalysisResult storeSrcPtrExpr;

/// method
    void print(){
        string tid_str;
        if (storeSrcPtrExpr.offsetEquation.batchedTID) tid_str = "GlobalTID";
        else tid_str = "LocalThreadIdx";
        errs() << *origStoreInst << "\thas potential to be coalesced.\n";
        errs() << "Value Source from Load:\t" << valOpCoalLoad.str() << '\n';
        errs() << "Ptr Dest of Store:\n";
        errs() << "Ptr Source: [" << storeSrcPtrExpr.srcPtrExpr.str() << "]\t" << *storeSrcPtrExpr.srcPtrExpr.getArg() << '\n';
        errs() << format("Ptr Offset: [Stride = %d]\t[StrideOffset = %d]\t[%s]\n", storeSrcPtrExpr.offsetEquation.stride, storeSrcPtrExpr.offsetEquation.offset, tid_str.c_str());
    }

    /// return true if two stores can be coalesced into one group
    /// @note two stores need to be in same basicblock!!!
    /// Reason is simple, we don't want to get into control flow and possbile runtime coalescable store is out of our consideration.
    bool is_same(const CoalStore& other) const;

    static optional<CoalStore> createCoalStoreOrNo(StoreInst* storeCandInst);
};

static int CSG_CNT = 1;
struct CoalStoreGroup{
    int id;
    deque<CoalStore> group; 
    CoalStoreGroup(){
        id = CSG_CNT ++;
    }

/// method
    bool transform();
    void print() const{
        if (group.empty()) return;
        string banner_start = string_format("CoalStoreGroup %d Starts", id);
        string banner_end = string_format("CoalStoreGroup %d Ends", id);
        sep_center(banner_start);
        for (auto cs : group){
            cs.print();
        }
        sep_center(banner_end);
    }
    ~CoalStoreGroup(){CSG_CNT--;}
};

/**
 * Return false if no TID related field is found.
 * Return true still possibly means cannot coalesce (such as alloca inst didn't get squashed)
*/
bool computeValueDependenceTree(CalcTreeNode* root);

/**
 * Return true if this pointer address is derived from:
 * 1. Argument that is passed to the function
 * 2. Alloca
 * 3. shared memory
 * 4. global variable ( @note Now doesn't support)
*/
bool computeSrcPtrDependenceTree(CalcTreeNode* root);


/**
 * This method can be used both in CoalLoad ans CoalStore, when comes to analyse their pointer operand.
 * 1. Determine if @param ptrOperand is from GEP
 * 2. Determine offset equation for this GEP
*/
optional<CoalPointerOpAnalysisResult> analysePointerOperand(Value* ptrOperand);

/** helpers **/
BasicBlock::reverse_iterator reversePos_helper(Instruction* inst);

BasicBlock::iterator         forwardPos_helper(Instruction* inst);

/**
 * The offseted GlobalTid is automatically inserted after globalTid w/o offset
*/
Instruction* insertGlobalTidWithScaledOffsetRegister(int stride);





#endif