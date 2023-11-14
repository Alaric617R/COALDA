#include "coalMemOp.h"

unordered_set<const char*> OffsetAllowedOpcodeFSM{
    // unary op
     "sext",
    // binary op
     "add",
     "mul",
    // memory op
     "load",
     "store",
     "alloca",
    // call inst
     "call",
};

/*** local helpers ***/

/** allowed two types of GEP
 * 1. only one-dimensional offset. E.G, %17 = getelementptr inbounds i32, ptr %11, i64 %16
 * 2. twp-dimensional offset, but with GPU shared memory so the first one will be zero. E.G,   %129 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %128
 * */ 
optional<GEPWrapper> calcGEPCoalCandidate(GetElementPtrInst* gepInst){
    bool debug = false;
    if (gepInst->getNumOperands() == 2) {
        printInfo(debug, "operands 2\t", *gepInst);
        return std::make_optional(GEPWrapper{.GEP = gepInst, 
                                             .PointerOp = gepInst->getPointerOperand(), 
                                             .OffsetOp = gepInst->getOperand(1)
                                             });
    }
    // else the second argument should be zero
    else if (gepInst->getNumOperands() == 3 ){
        printInfo(debug, "operands 3\t", *gepInst);
        if (auto constInt = dyn_cast<ConstantInt>(gepInst->getOperand(1))){
            if (constInt->isZero()){
                return std::make_optional(GEPWrapper{.GEP = gepInst, 
                                        .PointerOp = gepInst->getPointerOperand(), 
                                        .OffsetOp = gepInst->getOperand(2)
                                        });
            }
        }
    }
    return nullopt;
}

void prettyPrintCalcTreeNodeHelper(const string& prefix, const CalcTreeNode* node, bool isFirst){
    string spaces(12, ' ');
    if (node != nullptr){
        errs() << prefix;
        errs() << (isFirst ? "├──" : "└──" );
        errs() << *node->inst << "\t\tExpr: " << node->nodeExpression.expr->str() << '\n';
        for (auto iter = node->childNodesSet.begin(); iter != node->childNodesSet.end(); iter ++){
            bool is_first = false;
            if (iter == node->childNodesSet.begin()){
                is_first = true;
            }
            prettyPrintCalcTreeNodeHelper(prefix + (isFirst ? "|" + spaces : spaces), *iter, is_first);
        }
    }
}

optional<CoalStore> CoalStore::createCoalStoreOrNo(StoreInst* storeCandInst){
    CoalStore coalStoreResult;
    coalStoreResult.origStoreInst = storeCandInst;

    /// TODO: analys value operand, must be CoalLoad
    if (LoadInst* valueOpLoadInst = dyn_cast<LoadInst>(storeCandInst->getValueOperand())){
        optional<CoalLoad> optionalLoad = CoalLoad::createCoalLoadOrNo(valueOpLoadInst);
        if (optionalLoad.has_value()) coalStoreResult.valOpCoalLoad = std::move(optionalLoad.value());
        else return nullopt;
    } else return nullopt;

    /// @note: reaching this point, coalStoreResult.valOpCoalLoad has been filled
    /// TODO: anaylse pointer operand
    optional<CoalPointerOpAnalysisResult> CPAresult = analysePointerOperand(storeCandInst->getPointerOperand());
    if (!CPAresult.has_value()) return nullopt;

    /// TODO: check if equation of pointer source an value operand are the same
    /// @note: consider variant for shared memory
    coalStoreResult.
}
optional<CoalLoad> CoalLoad::createCoalLoadOrNo(LoadInst* loadCandInst){
    
    bool debug = DEBUG;
    CoalLoad coalLoadResult;
    coalLoadResult.origLoadInst = loadCandInst;

    printInfo(debug, "Considering load:\t", *loadCandInst);
    /** @attention: if this load is not meant for store only, then cannot be coalesced
     *  @remark if this load is meant for calculation, we cannot make sure the computation is uniform across that piece of memory
     *  @brief find the def-use chain of this load and make sure there are only stores and loads
    */
    for (auto user : loadCandInst->users()){
        if ( (!isa<LoadInst>(user)) && !(isa<StoreInst>(user))) {
            printInfo(debug, *loadCandInst,"\thas user:\t", *user, "\tcannot be Coaled.");
            return nullopt;
        }
    }
    
    /// TODO: analyse load pointer operand
    optional<CoalPointerOpAnalysisResult> CPAresult = analysePointerOperand(loadCandInst->getPointerOperand());
    if (!CPAresult.has_value()) return nullopt;

    /// TODO: construct CoalLoad
    coalLoadResult.offsetEquation = CPAresult.value().offsetEquation;
    coalLoadResult.srcPtrExpr = CPAresult.value().srcPtrExpr;

    return coalLoadResult;

}

