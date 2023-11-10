#include "coalMemAST.h"

optional<deque<shared_ptr<CoalMemExprAST>>> BinaryExprAST::expandNodes(shared_ptr<BinaryExprAST> root_expr)  {
        deque<shared_ptr<CoalMemExprAST>> result;
        deque<shared_ptr<CoalMemExprAST>> nodesToExpand;
        nodesToExpand.push_back(root_expr);
        while(!nodesToExpand.empty()){
            auto front = nodesToExpand.front();
            nodesToExpand.pop_front();
            if (auto binaryOp = dynamic_cast<BinaryExprAST*>(front.get())){
                if (binaryOp->op == CoalMemBinaryASTToken_t::Add) {
                    errs() << "Cannot expand on ADD!\n";
                    return nullopt;
                }
                nodesToExpand.push_back(binaryOp->lhs);
                nodesToExpand.push_back(binaryOp->rhs);
            }
            else if (auto constOp = dynamic_cast<ConstExprAST*>(front.get())){
                result.push_back(front);
            }
            else {
                errs() << "cannot recognize:\t" <<  front->str() << "\n";
                assert(false && "Unknown expression!");}
        }
        return result;
    }
deque<shared_ptr<CoalMemExprAST>> BinaryExprAST::extractMultFromDistForm(shared_ptr<BinaryExprAST> root_add){
    deque<shared_ptr<CoalMemExprAST>> result;
    deque<shared_ptr<CoalMemExprAST>> exprNodes;
    exprNodes.push_back(root_add);
    while (!exprNodes.empty()){
        auto frontNode = exprNodes.front();
        exprNodes.pop_front();
        if (auto binaryNode = dynamic_cast<BinaryExprAST*>(frontNode.get())){
            if (binaryNode->type() == CoalMemBinaryASTToken_t::Add){
                exprNodes.push_back(binaryNode->lhs);
                exprNodes.push_back(binaryNode->rhs);
            }
            else{
                // mult expr
                result.push_back(frontNode);
            }
        }
        // const expr
        else {
            result.push_back(frontNode);
        }
    }
    return result;
}
