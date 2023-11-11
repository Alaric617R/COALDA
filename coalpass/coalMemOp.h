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
using namespace llvm;

extern unordered_set<const char*> OffsetAllowedOpcodeFSM;



struct OffsetEquation{
    shared_ptr<CoalMemExprAST> expr;
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

    /// invariant of @param exprsDeque: has been applied distributive rule: no add operand
    static optional<ViableOffsetEquation> constructFromOffsetExprOrNo(deque<shared_ptr<CoalMemExprAST>> exprsDeque);
};

// class of LoadInst that can be coalesced
struct CoalLoad{
// data
    LoadInst* origLoadInst;
    /// offset of pointer operand
    ViableOffsetEquation offsetEquation;


public:
    /**/
    static bool isLoadCoalescable(LoadInst* loadCand);
};

// if the passed in LoadInst can be coalesced, return CoalLoad struct. Else, nullopt
optional<CoalLoad> createCoalLoadOrNo(LoadInst* loadCandInst);

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
bool computerSrcPtrDependenceTree(CalcTreeNode* root);

/** helpers **/
BasicBlock::reverse_iterator reversePos_helper(Instruction* inst);

BasicBlock::iterator         forwardPos_helper(Instruction* inst);





#endif