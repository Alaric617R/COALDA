#include "coalpass.h"

PreservedAnalyses coalPass::CoalPass::run(Function &F, FunctionAnalysisManager &FAM){
        sep_center(F.getName());
        int bb_cnt = 0;
        for (auto &bb : F){
            bb_cnt ++;
            assert(bbCoalDataMap.find(&bb) == bbCoalDataMap.end());
            bbCoalDataMap[&bb] = new SingleBBCoalAnalysisData;
            runOnOneBB(&bb);
        }

       
        return PreservedAnalyses::all();
}

void coalPass::CoalPass::runOnOneBB(BasicBlock* targetBB){
      SingleBBCoalAnalysisData *bbCoalAnalysisData = bbCoalDataMap[targetBB];
      findAllStorePerBB(targetBB, bbCoalAnalysisData);
}

void coalPass::CoalPass::findAllStorePerBB(BasicBlock* targetBB, SingleBBCoalAnalysisData* bbCoalAnalysisData){
  sep_center("Function findAllStorePerBB");
    for (Instruction &inst : *targetBB){
        if (auto storeInst = dyn_cast<StoreInst>(&inst)){
          printInfo(DEBUG, inst);
          bbCoalAnalysisData->allStoreInstDeque.push_back(storeInst);
        }
    }
}


void coalPass::CoalPass::findAllContribution(Instruction* inst){
    BasicBlock* parentBB = inst->getParent();
    BasicBlock::reverse_iterator revStart;
    for (BasicBlock::reverse_iterator curBack = parentBB->rbegin(); curBack != parentBB->rend(); curBack ++){
        if (&(*curBack) == inst) {revStart = curBack; break;}
    }
    for (; revStart != parentBB->rend(); revStart ++);

}