bool computerSrcPtrDependenceTree(CalcTreeNode* root){
    assert(root->inst != nullptr);
    bool ret_flag = true;
    // terminator: global variable, e.g,  ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr)
    if (AddrSpaceCastOperator* addrCastOp = dyn_cast<AddrSpaceCastOperator>(root->inst)){
        if (GlobalValue* ptrSrc = dyn_cast<GlobalValue>(addrCastOp->getPointerOperand())){
            return true;
        }
        return false;
    }
    // unary: sext
    if (SExtInst* sextInst = dyn_cast<SExtInst>(root->inst)){
        CalcTreeNode* sextChildNode = new CalcTreeNode;
        CalcTreeNode::setupCalcTreeNode(sextChildNode, sextInst->getOperand(0), root);
        root->childNodesSet.insert(sextChildNode);
        return computerSrcPtrDependenceTree(sextChildNode);
    }
    // unary: load
    else if (LoadInst* loadInst = dyn_cast<LoadInst>(root->inst)){
        CalcTreeNode* loadChildNode = new CalcTreeNode;
        CalcTreeNode::setupCalcTreeNode(loadChildNode, loadInst->getPointerOperand(), root);
        root->childNodesSet.insert(loadChildNode);
        return  computerSrcPtrDependenceTree(loadChildNode);
    }
    // memory: alloca. No children, can be pointer source address directly if no store in between is found
    /// @note We're assuming that alloca can only be child of LoadInst
    else if (AllocaInst* allocaInst = dyn_cast<AllocaInst>(root->inst)){
        bool storeFound = false;
        assert(isa<LoadInst>(root->parentNode->inst) && "parent of alloca is not load in computing source ptr for LoadInst!");
        // find nearest store in reverse order
        for (BasicBlock::reverse_iterator revStart = reversePos_helper(dyn_cast<Instruction>(root->parentNode->inst));
                                          revStart != reversePos_helper(allocaInst); 
                                          revStart ++){
            if (StoreInst* storeCand = dyn_cast<StoreInst>(&*revStart)){
                // if this store modify this alloca ptr, squash the alloca node and substitude with the Value operand of store
                if (storeCand->getPointerOperand() == allocaInst){
                    storeFound = true;
                    root->parentNode->childNodesSet.erase(root);
                    // create new child node for the parent, targeting this store's Value operand
                    CalcTreeNode* storeValueChildNode = new CalcTreeNode;
                    CalcTreeNode::setupCalcTreeNode(storeValueChildNode, storeCand->getValueOperand(), root->parentNode);
                    root->parentNode->childNodesSet.insert(storeValueChildNode);
                    ret_flag = computerSrcPtrDependenceTree(storeValueChildNode);
                    delete root;
                    break;
                }
            }
        }
        // alloca inst as end point
        if (storeFound) ret_flag = true;
        return ret_flag;
    }
    // addr of array may stored in Argument
    else if (Argument *arg = dyn_cast<Argument>(root->inst)){
        return true;
    }
    // don't bother to deal with other type of instructions
    else {
        return false;
    }
}

