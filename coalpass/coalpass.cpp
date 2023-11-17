#include "coalpass.h"

//** Debug test functions **//
void coalPass::CoalPass::unit_test_distributive_transform(){
    
    auto const1 = make_shared<ConstIntExprAST>(1);
    auto const2 = make_shared<ConstIntExprAST>(2);
    auto const3 = make_shared<ConstIntExprAST>(3);
    auto const4 = make_shared<ConstIntExprAST>(4);
    auto const5 = make_shared<ConstIntExprAST>(5);

    // test 1 (1+2) * (3*4)
    auto add1 = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Add, const1, const2);
    auto add2 = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Add, const3, const4);
    auto mult = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Mult, add1, add2);


    errs() << "before dist:\t" << mult->str() << '\n';
    auto after = BinaryExprAST::distributiveTransform(mult);
    // errs() << "after dist:\t" << BinaryExprAST::distributiveTransform(mult)->str() << '\n';
    if (auto bn = dynamic_cast<BinaryExprAST*>(after.get()))
        errs() << "after dist:\t" << bn->str() << '\n';
    else errs() << "no!\n";

    // test2 (1*2 + 3) * 4 + 5
    auto mul12 = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Mult, const1, const2);
    auto add1m2a3 = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Add, mul12, const3);
    auto mul = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Mult, add1m2a3, const4);
    auto addTot = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Add, mul, const5);

    errs() << "before dist:\t" << addTot->str() << '\n';
    after = BinaryExprAST::distributiveTransform(addTot);
    // errs() << "after dist:\t" << BinaryExprAST::distributiveTransform(mult)->str() << '\n';
    if (auto bn = dynamic_cast<BinaryExprAST*>(after.get()))
        errs() << "after dist:\t" << bn->str() << '\n';
    else errs() << "no!\n";
}

void coalPass::CoalPass::unit_test_ViableOffsetEquation_construction(){


    // construct 3 * threadId + 3 * blockDim * blockIdx + 1

    auto const3 = make_shared<ConstIntExprAST>(3);
    auto const1 = make_shared<ConstIntExprAST>(1);

    auto threadIdx = make_shared<PrototypeExprAST>(CoalMemPrototyeASTToken_t::ThreadIndex);
    auto blockIdx = make_shared<PrototypeExprAST>(CoalMemPrototyeASTToken_t::BlockIndex);
    auto blockDim = make_shared<PrototypeExprAST>(CoalMemPrototyeASTToken_t::BlockDim);

    CoalMemExprAST* base = dynamic_cast<CoalMemExprAST*>(blockDim.get());


    auto t3 = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Mult, threadIdx, const3);

    auto bb = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Mult, blockDim, blockIdx);

    auto bb3 = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Mult, bb , const3);

    auto add1 = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Add, bb3, t3);

    auto addTot = make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Add, add1, const1);

    errs() << addTot->str() << '\n';

    auto exprs = addTot->extractSubMultExprsFromDistForm(addTot);

    for (auto e : exprs) errs() << e->str() << '\n';

    auto vo = ViableOffsetEquation::constructFromOffsetExprOrNo(exprs);

    if (vo.has_value()){
        printInfo(DEBUG, "stride:\t", vo.value().stride, "\nGlobalTID:\t", vo.value().batchedTID, "\nOffset:\t", vo.value().offset);
    }
    else{
        errs() << "Alaric failed!\n";
    }

}

