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

optional<CoalLoad> createCoalLoadOrNo(LoadInst* loadCandInst){
    bool debug = DEBUG;
    /// @note if this load is not from GEP, cannot be Coaled
    if (!isa<GetElementPtrInst>(loadCandInst->getPointerOperand())) return nullopt;
    GetElementPtrInst* loadAddrGEPInst = dyn_cast<GetElementPtrInst>(loadCandInst->getPointerOperand());
    /** allowed two types of GEP
     * 1. only one-dimensional offset. E.G, %17 = getelementptr inbounds i32, ptr %11, i64 %16
     * 2. twp-dimensional offset, but with GPU shared memory so the first one will be zero. E.G,   %129 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %128
     * */ 
    GEPWrapper loadAddrGEPWrapper;
    if (!calcGEPCoalCandidate(loadAddrGEPInst).has_value()) return nullopt;
    else loadAddrGEPWrapper = std::move(calcGEPCoalCandidate(loadAddrGEPInst).value());

    /// TODO: build offset calculation tree
    Value* offsetOp = loadAddrGEPWrapper.OffsetOp;
    CalcTreeNode* offsetCalcRoot = new CalcTreeNode;
    CalcTreeNode::setupCalcTreeNode(offsetCalcRoot, offsetOp, nullptr);
    if (!computeValueDependenceTree(offsetCalcRoot)){
        printInfo(debug, *loadAddrGEPInst, "\t is impossible to be coalesced.");
        return nullopt;
    }
    /// TODO: calculate offset AST expression
    CalcTreeNode::calcOffsetEquation(offsetCalcRoot);
    printInfo(debug, "Source GEP:\t", *loadAddrGEPInst);
    if (auto binaryOp = dynamic_cast<BinaryExprAST*>(offsetCalcRoot->nodeExpression.expr.get())){
        // offsetCalcRoot->nodeExpression.expr =  BinaryExprAST::distributiveTransform(shared_ptr<CoalMemExprAST>(binaryOp));
        // if (debug) errs() << offsetCalcRoot->nodeExpression.expr->str() << '\n';
    }
    // if (debug) offsetCalcRoot->prettyPrint();

    /// TODO: extract GEP pointer Op source dependence tree
    Value* ptrOp = loadAddrGEPWrapper.PointerOp;
    CalcTreeNode* ptrOpCalcRoot = new CalcTreeNode;
    CalcTreeNode::setupCalcTreeNode(ptrOpCalcRoot, ptrOp, nullptr);
    computeValueDependenceTree(ptrOpCalcRoot);
    /// TODO: find ptr Op source expression
    CalcTreeNode::calcOffsetEquation(ptrOpCalcRoot);
    // printInfo(debug, "Source GEP:\t", *loadAddrGEPInst);
    // if (debug) ptrOpCalcRoot->prettyPrint();



    return nullopt;
}