void CalcTreeNode::calcPtrSrc(CalcTreeNode* root){
    if (root != nullptr){
        /// TODO: calculate child node expr first
        for (auto childNode : root->childNodesSet){
            calcPtrSrc(childNode);
        }
        /// TODO: calculate root's expr based on child nodes' expr
        // sext, expr same as children's
        if (isa<SExtInst>(root->inst)){
            assert(root->childNodesSet.size() == 1 && "sext instruction should have exactly one child node!");
            root->nodeExpression = (*root->childNodesSet.begin())->nodeExpression;
        }
        else if (isa<LoadInst>(root->inst)){
            assert(root->childNodesSet.size() == 1 && "load instruction should have exactly one child node!");
            root->nodeExpression = (*root->childNodesSet.begin())->nodeExpression;
        }
        // terminator: Argument.
        else if (Argument *arg = dyn_cast<Argument>(root->inst)){
            assert(root->childNodesSet.size() == 0 && "Argument type should have no child node!");
            root->nodeExpression.expr = std::make_shared<ConstArgExprAST>(CoalMemConstExprASTToken_t::Argument, arg);
        }
        else if (AllocaInst* alloca = dyn_cast<AllocaInst>(root->inst)){
            assert(root->childNodesSet.size() == 0 && "Alloca type should have no child node!");
            root->nodeExpression.expr = std::make_shared<ConstArgExprAST>(CoalMemConstExprASTToken_t::Alloca, alloca);
        }
        else if (AddrSpaceCastOperator* addrCastOp = dyn_cast<AddrSpaceCastOperator>(root->inst)){
            if (GlobalValue* ptrSrc = dyn_cast<GlobalValue>(addrCastOp->getPointerOperand())){
            root->nodeExpression.expr = std::make_shared<ConstArgExprAST>(CoalMemConstExprASTToken_t::GlobalVariable, ptrSrc);
            }
            else {
                assert(false && "AddrSpaceCastOperator doesn't involve global shared memory!");
            }
        }
        // other type of instructions are treated as unknown
        else {
            errs() << *root->inst << "\t is not supported in source ptr addr calculation!\n";
            assert(0 && "Unsupported instruction in CalcTreeNode source ptr!");
        }
    }
}

// function caller should initialize root node by:
// 1. filling inst
// 2. set parent to Null
/// @return true if this offset is related parallel structure (can be coalesced)
bool computeValueDependenceTree(CalcTreeNode* root){
    errs() << "root:\t" << *root->inst << '\n';
    assert(root->inst != nullptr);
    /// TODO: recursion termination condition
    /// @note: Can be Argument
    // if (!isa<Instruction>(root->inst)) return false; 
    // or instruction type is callInst or Un-interested type
    /// TODO: FSM of different instructions
    bool ret_flag = false;
    // unary: sext
    if (SExtInst* sextInst = dyn_cast<SExtInst>(root->inst)){
        CalcTreeNode* sextChildNode = new CalcTreeNode;
        CalcTreeNode::setupCalcTreeNode(sextChildNode, sextInst->getOperand(0), root);
        root->childNodesSet.insert(sextChildNode);
        return false || computeValueDependenceTree(sextChildNode);
    }
    // binary: add, mul
    else if(isa<AddOperator>(root->inst) || isa<MulOperator>(root->inst)){
        ret_flag = false;
        auto binaryOp = dyn_cast<Instruction>(root->inst);
        // go through all operands of add
        for (auto op_iter = binaryOp->op_begin(); op_iter != binaryOp->op_end(); op_iter ++){
            CalcTreeNode* binaryChildNode = new CalcTreeNode;
            CalcTreeNode::setupCalcTreeNode(binaryChildNode, op_iter->get(), root);
            root->childNodesSet.insert(binaryChildNode);
            ret_flag = ret_flag || computeValueDependenceTree(binaryChildNode);
        }
        return ret_flag;
    }
    // unary: load
    else if (LoadInst* loadInst = dyn_cast<LoadInst>(root->inst)){
        CalcTreeNode* loadChildNode = new CalcTreeNode;
        CalcTreeNode::setupCalcTreeNode(loadChildNode, loadInst->getPointerOperand(), root);
        root->childNodesSet.insert(loadChildNode);
        return false || computeValueDependenceTree(loadChildNode);
    }
    // memory: alloca. No children, need to squash to nearest store
    else if (AllocaInst* allocaInst = dyn_cast<AllocaInst>(root->inst)){
        // errs() << *allocaInst << '\n';
        assert(root->parentNode != nullptr);
        assert(isa<Instruction>(root->inst));
        assert(isa<Instruction>(root->parentNode->inst) && "Parent of alloca must be Instruction!");
        // find nearest store in reverse order, if in SAME BB
        if (allocaInst->getParent() == dyn_cast<Instruction>(root->parentNode->inst)->getParent()){
            for (BasicBlock::reverse_iterator revStart = reversePos_helper(dyn_cast<Instruction>(root->parentNode->inst));
                                            revStart != reversePos_helper(allocaInst); 
                                            revStart ++){
                                                errs() << "going through:\t" << (*revStart) << '\n';
                if (StoreInst* storeCand = dyn_cast<StoreInst>(&*revStart)){
                    // if this store modify this alloca ptr, squash the alloca node and substitude with the Value operand of store
                    if (storeCand->getPointerOperand() == allocaInst){
                        root->parentNode->childNodesSet.erase(root);
                        // create new child node for the parent, targeting this store's Value operand
                        CalcTreeNode* storeValueChildNode = new CalcTreeNode;
                        CalcTreeNode::setupCalcTreeNode(storeValueChildNode, storeCand->getValueOperand(), root->parentNode);
                        root->parentNode->childNodesSet.insert(storeValueChildNode);
                        ret_flag = computeValueDependenceTree(storeValueChildNode);
                        delete root;
                        break;
                    }
                }
            }
        }
        else{
            // order of user if from back of the function to front. Need early break
            for (auto ee : allocaInst->users()) {
                if (StoreInst* storeCand = dyn_cast<StoreInst>(ee)){
                    // if this store modify this alloca ptr, squash the alloca node and substitude with the Value operand of store
                    if (storeCand->getPointerOperand() == allocaInst){
                        root->parentNode->childNodesSet.erase(root);
                        // create new child node for the parent, targeting this store's Value operand
                        CalcTreeNode* storeValueChildNode = new CalcTreeNode;
                        CalcTreeNode::setupCalcTreeNode(storeValueChildNode, storeCand->getValueOperand(), root->parentNode);
                        root->parentNode->childNodesSet.insert(storeValueChildNode);
                        ret_flag = computeValueDependenceTree(storeValueChildNode);
                        delete root;
                        break;
                    }
                }
            }
        }

        return ret_flag;
    }
    // Terminate point: callInst (no children)
    else if (CallInst* callInst = dyn_cast<CallInst>(root->inst)){
        if (callInst->getCalledFunction()->getName().str() == "llvm.nvvm.read.ptx.sreg.tid.x"){
            ret_flag = true;
        }
        else ret_flag = false;
        return ret_flag;
    }
    else if (Argument *arg = dyn_cast<Argument>(root->inst)){
        return false;
    }
    // don't bother to deal with other type of instructions
    else {
        return false;
    }


}

