#ifndef COAL_MEM_AST_H
#define COAL_MEM_AST_H
#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/AliasSetTracker.h"
#include "llvm/Pass.h"

#include <string>
#include <deque>
#include <optional>
#include <unordered_set>
#include <unordered_map>
#include <string>
#include <memory>

#include "debugLog.h"

using namespace std;
using namespace llvm;

enum class CoalMemBinaryASTToken_t: uint8_t {Mult, Add};
enum class CoalMemPrototyeASTToken_t: uint8_t {ThreadIndex, BlockDim, BlockIndex, TID};
enum class CoalMemConstExprASTToken_t : uint8_t {None, Argument, GlobalVariable, Alloca};

// class BinaryExprAST;
class CoalMemExprAST{
public:
    // shared_ptr<BinaryExprAST> parent = nullptr;
    // shared_ptr<CoalMemExprAST> parent = nullptr;

    virtual ~CoalMemExprAST() = default;
    // virtual string str() = 0;
    virtual string str() {
        return "Base CoalMemExprAST";
    }
    /**
     * transform an expression to add connected components by applying distribution rule
     * e.g, 3 *(a * b+ d) + c => 3*a*b + 3*d + c
     * The good part of this method is that after this transformation, mul will only have Const and mul itself as child node
    */
    
};


class BinaryExprAST : public CoalMemExprAST{
private:
    CoalMemBinaryASTToken_t op;
    shared_ptr<CoalMemExprAST> lhs, rhs;
    void exchangeAddMultNodes(BinaryExprAST* multParent, BinaryExprAST* addChild, bool isLeftChild);

public:
    static shared_ptr<BinaryExprAST> distributiveTransform(shared_ptr<BinaryExprAST> root);
    static deque<shared_ptr<CoalMemExprAST>> extractSubMultExprsFromDistForm(shared_ptr<BinaryExprAST> root_add);
    BinaryExprAST(CoalMemBinaryASTToken_t _op, shared_ptr<CoalMemExprAST> _lhs, shared_ptr<CoalMemExprAST> _rhs): op{_op}, lhs{_lhs}, rhs{_rhs}{
        // lhs->parent = shared_ptr<BinaryExprAST>(this);
        // rhs->parent = shared_ptr<BinaryExprAST>(this);
    }
    string str() override {
        switch (op)
        {
            case CoalMemBinaryASTToken_t::Add:
                return  "(" + lhs->str() + " + " + rhs->str() + ")";
            case CoalMemBinaryASTToken_t::Mult:
                return  "(" + lhs->str() + " * " + rhs->str() + ")";
            default:
                return "BinaryOp:\t?";
        //     return "BinaryOp:\t?";
        }
    }

    CoalMemBinaryASTToken_t type() const {return this->op;}

    static optional<deque<shared_ptr<CoalMemExprAST>>> expandNodes(shared_ptr<BinaryExprAST> root_expr) ;
};

class ConstExprAST : public CoalMemExprAST {
public:
    ConstExprAST() = default;
    string str() override {
        return "ConstExprAST";
    }
};

class PrototypeExprAST : public ConstExprAST {
private:
    CoalMemPrototyeASTToken_t token;
public:
    PrototypeExprAST(CoalMemPrototyeASTToken_t _token): token{_token}{}
    CoalMemPrototyeASTToken_t get_token() const {return token;}
    string str() override {
        switch (token)
        {
            case CoalMemPrototyeASTToken_t::ThreadIndex:
                return string("ThreadIndex");
            case CoalMemPrototyeASTToken_t::BlockDim:
                return string("BlockDim");
            case CoalMemPrototyeASTToken_t::BlockIndex:
                return string("BlockIndex");
            case CoalMemPrototyeASTToken_t::TID:
                return string("TID"); 
            default:
                return string("Prototype:?");
        // default:
        //     return string("Prototype:?");
        }
    }
};

/**
 * Argument passed from entry of function (register value with no dependence in function scope)
*/
class ConstArgExprAST : public ConstExprAST {
private:
    CoalMemConstExprASTToken_t token;
    Value* argument;
public:
    ConstArgExprAST(CoalMemConstExprASTToken_t _token, Value* _argument) : token{_token}, argument{_argument}{}
    Value* const getArg() const {return argument;}
    string str() override {
        switch (token)
        {
        case CoalMemConstExprASTToken_t::Argument:
            return "Arg " + dyn_cast<Argument>(argument)->getName().str();
        case CoalMemConstExprASTToken_t::GlobalVariable:
            return "Global " + dyn_cast<GlobalValue>(argument)->getName().str();
        case CoalMemConstExprASTToken_t::Alloca:
            return string("Aloca ") + dyn_cast<AllocaInst>(argument)->getOpcodeName();
        default:
            return "None!";
        }
    }
};


class ConstIntExprAST : public ConstExprAST {
private:
    int value;
public:
    ConstIntExprAST(int _value): value{_value}{}
    string str() override {
        return std::to_string(value);
    }
    int get_value() const {return value;}
};


#endif