// function caller should initialize root node by:
// 1. filling inst
// 2. set parent to Null
/// @return true if this offset is related parallel structure (can be coalesced)
bool computeValueDependenceTree(CalcTreeNode* root){
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
        assert(root->parentNode != nullptr);
        assert(isa<Instruction>(root->inst));
        // find nearest store in reverse order
        for (BasicBlock::reverse_iterator revStart = reversePos_helper(dyn_cast<Instruction>(root->parentNode->inst));
                                          revStart != reversePos_helper(allocaInst); 
                                          revStart ++){
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
            errs() << *root->inst << "\t is not supported!\n";
            assert(0 && "Unsupported instruction in CalcTreeNode!");
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
    // reset parent ptr
    addChild->parent = multParent->parent;
    multParent->parent = shared_ptr<BinaryExprAST>(addChild);
    rightClonedMultExpr->parent = shared_ptr<BinaryExprAST>(addChild);

};
// shared_ptr<CoalMemExprAST> BinaryExprAST::distributiveTransform(shared_ptr<CoalMemExprAST> root){
//     bool debug = DEBUG;
//     // terminator: constExpr
//     ConstExprAST* constExpr = dynamic_cast<ConstExprAST*>(root.get());
//     if (constExpr != nullptr) return root;
//     // binary operator: interesting stuff
//     BinaryExprAST* curNodeBinaryExpr = dynamic_cast<BinaryExprAST*>(root.get());
//     if (curNodeBinaryExpr != nullptr){
//         bool isCurMult = (curNodeBinaryExpr->op == CoalMemBinaryASTToken_t::Mult);
//         /// TODO: preorder traversal, first left child
//         BinaryExprAST* lhsBinaryOp = dynamic_cast<BinaryExprAST*>(curNodeBinaryExpr->lhs.get());
//         BinaryExprAST* rhsBinaryOp = dynamic_cast<BinaryExprAST*>(curNodeBinaryExpr->rhs.get());
//         bool leftFixdown = (isCurMult && lhsBinaryOp != nullptr && lhsBinaryOp->op == CoalMemBinaryASTToken_t::Add);
//         bool rightFixDown = (isCurMult && rhsBinaryOp != nullptr && rhsBinaryOp->op == CoalMemBinaryASTToken_t::Add);
//         /// TODO: find (b+c) * a pattern
//         if (leftFixdown){
//             shared_ptr<CoalMemExprAST>   a = curNodeBinaryExpr->rhs;
//             shared_ptr<CoalMemExprAST>   b = lhsBinaryOp->lhs;
//             shared_ptr<CoalMemExprAST>   c = lhsBinaryOp->rhs;
//             /// TODO: construct a*b + a*c
//             shared_ptr<CoalMemExprAST>  ab = std::make_shared<CoalMemExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Mult, a, b));
//             shared_ptr<CoalMemExprAST>  ac = std::make_shared<CoalMemExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Mult, a, c));
            
//             // expanded form
//             shared_ptr<CoalMemExprAST>  expansion = std::make_shared<CoalMemExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Add, ab, ac));
//             std::cout << expansion->str() << endl << flush;
//             return distributiveTransform(expansion);
//         }
//         /// TODO: find a * (b+c) pattern
//         else if (rightFixDown){
//             shared_ptr<CoalMemExprAST>   a = curNodeBinaryExpr->lhs;
//             shared_ptr<CoalMemExprAST>   b = rhsBinaryOp->lhs;
//             shared_ptr<CoalMemExprAST>   c = rhsBinaryOp->rhs;
//             /// TODO: construct a*b + a*c
//             shared_ptr<CoalMemExprAST>  ab = std::make_shared<CoalMemExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Mult, a, b));
//             shared_ptr<CoalMemExprAST>  ac = std::make_shared<CoalMemExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Mult, a, c));
            
//             // expanded form
//             shared_ptr<CoalMemExprAST>  expansion = std::make_shared<CoalMemExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Add, ab, ac));
//             printInfo(debug, expansion->str());
//             return distributiveTransform(expansion);
//         }

//         if (curNodeBinaryExpr->lhs != nullptr){
//             curNodeBinaryExpr->lhs = distributiveTransform(curNodeBinaryExpr->lhs);
//         }
//         if (curNodeBinaryExpr->rhs != nullptr){
//             curNodeBinaryExpr->rhs = distributiveTransform(curNodeBinaryExpr->rhs);
//         }
        
        

        
//     }
//     return root;

// }

shared_ptr<BinaryExprAST> BinaryExprAST::distributiveTransform(shared_ptr<BinaryExprAST> root){
    bool debug = DEBUG;
    // terminator: constExpr
    ConstExprAST* constExpr = dynamic_cast<ConstExprAST*>(root.get());
    if (constExpr != nullptr) return root;
    // binary operator: interesting stuff
    BinaryExprAST* curNodeBinaryExpr = dynamic_cast<BinaryExprAST*>(root.get());
    if (curNodeBinaryExpr != nullptr){
        bool isCurMult = (curNodeBinaryExpr->op == CoalMemBinaryASTToken_t::Mult);
        /// TODO: preorder traversal, first left child
        BinaryExprAST* lhsBinaryOp = dynamic_cast<BinaryExprAST*>(curNodeBinaryExpr->lhs.get());
        BinaryExprAST* rhsBinaryOp = dynamic_cast<BinaryExprAST*>(curNodeBinaryExpr->rhs.get());
        bool leftFixdown = (isCurMult && lhsBinaryOp != nullptr && lhsBinaryOp->op == CoalMemBinaryASTToken_t::Add);
        bool rightFixDown = (isCurMult && rhsBinaryOp != nullptr && rhsBinaryOp->op == CoalMemBinaryASTToken_t::Add);
        /// TODO: find (b+c) * a pattern
        if (leftFixdown){
            shared_ptr<CoalMemExprAST>   a = curNodeBinaryExpr->rhs;
            shared_ptr<CoalMemExprAST>   b = lhsBinaryOp->lhs;
            shared_ptr<CoalMemExprAST>   c = lhsBinaryOp->rhs;
            /// TODO: construct a*b + a*c
            shared_ptr<BinaryExprAST>  ab = std::make_shared<BinaryExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Mult, a, b));
            shared_ptr<BinaryExprAST>  ac = std::make_shared<BinaryExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Mult, a, c));
            
            // expanded form
            shared_ptr<BinaryExprAST>  expansion = std::make_shared<BinaryExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Add, ab, ac));
            printInfo(debug, "left:\t" , expansion->str());
            return distributiveTransform(expansion);
        }
        /// TODO: find a * (b+c) pattern
        else if (rightFixDown){
            shared_ptr<CoalMemExprAST>   a = curNodeBinaryExpr->lhs;
            shared_ptr<CoalMemExprAST>   b = rhsBinaryOp->lhs;
            shared_ptr<CoalMemExprAST>   c = rhsBinaryOp->rhs;
            /// TODO: construct a*b + a*c
            shared_ptr<BinaryExprAST>  ab = std::make_shared<BinaryExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Mult, a, b));
            shared_ptr<BinaryExprAST>  ac = std::make_shared<BinaryExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Mult, a, c));
            
            // expanded form
            shared_ptr<BinaryExprAST>  expansion = std::make_shared<BinaryExprAST>(BinaryExprAST(CoalMemBinaryASTToken_t::Add, ab, ac));
            printInfo(debug, "right:\t", expansion->str());
            return distributiveTransform(expansion);
        }

        if (lhsBinaryOp != nullptr){
            curNodeBinaryExpr->lhs = distributiveTransform(shared_ptr<BinaryExprAST>(lhsBinaryOp));
        }
        if (rhsBinaryOp != nullptr){
            curNodeBinaryExpr->rhs = distributiveTransform(shared_ptr<BinaryExprAST>(rhsBinaryOp));
        }
        
        
    }
    return root;

}

// helper

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