/// traverse CalcTreeNode, calculate each node's CoalMemExprAST
void CalcTreeNode::calcOffsetEquation(CalcTreeNode* root){
    if (root != nullptr){
        /// TODO: calculate child node expr first
        for (auto childNode : root->childNodesSet){
            calcOffsetEquation(childNode);
        }
        /// TODO: calculate root's expr based on child nodes' expr
        // sext, expr same as children's
        if (isa<SExtInst>(root->inst)){
            assert(root->childNodesSet.size() == 1 && "sext instruction should have exactly one child node!");
            root->nodeExpression = (*root->childNodesSet.begin())->nodeExpression;
        }
        else if (isa<LoadInst>(root->inst)){
            assert(root->childNodesSet.size() == 1 && "load instruction should have exactly one child node!");
            root->nodeExpression = (*root->childNodesSet.begin())->nodeExpression;
        }
        // add, add two children's expr
        else if (isa<AddOperator>(root->inst)){
            assert(root->childNodesSet.size() == 2 && "add instruction should have exactly two child nodes!");
            auto operand1 = (*root->childNodesSet.begin())->nodeExpression.expr;
            auto operand2 = (*(++root->childNodesSet.begin()))->nodeExpression.expr;
            root->nodeExpression.expr = std::make_shared<BinaryExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Add, operand1, operand2));
        }
        // mult, multiply two children's expr
        else if (isa<MulOperator>(root->inst)){
            assert(root->childNodesSet.size() == 2 && "mult instruction should have exactly two child nodes!");
            auto operand1 = (*root->childNodesSet.begin())->nodeExpression.expr;
            auto operand2 = (*(++root->childNodesSet.begin()))->nodeExpression.expr;
            root->nodeExpression.expr = std::make_shared<BinaryExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Mult, operand1, operand2));
        }
        // terminator: constant int
        else if (auto constIntExpr = dyn_cast<ConstantInt>(root->inst)){
            assert(root->childNodesSet.size() == 0 && "constant int instruction should have no child node!");
            root->nodeExpression.expr = std::make_shared<ConstIntExprAST>(constIntExpr->getSExtValue());
        }
        // terminator: callInst. Convert to prototype token
        else if (auto callInstExpr = dyn_cast<CallInst>(root->inst)){
            assert(root->childNodesSet.size() == 0 && "call instruction should have no child node!");
            CoalMemPrototyeASTToken_t protoToken;
            if (callInstExpr->getCalledFunction()->getName() == "llvm.nvvm.read.ptx.sreg.tid.x") protoToken = CoalMemPrototyeASTToken_t::ThreadIndex;
            else if (callInstExpr->getCalledFunction()->getName() == "llvm.nvvm.read.ptx.sreg.ntid.x") protoToken = CoalMemPrototyeASTToken_t::BlockDim;
            else if (callInstExpr->getCalledFunction()->getName() == "llvm.nvvm.read.ptx.sreg.ctaid.x") protoToken = CoalMemPrototyeASTToken_t::BlockIndex;
            else assert(0 && string("Unsupported called function:\t" + callInstExpr->getCalledFunction()->getName().str()).c_str());
            root->nodeExpression.expr = std::make_shared<PrototypeExprAST>(protoToken);
        }
        // terminator: Argument.
        else if (Argument *arg = dyn_cast<Argument>(root->inst)){
            assert(root->childNodesSet.size() == 0 && "Argument type should have no child node!");
            root->nodeExpression.expr = std::make_shared<ConstArgExprAST>(CoalMemConstExprASTToken_t::Argument, arg);
        }
        // other type of instructions are treated as unknown
        else {
            errs() << *root->inst << "\t is not supported in ptr offset calculation!\n";
            assert(0 && "Unsupported instruction in CalcTreeNode ptr offset!");
        }
    }
}

