#include "coalpass.h"

PreservedAnalyses coalPass::CoalPass::run(Function &F, FunctionAnalysisManager &FAM){
        for (auto &bb : F){
            bb.printAsOperand(errs(), false); errs() << '\n';
            runOnOneBB(F, FAM);
        }
        errs() << "This is Alaric waving!\n";
        return PreservedAnalyses::all();
}

void coalPass::CoalPass::runOnOneBB(Function &F, FunctionAnalysisManager &FAM){

}


void coalPass::CoalPass::findAllContribution(Instruction* inst){
    BasicBlock* parentBB = inst->getParent();
    BasicBlock::reverse_iterator revStart;
    for (BasicBlock::reverse_iterator curBack = parentBB->rbegin(); curBack != parentBB->rend(); curBack ++){
        if (&(*curBack) == inst) {revStart = curBack; break;}
    }
    for (; revStart != parentBB->rend(); revStart ++)

}
