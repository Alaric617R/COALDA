#include "coalpass.h"

PreservedAnalyses coalPass::CoalPass::run(Function &F, FunctionAnalysisManager &FAM){
        if (DEBUG &&  F.getName().str() != string("_Z26rgb_copy_array_interleavedPiS_"))  return PreservedAnalyses::all();
        sep_center(F.getName());
        int bb_cnt = 0;
        for (auto &bb : F){
            bb_cnt ++;
            assert(bbCoalDataMap.find(&bb) == bbCoalDataMap.end());
            bbCoalDataMap[&bb] = new SingleBBCoalAnalysisData;
            runOnOneBB(&bb);
            break;
            // testInst(&bb);
            // break;
        }

       
        return PreservedAnalyses::all();
}

void coalPass::CoalPass::runOnOneBB(BasicBlock* targetBB){
      SingleBBCoalAnalysisData *bbCoalAnalysisData = bbCoalDataMap[targetBB];
      findAllStorePerBB(targetBB, bbCoalAnalysisData);
      // for every store in this basicblock, check it's dest and src address. If both coming from getelementptr and offset related to TID, then this store can be coalesced
      for (StoreInst *storeInstCand : bbCoalAnalysisData->allStoreInstDeque){
          // check value operand
          Value *storeValueOperand = storeInstCand->getValueOperand();
          checkValueRegAddressIsArray(storeValueOperand, storeInstCand);
          // check pointer operand

      }
}

void coalPass::CoalPass::findAllStorePerBB(BasicBlock* targetBB, SingleBBCoalAnalysisData* bbCoalAnalysisData){
    bool debug = !DEBUG;
    sep_centerBB("Function findAllStorePerBB", targetBB);
    for (Instruction &inst : *targetBB){
        if (auto storeInst = dyn_cast<StoreInst>(&inst)){
          printInfo(debug, *storeInst);
          bbCoalAnalysisData->allStoreInstDeque.push_back(storeInst);
          // if (isa<Argument>(storeInst->getValueOperand())) errs() << *storeInst->getValueOperand() <<'\n';
          printInfo(debug, "Value operand:\t", *storeInst->getValueOperand());
          printInfo(debug, "Ptr operand:\t", *storeInst->getPointerOperand());
        }
        // if (isa<GetElementPtrInst>(&inst)){
        //     sep_center_idy('#', inst);
        //     for (unsigned int i = 0; i < inst.getNumOperands(); i++){
        //         Value* operand = inst.getOperand(i);
        //         operand->print(llvm::outs());
        //         llvm::outs() << "\n";
        //     }
        // }
    }
}

 optional<CoalAddressCalcChain> coalPass::CoalPass::checkValueRegAddressIsArray(Value* addressReg, StoreInst* parentStore){
    bool debug = DEBUG;
    printInfo(debug, "parent store:\t", *parentStore);
    printInfo(debug, "Value Address Reg Inst:\t", *addressReg);

     /** simplicity: if addressReg is not loadInst, disgard this coal chance **/
    if (!isa<LoadInst>(addressReg)) return nullopt;
    CoalAddressCalcChain addressCalcAnalysisData;
    BasicBlock *parentBB = parentStore->getParent();
    /// TODO: if addressReg is Argument : return nullopt b/c it can't be getelemtptr
    if (isa<Argument>(addressReg)) return nullopt;

    // if addressReg is Instruction
    if (auto addressRegInst = dyn_cast<LoadInst>(addressReg)){
        if (addressRegInst->getParent() != parentStore->getParent()) return nullopt;
        // find if this address comes from getelemtptr
        unordered_set<Value*> addrDepSet;
        addrDepSet.insert(addressRegInst);
        // find addressRegInst position inside the BB
        BasicBlock::reverse_iterator revStart = ++reversePos_helper(addressRegInst);

        printInfo(debug, "reverse search starts at:\t", *revStart);

        // get loadinst pointer location
        Value *loadPtrLocation = addressRegInst->getPointerOperand();
        // this loadInst pointer address must originate from getElemInst
        if (GetElementPtrInst* valueOpGetElemPtrInst = dyn_cast<GetElementPtrInst>(loadPtrLocation)){
            /// TODO: Analyse pointer location and offset calculation
            sep_center_idy('#', *valueOpGetElemPtrInst);
            for (unsigned int i = 0; i < valueOpGetElemPtrInst->getNumOperands(); i++){
                Value* operand = valueOpGetElemPtrInst->getOperand(i);
                operand->print(llvm::outs());
                llvm::outs() << "\n";
            }
            printInfo(debug, "Pointer operand:\t", *valueOpGetElemPtrInst->getPointerOperand());
            ptrOperandAnalysisGEP_helper(valueOpGetElemPtrInst);

        } else return nullopt;
    }
    return nullopt;
}


