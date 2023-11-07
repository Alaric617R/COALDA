#ifndef COAD_LOAD_H
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

using std::deque;
using std::optional;
using std::unordered_map;
using std::unordered_set;
using std::string;
using std::nullopt;
using namespace llvm;

extern unordered_set<const char*> OffsetAllowedOpcodeFSM;

enum class CoalParallelToken_t: uint8_t {ThreadIndex, BlockDim, BlockIndex};

struct OffsetEquation{

};

struct CalcTreeNode{
    Value* inst;
    // since SSA and we're only in same basic block, parent node should only be one
    CalcTreeNode* parentNode;
    unordered_set<CalcTreeNode*> childNodesSet;
    OffsetEquation nodeExpression;
    static bool opcodeInFSM(Value* inst);
    static void setupCalcTreeNode(CalcTreeNode* curNode, Value* inst, CalcTreeNode* parentNode);
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
bool computeOffsetDepTree(CalcTreeNode* root);


/** helpers **/
BasicBlock::reverse_iterator reversePos_helper(Instruction* inst);

BasicBlock::iterator         forwardPos_helper(Instruction* inst);


#endif