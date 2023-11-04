#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

#include  <iostream>
#include "llvm/Support/Format.h"
#include "llvm/IR/CFG.h"

#ifndef DEBUG
#define DEBUG true
#endif

#define log_debug(expr, fmt, ...)  \
                  if ((expr)) \
                      errs() << llvm::format(fmt"\n", ## __VA_ARGS__ )

#define log_debug_bb(expr, bbInfo, fmt, ...) \
                  if ((expr)) {  \
                    (bbInfo);    \
                  errs() << '\t'; errs() << llvm::format(fmt"\n", ## __VA_ARGS__ );}

#define seperator(num, charc) \
                  for (int i = 0; i < (num); i++) errs() << charc;\
                  errs() << '\n';

#define sep_center(charc, center) \
        for (int i = 0; i < 18; i ++) errs() << charc; \
        errs() << '\t' << center << '\t'; \
        for (int i = 0; i < 18; i ++) errs() << charc; \
        errs() << '\n';

template<typename ...Args>
void tLog(Args && ...args)
{
    (errs() << ... << args);
    errs() << '\n';
}

template<typename ...Args>
void printBlockInfo(bool debug, BasicBlock* bb, Args && ...args){
    if (!debug) return;
    errs() << "Block: "; bb->printAsOperand(errs(), false); errs() << "\n";
    tLog(args...);
}
 
using namespace llvm;


struct coalStoreInst{
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
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);
    void runOnOneBB(Function &F, FunctionAnalysisManager &FAM);

    // only in parent BB of inst
    void findAllContribution(Instruction* inst);



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




