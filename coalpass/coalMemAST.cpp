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
deque<shared_ptr<CoalMemExprAST>> BinaryExprAST::extractSubMultExprsFromDistForm(shared_ptr<BinaryExprAST> root_add){
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

shared_ptr<BinaryExprAST> BinaryExprAST::distributiveTransform(shared_ptr<BinaryExprAST> root){
    bool debug = !DEBUG;
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
            shared_ptr<BinaryExprAST>  ab = std::make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Mult, a, b);
            shared_ptr<BinaryExprAST>  ac = std::make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Mult, a, c);
            
            // expanded form
            shared_ptr<BinaryExprAST>  expansion = std::make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Add, ab, ac);
            printInfo(debug, "left:\t" , expansion->str());
            return distributiveTransform(expansion);
        }
        /// TODO: find a * (b+c) pattern
        else if (rightFixDown){
            shared_ptr<CoalMemExprAST>   a = curNodeBinaryExpr->lhs;
            shared_ptr<CoalMemExprAST>   b = rhsBinaryOp->lhs;
            shared_ptr<CoalMemExprAST>   c = rhsBinaryOp->rhs;
            /// TODO: construct a*b + a*c
            shared_ptr<BinaryExprAST>  ab = std::make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Mult, a, b);
            shared_ptr<BinaryExprAST>  ac = std::make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Mult, a, c);
            
            // expanded form
            shared_ptr<BinaryExprAST>  expansion = std::make_shared<BinaryExprAST>(CoalMemBinaryASTToken_t::Add, ab, ac);
            printInfo(debug, "right:\t", expansion->str());
            return distributiveTransform(expansion);
        }

        if (lhsBinaryOp != nullptr){
            curNodeBinaryExpr->lhs = distributiveTransform(make_shared<BinaryExprAST>(*lhsBinaryOp));
        }
        if (rhsBinaryOp != nullptr){
            curNodeBinaryExpr->rhs = distributiveTransform(make_shared<BinaryExprAST>(*rhsBinaryOp));
        }
    }
    return root;

}