/** AST non-trivial method**/

void BinaryExprAST::exchangeAddMultNodes(BinaryExprAST* multParent, BinaryExprAST* addChild, bool isLeftChild){
    assert( (isLeftChild && multParent->lhs.get() == addChild)  || ( !isLeftChild && multParent->rhs.get() == addChild));
    shared_ptr<CoalMemExprAST> addNodeLHS = addChild->lhs;
    shared_ptr<CoalMemExprAST> addNodeRHS = addChild->rhs;
    shared_ptr<CoalMemExprAST> multChildToKeep = (isLeftChild) ? multParent->rhs : multParent->lhs;
    // clone a new mult, with add RHS
    BinaryExprAST* rightClonedMultExpr = new BinaryExprAST(CoalMemBinaryASTToken_t::Mult, addNodeRHS, multChildToKeep);
    // modify current mult, keep the other child, change child that points to add
    if (isLeftChild){
        multParent->lhs = addNodeLHS;
    }
    else {
        multParent->rhs = addNodeLHS;
    }
    // substitude add node with two mults
    addChild->lhs = shared_ptr<BinaryExprAST>(multParent);
    addChild->rhs = shared_ptr<BinaryExprAST>(rightClonedMultExpr);
};




// helper

bool operator==(const ViableOffsetEquation& lhs, const ViableOffsetEquation& rhs){
    return (lhs.stride == rhs.stride && lhs.offset == rhs.offset && lhs.batchedTID == rhs.batchedTID);
}

bool CalcTreeNode::opcodeInFSM(Value* inst){
    
    if(!isa<Instruction>(inst)) return false;
    Instruction* instCasted = dyn_cast<Instruction>(inst);
    if (OffsetAllowedOpcodeFSM.find(instCasted->getOpcodeName()) != OffsetAllowedOpcodeFSM.end()) return true;
    else return false;
}

void CalcTreeNode::setupCalcTreeNode(CalcTreeNode* curNode, Value* inst, CalcTreeNode* parentNode){
    curNode->inst = inst;
    curNode->parentNode = parentNode;
}

void CalcTreeNode::prettyPrint(){
    if (this->inst != nullptr){
        prettyPrintCalcTreeNodeHelper("", this, false);
    }
    
}

