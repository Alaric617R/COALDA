#include "coalpass.h"

PreservedAnalyses coalPass::CoalPass::run(Function &F, FunctionAnalysisManager &FAM){
        errs() << F.getName() << '\n';
        for (auto &bb : F){
            bb.printAsOperand(errs(), false); errs() << '\n';
            for (auto &inst : bb){
              errs() << inst << '\t' << inst.getOpcodeName() << '\n';
            }
        }
        errs() << "This is Alaric waving!\n";
        return PreservedAnalyses::all();
}
