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


optional<CoalLoad> createCoalLoadOrNo(LoadInst* loadCandInst){
    /// @note if this load is not from GEP, cannot be Coaled
    if (isa<GetElementPtrInst>(loadCandInst->getPointerOperand())) return nullopt;
    GetElementPtrInst* loadAddrGEPInst = dyn_cast<GetElementPtrInst>(loadCandInst->getPointerOperand());
    /// TODO: build offset calculation tree

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
    // Terminate point: callInst
    else if (CallInst* callInst = dyn_cast<CallInst>(root->inst)){

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