void CalcTreeNode::freeTreeNodes(CalcTreeNode* root_to_free){
    // free children
    for (auto child : root_to_free->childNodesSet){
        freeTreeNodes(child);
    }
    delete root_to_free;
}
// return the reverse iterator to the parent basicblock of inst that matches its position
BasicBlock::reverse_iterator reversePos_helper(Instruction* inst){
        BasicBlock *parentBB = inst->getParent();
        BasicBlock::reverse_iterator revStart = parentBB->rend();
        for (BasicBlock::reverse_iterator curBack = parentBB->rbegin(); curBack != parentBB->rend(); curBack++){
            if (&(*curBack) == inst) {revStart=curBack; break;}
        }
        return revStart;
}

BasicBlock::iterator         forwardPos_helper(Instruction* inst){
        BasicBlock *parentBB = inst->getParent();
        BasicBlock::iterator fwdStart = parentBB->end();
        for (BasicBlock::iterator i = parentBB->begin(); i != parentBB->end(); i++){
            if (&(*i) == inst) {fwdStart=i; break;}
        }
        return fwdStart;
}


optional<ViableOffsetEquation> ViableOffsetEquation::constructFromOffsetExprOrNo(deque<shared_ptr<CoalMemExprAST>> exprsDeque){
    bool debug = !DEBUG;
    ViableOffsetEquation offsetEquation;
    bool threadIdParsed = false;
    bool globalTIDParsed = false;
    bool StrideOffsetParsed = false;
    int strideFromLocalThreadID = -1;
    int strideFromTID = -2;
    int curOffset = 0;
    for (auto expr : exprsDeque){
        printInfo(debug, "inspecting:\t", expr->str());
        if (BinaryExprAST* binaryOp = dynamic_cast<BinaryExprAST*>(expr.get())){
            assert( binaryOp->type() == CoalMemBinaryASTToken_t::Mult && "In parsing for ViableOffsetEquation, no ADD is expected!");
            auto unitExprs = BinaryExprAST::expandNodes(std::make_shared<BinaryExprAST>(*binaryOp));
            assert(unitExprs.has_value() && "This multiply is not fully distributed upon!");
            auto Exprs = unitExprs.value();
            /// TODO: find if this contains threadId related
            int constMultResult = 1;
            bool isThreadIdBlock = false;
            // because we expect to see both BlockDim and BlockIndex
            std::pair<int,int> isGloabalTIDBlock = std::make_pair(0, 0);
            for (auto sub_expr : Exprs){
                
                if (auto protoOp = dynamic_cast<PrototypeExprAST*>(sub_expr.get())){
                    if (protoOp->get_token() == CoalMemPrototyeASTToken_t::ThreadIndex) isThreadIdBlock = true;
                    else if (protoOp->get_token() == CoalMemPrototyeASTToken_t::BlockDim) isGloabalTIDBlock.first += 1;
                    else if (protoOp->get_token() == CoalMemPrototyeASTToken_t::BlockIndex) isGloabalTIDBlock.second += 1;
                }
                else if (auto constOp = dynamic_cast<ConstIntExprAST*>(sub_expr.get()))  constMultResult *= constOp->get_value();
                else assert(false && "leaf expression cannot be any other type!");
            }
            if ( !threadIdParsed && isThreadIdBlock && isGloabalTIDBlock.first == 0 && isGloabalTIDBlock.second == 0){
                threadIdParsed = true;
                strideFromLocalThreadID = constMultResult;
                if (strideFromLocalThreadID == 1) return nullopt;
            } 
            else if (!globalTIDParsed && !isThreadIdBlock && isGloabalTIDBlock.first == 1 && isGloabalTIDBlock.second == 1){
                globalTIDParsed = true;
                strideFromTID = constMultResult;
            }
            else if (!isThreadIdBlock && isGloabalTIDBlock.first == 0 && isGloabalTIDBlock.second == 0){
                curOffset += constMultResult;
            }
            else return nullopt;
        }
        else if (ConstIntExprAST* constOp = dynamic_cast<ConstIntExprAST*>(expr.get())){
            curOffset += constOp->get_value();
        }
        else {
            return nullopt;
        }
    }
    // stride from local threadId should be same of global threadId
    if (strideFromLocalThreadID != strideFromTID) return nullopt;
    // no threadId, no parallellism
    if (!threadIdParsed) return nullopt;

    offsetEquation.batchedTID = globalTIDParsed;
    offsetEquation.offset = curOffset;
    offsetEquation.stride = strideFromLocalThreadID;
    
    return offsetEquation;

}