/** Patches **/
void printAllOp(Instruction* inst){
        sep_center("Operand list");
        errs() << "Inst:\t" << *inst << "\thas " << inst->getNumOperands() << " operands" <<'\n';
    int idx = 1;
    for (auto i=inst->op_begin(); i != inst->op_end(); i++){
        if (auto inst = dyn_cast<AddrSpaceCastInst>(i->get())){
            errs() << "[#" << idx++ << "]\t" << *i->get() << "\topcode:\t" << inst->getOpcodeName()  << '\n';
        }
        else
            errs() << "[#" << idx++ << "]\t" << *i->get() << "\ttype:\t" << *i->get()->getType() << '\n';
    }
    sep_center("End operand list");
}
void coalPass::CoalPass::findAllLoadAndStorePerBB(BasicBlock* targetBB, SingleBBCoalAnalysisData* bbCoalAnalysisData){
    bool debug = !DEBUG;
    sep_centerBB("Function findAllLoadAndStorePerBB", targetBB);
    for (Instruction &inst : *targetBB){
        if (auto storeInst = dyn_cast<StoreInst>(&inst)){
          printInfo(debug, *storeInst);
          bbCoalAnalysisData->allStoreInstDeque.push_back(storeInst);
          // if (isa<Argument>(storeInst->getValueOperand())) errs() << *storeInst->getValueOperand() <<'\n';
          printInfo(debug, "Value operand:\t", *storeInst->getValueOperand());
          printInfo(debug, "Ptr operand:\t", *storeInst->getPointerOperand());
        }
        else if (auto loadInst = dyn_cast<LoadInst>(&inst)){
            bbCoalAnalysisData->allLoadInstDeque.push_back(loadInst);
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

void coalPass::CoalPass::insertGlobalTidRegister(Function &F){
    /// TODO: determine order of blockindex, blockdim and localthreadindex
    int cnt = 0;
    int tid_cnt = 0, blockIdx_cnt = 0, blockDim_cnt = 0;
    for (auto &bb : F){
        for (auto &inst : bb){
            cnt ++;
            if (&inst == LocalTidRegister) tid_cnt = cnt;
            else if (&inst == BlockDimRegister) blockDim_cnt = cnt;
            else if (&inst == BlockIndexRegister) blockIdx_cnt = cnt;
        }
    }
    int min_val = max(max(tid_cnt, blockDim_cnt), max(blockDim_cnt, blockIdx_cnt));
    Instruction* insertAfter = nullptr;
    if (min_val == tid_cnt) insertAfter = LocalTidRegister;
    else if (min_val == blockIdx_cnt) insertAfter = BlockIndexRegister;
    else if (min_val == blockDim_cnt) insertAfter = BlockDimRegister;
    assert(insertAfter != nullptr && "InsertAfter must be one of three possible insts.");

    /// TODO: insert globalTid calculation
    // create BlockDim * BlockIndex
    BinaryOperator *multDimIndex = BinaryOperator::Create(Instruction::Mul, BlockDimRegister, BlockIndexRegister, "multDimIndex");
    multDimIndex->moveAfter(insertAfter);
    /// create threadIdx + multDimIndex
    BinaryOperator *globalTid = BinaryOperator::Create(Instruction::Add, multDimIndex, LocalTidRegister, "GlobalTID");
    globalTid->moveAfter(multDimIndex);
    GlobalTidRegister = globalTid;
}

void coalPass::CoalPass::run_coal(Function &F, FunctionAnalysisManager &FAM){
    bool debug = DEBUG;

    /// TODO: return if any loop is detected
    LoopAnalysis::Result &loopAnaResult = FAM.getResult<LoopAnalysis>(F);
    if (!loopAnaResult.empty()) return;

    /// TODO: find all stores in the function
    deque<StoreInst*> allStoreFuncDeque;
    findAllStoresPerFunc(F, allStoreFuncDeque);

    /// TODO: filter our stores that cannot be coalesced
    deque<CoalStore> allCoalStoreDeque;
    for (auto storeCand : allStoreFuncDeque){
        auto p = CoalStore::createCoalStoreOrNo(storeCand);
        if (!p.has_value()) continue;
        allCoalStoreDeque.push_back(p.value());
    }

    if (debug){
        sep_center("All CoalStores");
        for (auto cs : allCoalStoreDeque) {cs.print(); seperator(36, '-')}
        sep_center("All CoalStores Ends");

    }

    /// TODO: gather CoalStore with same pattern, arranged in groups
    deque<CoalStore> csCandidates(allCoalStoreDeque);
    deque<CoalStoreGroup*> coalStoreGroupingDeque;
    while (!csCandidates.empty()){
        CoalStore front = csCandidates.front();
        csCandidates.pop_front();
        CoalStoreGroup *sameCoalStoreFrontSet = new CoalStoreGroup;
        sameCoalStoreFrontSet->group.push_back(front);
        /// TODO: match @param front with the rest CoalStore in the deque
        deque<CoalStore> csCpy(csCandidates);
        deque<CoalStore> collector;
        for (auto elemStore : csCpy){
            if (elemStore.is_same(front)) {
                sameCoalStoreFrontSet->group.push_back(elemStore);
            }
            else {
                collector.push_back(elemStore);
            }
        }
        /// TODO: overwrite csCandidates with collector, which contains different CoalStore compared to front
        csCandidates = collector;
        /// TODO: if there are more than one CoalStore added to the same group as front, add that group into global pool
        if (sameCoalStoreFrontSet->group.size() > 1){
            coalStoreGroupingDeque.push_back(sameCoalStoreFrontSet);
        }
        else{
            delete sameCoalStoreFrontSet;
        }
    }

    if (debug) { for (auto e : coalStoreGroupingDeque) e->print();}

    /// TODO: for each CoalStore group, insert new offset calculation instruction before the original store
    insertGlobalTidRegister(F);

    /// TODO: alter or delete the original store. Substitude with new one
}


PreservedAnalyses coalPass::CoalPass::run(Function &F, FunctionAnalysisManager &FAM){
        // if (DEBUG &&  F.getName().str() != string("_Z26rgb_copy_array_interleavedPiS_"))  return PreservedAnalyses::all();
        if (DEBUG &&  F.getName().str() != string("_Z26rgb_smem_array_interleavedPiS_i"))  return PreservedAnalyses::all();
        run_coal(F, FAM);
        return PreservedAnalyses::all();
        // unit_test_ViableOffsetEquation_construction();
        // unit_test_distributive_transform();
        // return PreservedAnalyses::all();


        /// TODO: if function contains any loop, skip this function
        LoopAnalysis::Result &loopAnaResult = FAM.getResult<LoopAnalysis>(F);
        if (!loopAnaResult.empty()) return PreservedAnalyses::all();
        
        sep_center(F.getName());
        int bb_cnt = 0;
        for (auto &bb : F){
            bb_cnt ++;
            assert(bbCoalDataMap.find(&bb) == bbCoalDataMap.end());
            bbCoalDataMap[&bb] = new SingleBBCoalAnalysisData;

            runOnOneBB(&bb);
            // testGEPPointerAlias(&bb, FAM, F);
            // break;
            // testInst(&bb);
            // break;

            for (auto& inst:bb){
                // if (auto sext = dyn_cast<SExtInst>(&inst)){
                //     // printInfo(DEBUG, *sext, "\toperand0", sext->getOperand(0) );

                //     // for (auto i = sext->op_begin(); i != sext->op_end(); i++)
                //     //     printInfo(DEBUG, *sext, "\toperand", *i->get());
                // }
                // else if (AddOperator* addinst = dyn_cast<AddOperator>(&inst)){
                //     // printInfo(DEBUG, *addinst, "is instruction?\t", isa<Instruction>(addinst));
                //     // printAllOp(&inst);
                // }
                // else if (LoadInst* load = dyn_cast<LoadInst>(&inst)){
                // }
                // else if (AllocaInst* allcoa = dyn_cast<AllocaInst>(&inst)){
                //     // printAllOp(allcoa);
                // }
                // else if (CallInst* call = dyn_cast<CallInst>(&inst)){
                //     // printInfo(DEBUG, "callInst:\t", *call, "arg:\t", call->getCalledFunction()->getName());
                // }
                // if (GetElementPtrInst* GEP = dyn_cast<GetElementPtrInst>(&inst)){
                //     // printAllOp(GEP);
                //     if (GEP->getNumOperands() == 3){
                //         printAllOp(GEP);
                //         auto ptrOp = GEP->getPointerOperand();
                //         errs() << *ptrOp << '\n';
                //         if (auto addrop = dyn_cast<AddrSpaceCastOperator>(ptrOp)){
                //             errs() << *addrop->getPointerOperand() << '\n';
                //             auto addopPtr = addrop->getPointerOperand();
                //             errs() << addopPtr->getName() << '\n';
                //             // if (isa<Instruction>(addopPtr)) errs() << "inst\n";
                //             // else if (isa<Constant>(addopPtr)) errs() << "const\n";
                //             // if (isa<GlobalValue>(addopPtr)) errs() << "global\n";
                //             // else if(isa<ConstantExpr>(addopPtr)) errs() << "const expr\n";
                //             if (auto glob = dyn_cast<GlobalValue>(addopPtr)){
                //                 errs() << "addr space:\t" << glob->getAddressSpace() << '\n';
                //                 errs() << "visibility:\t" << glob->getVisibility() << '\n';
                //             }
                            
                //         }
                //         // errs() << *ptrOp << '\n';
                //         // if (isa<Operator>(ptrOp)) errs() << "operator\n";
                //         // else if (isa<Constant>(ptrOp)) errs() << "constant\n";
                //         // else if (isa<Argument>(ptrOp)) errs() << "argument\n";
                //         // printInfo(DEBUG, "gep's second argument\t" , *GEP->getOperand(1),"\tType\t", dyn_cast<ConstantInt>(GEP->getOperand(1))->isZero());
                //     }                    
                //     // printInfo(DEBUG, *GEP, "\tnumber of operands:\t", GEP->getNumOperands(), "\t", *GEP->getOperand(GEP->getNumOperands()-1));
                // }
                // else printInfo(DEBUG, inst.getOpcodeName());
            }

        }

       
        return PreservedAnalyses::all();
}

void coalPass::CoalPass::runOnOneBB(BasicBlock* targetBB){
      SingleBBCoalAnalysisData *bbCoalAnalysisData = bbCoalDataMap[targetBB];
      findAllLoadAndStorePerBB(targetBB, bbCoalAnalysisData);
      deque<CoalLoad> coalLoads;
      /// TODO: analysis all Loads
      for (auto loadInstCand : bbCoalAnalysisData->allLoadInstDeque){
        auto res = CoalLoad::createCoalLoadOrNo(loadInstCand);
        if (res.has_value()) { 
            errs() << "found!\n"; 
            auto v = res.value();
            coalLoads.push_back(v);
        }
      }
      sep_center("COALLOADS");
      errs() << "deque size:\t" << coalLoads.size() << "\n";
      for (auto l : coalLoads) {
        l.print();
        }
        sep_center("compare ptr src");
        auto front = coalLoads.front();
        for (auto l : coalLoads){
            if (front.srcPtrExpr == l.srcPtrExpr) errs() << "same src\n";
            else errs() << "Different src\n";
        }
      // for every store in this basicblock, check it's dest and src address. If both coming from getelementptr and offset related to TID, then this store can be coalesced
    //   for (StoreInst *storeInstCand : bbCoalAnalysisData->allStoreInstDeque){
    //       // check value operand
    //       Value *storeValueOperand = storeInstCand->getValueOperand();
    //       checkValueRegAddressIsArray(storeValueOperand, storeInstCand);
    //       // check pointer operand

    //   }
}



 optional<CoalAddressCalcChain> coalPass::CoalPass::checkValueRegAddressIsArray(Value* addressReg, StoreInst* parentStore){
    bool debug = DEBUG;
    // printInfo(debug, "parent store:\t", *parentStore);
    // printInfo(debug, "Value Address Reg Inst:\t", *addressReg);

     /** simplicity: if addressReg is not loadInst, disgard this coal chance **/
    // if (!isa<LoadInst>(addressReg)) return nullopt;

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
            /// TODO: analyse ptr operand of GEP
            printInfo(debug, "Pointer operand:\t", *valueOpGetElemPtrInst->getPointerOperand());
            // if ptr operand is not Instruction, we're done
            if (auto ptrOpInst = dyn_cast<Instruction>(valueOpGetElemPtrInst->getPointerOperand())){
                findAllContributorInstFIFO_helper(ptrOpInst);  
            }
            // ptrOperandAnalysisGEP_helper(valueOpGetElemPtrInst);

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
        else if (auto initPtrOpGEPInst = dyn_cast<Instruction>(initPtrOpGEP)){
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

deque<Instruction*> coalPass::CoalPass::findAllContributorInstFIFO_helper(Instruction* rootInst){
    bool debug = DEBUG;
    BasicBlock *parentBB = rootInst->getParent();
    deque<Value*> dependenceValueLeftDeque;
    unordered_set<Value*> allDependenceSet;
    Instruction *curInst = rootInst;
    if (debug){
        sep_center("findAllContributorInstFIFO_helper");
        errs() << "rootInst:\t" << *rootInst << '\n';
    }
    bool changed;
    do{ 
        changed = false;
        // add all source operand to the deque
        // printInfo(debug, "curInst:\t", *curInst);
        
        /// TODO: if it's alloca inst, find all stores that modifies this ptr location
        if (AllocaInst* alloca = dyn_cast<AllocaInst>(curInst)){
            // printInfo(debug, "found alloca:\t", *alloca);
            for (BasicBlock::iterator fwdStart = forwardPos_helper(alloca); fwdStart != forwardPos_helper(rootInst); fwdStart++){
                if (StoreInst* storeCand = dyn_cast<StoreInst>(&*fwdStart)){
                    if (storeCand->getPointerOperand() == alloca){
                        // printInfo(debug, "this store:\t", *storeCand, "\tmodifies:\t", *alloca);
                        dependenceValueLeftDeque.push_back(storeCand);
                        allDependenceSet.insert(storeCand);
                    }
                }
            }
        }
        for (auto op_iter = curInst->op_begin(); op_iter != curInst->op_end(); op_iter++){
            Value *srcOp = op_iter->get();
            if (allDependenceSet.find(srcOp) == allDependenceSet.end()){
                dependenceValueLeftDeque.push_back(srcOp);
                allDependenceSet.insert(srcOp);
                // printInfo(debug, "added src:\t", *srcOp);
            }
        }
        // pop deque to find new dependence for the front Instruction. Update curInst ptr
        Value* nextVal;
        do{
            nextVal = dependenceValueLeftDeque.front();
            // printInfo(debug, "nextVal:\t", *nextVal);
            if (Instruction* nextInst = dyn_cast<Instruction>(nextVal)){
                curInst = nextInst;
                changed = true;
                // printInfo(debug, "nextVal is Inst!");
            }
            dependenceValueLeftDeque.pop_front();
        }while(!isa<Instruction>(nextVal) && !dependenceValueLeftDeque.empty());


    }while(!dependenceValueLeftDeque.empty() || changed);

    // clear Set, eliminate those not in the range and those not of type Instruction
    unordered_set<Instruction*> dependentInstSetFiltered;  
    for (auto depValue : allDependenceSet){
        bool keep = false;
        if (Instruction* depInst = dyn_cast<Instruction>(depValue)){
            if (depInst->comesBefore(rootInst)) {
                dependentInstSetFiltered.insert(depInst);
            }
        }
    }

    // go through all Instruction from begin to rootInst, find contributing Inst
    deque<Instruction*> contributorFIFODeque;
    for (BasicBlock::iterator inst_iter = parentBB->begin(); inst_iter != forwardPos_helper(rootInst); inst_iter ++){
        if (dependentInstSetFiltered.find(&*inst_iter) != dependentInstSetFiltered.end()){
            contributorFIFODeque.push_back(&*inst_iter);
        }
    }
    if (debug){
        sep_center_idy('-', "dependence");
        for (auto inst : contributorFIFODeque){
            errs() << *inst << '\n';
        }
        sep_center_idy('-', "end");
    }
    return contributorFIFODeque;
}

void coalPass::CoalPass::findAllStoresPerFunc(Function &F, deque<StoreInst*> &allStoreFuncDeque){
    for (auto &BB : F){
        for (auto &inst : BB){
            if (auto store = dyn_cast<StoreInst>(&inst)){
                allStoreFuncDeque.push_back(store);
            }
        }
    }
}
