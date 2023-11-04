#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

#include  <iostream>
#include "llvm/Support/Format.h"
#include "llvm/IR/CFG.h"

using namespace llvm;


struct coalStoreInst{
    // store instruction that can be potentially coal-opt
    Instruction* storeInst;

};

/**
 * Assumptions:
 * 1. All stores to aggregated data structure (Address calculated via getelememtptr) can be coalesced
 * 2. Data source for the above stores can also be coalesced when loads
*/
namespace coalPass{
struct CoalPass : public PassInfoMixin<CoalPass>{
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);



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




