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

namespace{
struct CoalPass : public PassInfoMixin<CoalPass>{
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM){
        // Add your code here

        errs() << F.getName() << '\n';
        for (auto &bb : F){
            bb.printAsOperand(errs(), false); errs() << '\n';
            for (auto &inst : bb){
              errs() << inst << '\t' << inst.getOpcodeName() << '\n';
            }
        }
        return PreservedAnalyses::all();
    }

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
            FPM.addPass(CoalPass());
            return true;
          }
          return false;
        }
      );
    }
  };
}