void coalPass::CoalPass::findAllContribution(Instruction* inst){
    BasicBlock* parentBB = inst->getParent();
    BasicBlock::reverse_iterator revStart;
    for (BasicBlock::reverse_iterator curBack = parentBB->rbegin(); curBack != parentBB->rend(); curBack ++){
        if (&(*curBack) == inst) {revStart = curBack; break;}
    }
    for (; revStart != parentBB->rend(); revStart ++);

}


/*** helper functions ***/

// return the reverse iterator to the parent basicblock of inst that matches its position
BasicBlock::reverse_iterator coalPass::CoalPass::reversePos_helper(Instruction* inst){
        BasicBlock *parentBB = inst->getParent();
        BasicBlock::reverse_iterator revStart = parentBB->rend();
        for (BasicBlock::reverse_iterator curBack = parentBB->rbegin(); curBack != parentBB->rend(); curBack++){
            if (&(*curBack) == inst) {revStart=curBack; break;}
        }
        return revStart;
}

BasicBlock::iterator         coalPass::CoalPass::forwardPos_helper(Instruction* inst){
        BasicBlock *parentBB = inst->getParent();
        BasicBlock::iterator fwdStart = parentBB->end();
        for (BasicBlock::iterator i = parentBB->begin(); i != parentBB->end(); i++){
            if (&(*i) == inst) {fwdStart=i; break;}
        }
        return fwdStart;
}

optional<PtrCalcChain> coalPass::CoalPass::ptrOperandAnalysisGEP_helper(GetElementPtrInst* parentGEPInst){
        /*** Backward Data Analysis FSM
         *   LoadInst -> transfer to Source Pointer Operand
         *   Allocainst -> find youngest store that modifies that pointer location, transfer to value operand of that particular StoreInst
         *   Argument -> terminate
        */
        bool debug = DEBUG;
        PtrCalcChain    ptrCalcData;
        BasicBlock *parentBB = parentGEPInst->getParent();
        Value *initPtrOpGEP = parentGEPInst->getPointerOperand();
        /// TODO: if it's Argument, we're done
        if (isa<Argument>(initPtrOpGEP)){
            ptrCalcData.addressBase = initPtrOpGEP;
        }
        if (auto initPtrOpGEPInst = dyn_cast<Instruction>(initPtrOpGEP)){
            Value *curBBLocation = initPtrOpGEP;
            Value *nextBBLocation = nullptr;
            int iterCnt = 0;
            // inside FSM
            while (true){
                /// TODO: LoadInst, find pointer operand, make sure it's younger than itself and transfer
                if (LoadInst *curLocLoadInst = dyn_cast<LoadInst>(curBBLocation)){
                    nextBBLocation = curLocLoadInst->getPointerOperand();

                    seperator(36, '$');
                    printInfo(debug, "FSM iterCnt: ", iterCnt, "\t", *curLocLoadInst);
                    printInfo(debug, "next location:\t", *nextBBLocation);
                }
                else if (AllocaInst* curLocAllocaInst = dyn_cast<AllocaInst>(curBBLocation)){

                    // if it's not allocating a pointer, then return nullopt
                    if (!curLocAllocaInst->getAllocatedType()->isPointerTy()) return nullopt;
                    // find oldest store between current point and initPtrOpGEP
                    BasicBlock::reverse_iterator revStart = reversePos_helper(initPtrOpGEPInst);
                    BasicBlock::reverse_iterator revEnd   = reversePos_helper(curLocAllocaInst);
                    Value *storeValue = nullptr;
                    for(; revStart != revEnd; revStart ++){
                        printInfo(debug, "rev find store:\t", *revStart);
                        if (StoreInst *storeCandInst = dyn_cast<StoreInst>(&*revStart)){
                            if (storeCandInst->getPointerOperand() == curLocAllocaInst){
                                storeValue = storeCandInst->getValueOperand();
                            }
                        }
                    }
                    assert(storeValue != nullptr);
                    nextBBLocation = storeValue;

                    seperator(36, '$');
                    printInfo(debug, "FSM iterCnt: ", iterCnt, "\t", *curLocAllocaInst);
                    printInfo(debug, "next location:\t", *nextBBLocation);

                }
                else if (isa<Argument>(curBBLocation)){
                    ptrCalcData.addressBase = curBBLocation;
                    seperator(36, '$');
                    printInfo(debug, "FSM ends on: ", iterCnt, "\t", *curLocAllocaInst);
                    break;
                }

                iterCnt ++;
                curBBLocation = nextBBLocation;
                assert(curBBLocation != nullptr);
            }
            return std::make_optional(ptrCalcData);
        }
        return nullopt;
 
}