optional<CoalPointerOpAnalysisResult> analysePointerOperand(Value* ptrOperand){
    bool debug = DEBUG;
    printInfo(debug, "Analysing Ptr Operand:\t", *ptrOperand);
    CoalPointerOpAnalysisResult CPAresult;

    /// @note if this pointer operand is not from GEP, cannot be Coaled
    if (!isa<GetElementPtrInst>(ptrOperand)) return nullopt;
    GetElementPtrInst* ptrAddrGEPInst = dyn_cast<GetElementPtrInst>(ptrOperand);
    /** allowed two types of GEP
     * 1. only one-dimensional offset. E.G, %17 = getelementptr inbounds i32, ptr %11, i64 %16
     * 2. twp-dimensional offset, but with GPU shared memory so the first one will be zero. E.G,   %129 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %128
     * */ 
    GEPWrapper ptrAddrGEPWrapper;
    if (!calcGEPCoalCandidate(ptrAddrGEPInst).has_value()) return nullopt;
    else ptrAddrGEPWrapper = std::move(calcGEPCoalCandidate(ptrAddrGEPInst).value());
    printInfo(debug, "GEP source starts:\t", *ptrAddrGEPWrapper.PointerOp, "\toffset starts:\t", *ptrAddrGEPWrapper.OffsetOp);

    /// TODO: build offset calculation tree
    Value* offsetOp = ptrAddrGEPWrapper.OffsetOp;
    CalcTreeNode* offsetCalcRoot = new CalcTreeNode;
    CalcTreeNode::setupCalcTreeNode(offsetCalcRoot, offsetOp, nullptr);
    if (!computeValueDependenceTree(offsetCalcRoot)){
        printInfo(debug, *ptrAddrGEPInst, "\t is impossible to be coalesced b/c no parallel structure is found.");
        return nullopt;
    }

    /// TODO: calculate offset AST expression
    
    CalcTreeNode::calcOffsetEquation(offsetCalcRoot);
    if (debug) offsetCalcRoot->prettyPrint();
    if (auto binaryOp = dynamic_cast<BinaryExprAST*>(offsetCalcRoot->nodeExpression.expr.get())){

        /// TODO: apply distributive rule and make all multiply children of any add
        shared_ptr<BinaryExprAST> distributiveForm = BinaryExprAST::distributiveTransform(make_shared<BinaryExprAST>(*binaryOp));
        
        /// TODO: construct @param ViableOffsetEquation by traversing distributive form
        deque<shared_ptr<CoalMemExprAST>> subExprsDeque = BinaryExprAST::extractSubMultExprsFromDistForm(distributiveForm);
        auto potentialEqCand = ViableOffsetEquation::constructFromOffsetExprOrNo(subExprsDeque);

        /// TODO: check if the above contains value. If not, master load/store cannot be coalesced
        if (!potentialEqCand.has_value()) return nullopt;
        CPAresult.offsetEquation = potentialEqCand.value();
    }
    /** @note if it's not binary, we don't consider it to be coalescable b/c it should be itself coalesced **/
    else return nullopt;
    printInfo(debug, "Source GEP:\t", *ptrAddrGEPInst);
    if (debug) offsetCalcRoot->prettyPrint();

    /// TODO: extract GEP pointer Op source dependence tree
    Value* ptrOp = ptrAddrGEPWrapper.PointerOp;
    CalcTreeNode* ptrOpCalcRoot = new CalcTreeNode;
    CalcTreeNode::setupCalcTreeNode(ptrOpCalcRoot, ptrOp, nullptr);
    if ( !computerSrcPtrDependenceTree(ptrOpCalcRoot)){
        printInfo(debug, *ptrAddrGEPInst, "\t is impossible to be coalesced b/c source addr.");
        return nullopt;
    }
    /// TODO: find ptr Op source expression
    CalcTreeNode::calcPtrSrc(ptrOpCalcRoot);
    printInfo(debug, "Source GEP:\t", *ptrAddrGEPInst);
    if (debug) ptrOpCalcRoot->prettyPrint();
    if (auto src = dynamic_cast<ConstArgExprAST*>(ptrOpCalcRoot->nodeExpression.expr.get())){
        CPAresult.srcPtrExpr = *src;
    }
    else return nullopt;

    return CPAresult;

}
