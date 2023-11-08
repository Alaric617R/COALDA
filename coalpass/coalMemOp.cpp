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

// local helpers
optional<GEPWrapper> calcGEPCoalCandidate(GetElementPtrInst* gepInst){
    if (gepInst->getNumOperands() == 2) {
        return std::make_optional(GEPWrapper{.GEP = gepInst, 
                                             .PointerOp = gepInst->getPointerOperand(), 
                                             .OffsetOp = gepInst->getOperand(1)
                                             });
    }
    // else the second argument should be zero
    else if (gepInst->getNumOperands() == 3 ){
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

optional<CoalLoad> createCoalLoadOrNo(LoadInst* loadCandInst){
    /// @note if this load is not from GEP, cannot be Coaled
    if (isa<GetElementPtrInst>(loadCandInst->getPointerOperand())) return nullopt;
    GetElementPtrInst* loadAddrGEPInst = dyn_cast<GetElementPtrInst>(loadCandInst->getPointerOperand());
    /** allowed two types of GEP
     * 1. only one-dimensional offset. E.G, %17 = getelementptr inbounds i32, ptr %11, i64 %16
     * 2. twp-dimensional offset, but with GPU shared memory so the first one will be zero. E.G,   %129 = getelementptr inbounds [96 x i32], ptr addrspacecast (ptr addrspace(3) @_ZZ26rgb_smem_array_interleavedPiS_iE14pixel_smem_dst to ptr), i64 0, i64 %128
     * */ 
    GEPWrapper loadAddrGEPWrapper;
    if (calcGEPCoalCandidate(loadAddrGEPInst).has_value()) return nullopt;
    else loadAddrGEPWrapper = std::move(calcGEPCoalCandidate(loadAddrGEPInst).value());
    /// TODO: build offset calculation tree
    Value* offsetOp = loadAddrGEPWrapper.OffsetOp;
    CalcTreeNode* root = new CalcTreeNode;
    CalcTreeNode::setupCalcTreeNode(root, offsetOp, nullptr);
    /// TODO: extract GEP pointer Op source dependence tree


}

// function caller should initialize root node by:
// 1. filling inst
// 2. set parent to Null
/// @return true if this offset is related parallel structure (can be coalesced)
bool computeOffsetDepTree(CalcTreeNode* root){
    assert(root->inst != nullptr);
    /// TODO: recursion termination condition
    if (!isa<Instruction>(root->inst)) return false;
    // or instruction type is callInst or Un-interested type
    /// TODO: FSM of different instructions
    bool ret_flag = false;
    // unary: sext
    if (SExtInst* sextInst = dyn_cast<SExtInst>(root->inst)){
        CalcTreeNode* sextChildNode = new CalcTreeNode;
        CalcTreeNode::setupCalcTreeNode(sextChildNode, sextInst->getOperand(0), root);
        root->childNodesSet.insert(sextChildNode);
        return false || computeOffsetDepTree(sextChildNode);
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
            ret_flag = ret_flag || computeOffsetDepTree(binaryChildNode);
        }
        return ret_flag;
    }
    // unary: load
    else if (LoadInst* loadInst = dyn_cast<LoadInst>(root->inst)){
        CalcTreeNode* loadChildNode = new CalcTreeNode;
        CalcTreeNode::setupCalcTreeNode(loadChildNode, loadInst->getPointerOperand(), root);
        root->childNodesSet.insert(loadChildNode);
        return false || computeOffsetDepTree(loadChildNode);
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
                    ret_flag = computeOffsetDepTree(storeValueChildNode);
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
    // don't bother to deal with other type of instructions
    else {
        return false;
    }


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