#ifndef COAL_LOAD_H
#define COAL_LOAD_H

#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/AliasSetTracker.h"
#include "llvm/Pass.h"

#include  <iostream>
#include "llvm/Support/Format.h"
#include "llvm/IR/CFG.h"
#include <deque>
#include <optional>
#include <unordered_set>
#include <unordered_map>
#include <string>
#include <memory>

#include "debugLog.h"

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

enum class CoalMemBinaryASTToken_t: uint8_t {Mult, Add};
enum class CoalMemPrototyeASTToken_t: uint8_t {ThreadIndex, BlockDim, BlockIndex, TID};
enum class CoalMemConstExprASTToken_t : uint8_t {Argument};

class BinaryExprAST;
class CoalMemExprAST{
public:
    shared_ptr<BinaryExprAST> parent = nullptr;
    // shared_ptr<CoalMemExprAST> parent = nullptr;

    virtual ~CoalMemExprAST() = default;
    virtual string str() = 0;
    /**
     * transform an expression to add connected components by applying distribution rule
     * e.g, 3 *(a * b+ d) + c => 3*a*b + 3*d + c
     * The good part of this method is that after this transformation, mul will only have Const and mul itself as child node
    */
    
};


class BinaryExprAST : public CoalMemExprAST{
private:
    CoalMemBinaryASTToken_t op;
    shared_ptr<CoalMemExprAST> lhs, rhs;
    void exchangeAddMultNodes(BinaryExprAST* multParent, BinaryExprAST* addChild, bool isLeftChild);

public:
    void distributiveTransform();
    BinaryExprAST(CoalMemBinaryASTToken_t _op, shared_ptr<CoalMemExprAST> _lhs, shared_ptr<CoalMemExprAST> _rhs): op{_op}, lhs{_lhs}, rhs{_rhs}{
        lhs->parent = shared_ptr<BinaryExprAST>(this);
        rhs->parent = shared_ptr<BinaryExprAST>(this);
    }
    string str() override {
        switch (op)
        {
            case CoalMemBinaryASTToken_t::Add:
                return  "(" + lhs->str() + " + " + rhs->str() + ")";
            case CoalMemBinaryASTToken_t::Mult:
                return  "(" + lhs->str() + " * " + rhs->str() + ")";
            default:
                return "BinaryOp:\t?";
        //     return "BinaryOp:\t?";
        }
    }
};

class ConstExprAST : public CoalMemExprAST {
public:
    ConstExprAST() = default;
    string str() override {
        return "ConstExprAST";
    }
};

class PrototypeExprAST : public ConstExprAST {
private:
    CoalMemPrototyeASTToken_t token;
public:
    PrototypeExprAST(CoalMemPrototyeASTToken_t _token): token{_token}{}
    string str() override {
        switch (token)
        {
            case CoalMemPrototyeASTToken_t::ThreadIndex:
                return string("ThreadIndex");
            case CoalMemPrototyeASTToken_t::BlockDim:
                return string("BlockDim");
            case CoalMemPrototyeASTToken_t::BlockIndex:
                return string("BlockIndex");
            case CoalMemPrototyeASTToken_t::TID:
                return string("TID"); 
            default:
                return string("Prototype:?");
        // default:
        //     return string("Prototype:?");
        }
    }
};
/**
 * Argument passed from entry of function (register value with no dependence in function scope)
*/
class ConstArgExprAST : public CoalMemExprAST {
private:
    CoalMemConstExprASTToken_t token;
    Argument* argument;
public:
    ConstArgExprAST(CoalMemConstExprASTToken_t _token, Argument* _argument) : token{_token}, argument{_argument}{}
    string str() override {
        switch (token)
        {
        case CoalMemConstExprASTToken_t::Argument:
            return "Arg " + argument->getName().str();
        default:
            return "Arg ?";
        }
    }
};
class ConstIntExprAST : public ConstExprAST {
private:
    int value;
public:
    ConstIntExprAST(int _value): value{_value}{}
    string str() override {
        return std::to_string(value);
    }
};


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
    CoalMemExprAST* originalExpr;
    int stride;
    /// @brief  offset <= stride - 1
    int offset;
    /// TID or ThreadIdx alone
    bool batchedTID;
};
// class of LoadInst that can be coalesced
struct CoalLoad{
// data
    LoadInst* origLoadInst;


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


/** helpers **/
BasicBlock::reverse_iterator reversePos_helper(Instruction* inst);

BasicBlock::iterator         forwardPos_helper(Instruction* inst);



#endif