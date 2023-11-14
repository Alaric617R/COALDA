#ifndef COALPASS_H
#define COALPASS_H
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

#include "coalMemOp.h"
#include "debugLog.h"

using std::deque;
using std::optional;
using std::unordered_map;
using std::unordered_set;
using std::string;
using std::nullopt;
using namespace llvm;



// pointer location calculation chain for pointer operand in getelementptr
struct PtrCalcChain{
    Value *addressBase;
    // all that contributes to the formation of address. The front stores Value that closest to entry point of BB
    deque<Value*> fifoInstContributorDeque;
};
// register represents an address that comes from getelementptr
// this struct gather info for all calculation (Values) that contribute to this address
// in scale of a basicblock, performes backward data analysis
struct CoalAddressCalcChain{

};

struct SingleBBCoalAnalysisData{
    // front represents the stores with lowest instruction order (closet to entry of basicblock)
    deque<StoreInst*> allStoreInstDeque;
    deque<LoadInst*> allLoadInstDeque;
};

struct CoalStoreInst{
    // store instruction that can be potentially coal-opt
    Instruction* storeInst;

};

/**
 * Assumptions:
 * 1. All stores to aggregated data structure (Address calculated via getelememtptr) can be coalesced
 * 2. Data source for the above stores can also be coalesced when loads
 * 3. Only do this in one basicblock
*/
namespace coalPass{
struct CoalPass : public PassInfoMixin<CoalPass>{
    /** data **/
    unordered_map<BasicBlock*, SingleBBCoalAnalysisData*> bbCoalDataMap;

    /** methods **/
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);

    /// run coalAnalysis in whole function scope rather than single BB.
    /// Prerequisite: no loop in the function.
    void run_coal(Function &F, FunctionAnalysisManager &FAM);

    void runOnOneBB(BasicBlock* targetBB);

    void findAllLoadAndStorePerBB(BasicBlock* targetBB, SingleBBCoalAnalysisData* bbCoalAnalysisData);

    // only in parent BB of inst
    void findAllContribution(Instruction* inst);

    // check whether this address belong getelementptr
    // if @param addressReg is not in the same BB as @param parentStore, return nullopt
    optional<CoalAddressCalcChain> checkValueRegAddressIsArray(Value* addressReg, StoreInst* parentStore);


    /*** helper functions ***/
    void findAllStoresPerFunc(Function &F, deque<StoreInst*> &allStoreFuncDeque);

    optional<PtrCalcChain> ptrOperandAnalysisGEP_helper(GetElementPtrInst* parentGEPInst);

    
    deque<Instruction*> findAllContributorInstFIFO_helper(Instruction* rootInst);


    /** test cases **/
    #if DEBUG
    void unit_test_ViableOffsetEquation_construction();

    void unit_test_distributive_transform();
    #endif
};
}

extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK llvmGetPassPluginInfo() {
  return {
    LLVM_PLUGIN_API_VERSION, "CoalPass", "v0.1",
    [](PassBuilder &PB) {
      PB.registerPipelineParsingCallback(
        [](StringRef Name, FunctionPassManager &FPM,
        ArrayRef<PassBuilder::PipelineElement>) {
          if(Name == "coal"){
            FPM.addPass(coalPass::CoalPass());
            return true;
          }
          return false;
        }
      );
    }
  };
}

// test function
void testInst(BasicBlock* bb){
  for (auto &inst : *bb){
      if (auto alloca = dyn_cast<AllocaInst>(&inst)){
         sep_center( *alloca->getType());
         sep_center(*alloca->getAllocatedType());
      }
  }
}

void testGEPPointerAlias(BasicBlock* bb, FunctionAnalysisManager &FAM, Function& F){
  // find first two GEP
  deque<GetElementPtrInst*> geps;
  // BatchAAResults baResult;
  // AliasSetTracker ast;
  auto &aa = FAM.getResult<AAManager>(F);
  int i = 0;
  for (auto &inst : *bb){
     if (auto gep = dyn_cast<GetElementPtrInst>(&inst)){
          geps.push_back(gep);
     }
  }
  while (!geps.empty()){
    GetElementPtrInst* front = geps.front();
    geps.pop_front();
    for (auto other : geps){
      sep_center("Alias Analysis");
      printInfo(DEBUG, *front, '\n', *other, '\n', aa.alias(front->getPointerOperand(), other->getPointerOperand()));
    }
  }

}



#endif