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
/**
 * @param Argument: argument passed to the function.
 * @param GlobalVariable: inclusing shared memory, global array, etc.
 * @param Alloca: local array in the scope of current function body.
*/
enum class CoalMemConstExprASTToken_t : uint8_t {None, Argument, GlobalVariable, Alloca};

// class BinaryExprAST;
class CoalMemExprASTBase{
public:
    enum CoalMemExprASTType_t {
        Binary, 
        Const, 
        Prototype, 
        ConstArg, 
        ConstInt
    };

    CoalMemExprASTBase(CoalMemExprASTType_t ty) : type{ty} {};
    CoalMemExprASTType_t get_type() const {return type;}
    virtual string str() = 0;
    // virtual string str() {
    //     return "Base CoalMemExprAST";
    // }

private:
    const CoalMemExprASTType_t type;
};


class BinaryExprAST : public CoalMemExprASTBase{
private:
    CoalMemBinaryASTToken_t op;
    shared_ptr<CoalMemExprASTBase> lhs, rhs;
    void exchangeAddMultNodes(BinaryExprAST* multParent, BinaryExprAST* addChild, bool isLeftChild);

public:
    /**
     * transform an expression to add connected components by applying distribution rule
     * e.g, 3 *(a * b+ d) + c => 3*a*b + 3*d + c
     * The good part of this method is that after this transformation, mul will only have Const and mul itself as child node
    */
    static shared_ptr<BinaryExprAST> distributiveTransform(shared_ptr<BinaryExprAST> root);
    static deque<shared_ptr<CoalMemExprASTBase>> extractSubMultExprsFromDistForm(shared_ptr<BinaryExprAST> root_add);
    BinaryExprAST(CoalMemBinaryASTToken_t _op, shared_ptr<CoalMemExprASTBase> _lhs, shared_ptr<CoalMemExprASTBase> _rhs): 
                                                                                                                        CoalMemExprASTBase(CoalMemExprASTType_t::Binary), 
                                                                                                                        op{_op}, 
                                                                                                                        lhs{_lhs}, 
                                                                                                                        rhs{_rhs}
                                                                                                                        {}
    void operator=(const BinaryExprAST& rhs){
        this->op = rhs.op;
        this->lhs = rhs.lhs;
        this->rhs = rhs.rhs;
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
    static optional<deque<shared_ptr<CoalMemExprASTBase>>> expandNodes(shared_ptr<BinaryExprAST> root_expr) ;
    static bool classof(const CoalMemExprASTBase* base){
        return base->get_type() == CoalMemExprASTType_t::Binary;
    }
};

class ConstExprAST : public CoalMemExprASTBase {
public:
    ConstExprAST(): CoalMemExprASTBase(CoalMemExprASTType_t::Const){};
    ConstExprAST(CoalMemExprASTType_t ty): CoalMemExprASTBase(ty){};
    string str() override {
        return "ConstExprAST";
    }
    static bool classof(const CoalMemExprASTBase* base){
        return (base->get_type() >= CoalMemExprASTType_t::Const) && (base->get_type() <= CoalMemExprASTType_t::ConstInt);
    }
};

class PrototypeExprAST : public ConstExprAST {
private:
    CoalMemPrototyeASTToken_t token;
public:
    PrototypeExprAST(CoalMemPrototyeASTToken_t _token):  ConstExprAST(CoalMemExprASTType_t::Prototype), token{_token}{}
    CoalMemPrototyeASTToken_t get_token() const {return token;}
    void operator=(const PrototypeExprAST& rhs){
        this->token = rhs.token;
    }
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
        }
    }
    static bool classof(const CoalMemExprASTBase* base){
        return  (base->get_type() == CoalMemExprASTType_t::Prototype);
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
    ConstArgExprAST(CoalMemConstExprASTToken_t _token, Value* _argument) : ConstExprAST(CoalMemExprASTType_t::ConstArg), token{_token}, argument{_argument}{}
    Value* const getArg() const {return argument;}
    CoalMemConstExprASTToken_t  getExprType() const {return token;}
    void operator=(const ConstArgExprAST& rhs){
        this->token = rhs.token;
        this->argument = rhs.argument;
    }
    string str() override {
        switch (token)
        {
        case CoalMemConstExprASTToken_t::Argument:
            return "Arg " + dyn_cast<Argument>(argument)->getName().str();
        case CoalMemConstExprASTToken_t::GlobalVariable:
            return "Global " + dyn_cast<GlobalValue>(argument)->getName().str();
        case CoalMemConstExprASTToken_t::Alloca:
            return string("Alloca ") + dyn_cast<AllocaInst>(argument)->getOpcodeName();
        default:
            return "None!";
        }
    }
    friend bool operator==(const ConstArgExprAST& lhs, const ConstArgExprAST& rhs){
        return (lhs.token == rhs.token && lhs.argument == rhs.argument);
        // if (lhs.token != rhs.token) return false;
        // switch (lhs.token)
        // {
        // case CoalMemConstExprASTToken_t::Argument:
        //      dyn_cast<Argument>(lhs.argument)->getName().str();
        // case CoalMemConstExprASTToken_t::GlobalVariable:
        //     return "Global " + dyn_cast<GlobalValue>(argument)->getName().str();
        // case CoalMemConstExprASTToken_t::Alloca:
        //     return string("Alloca ") + dyn_cast<AllocaInst>(argument)->getOpcodeName();
        // default:
        //     return "None!";
        // }
    }
    static bool classof(const CoalMemExprASTBase* base){
        return (base->get_type() == CoalMemExprASTType_t::ConstArg);
    }
};


class ConstIntExprAST : public ConstExprAST {
private:
    int value;
public:
    ConstIntExprAST(int _value): ConstExprAST(CoalMemExprASTType_t::ConstInt), value{_value}{}
    void operator=(const ConstIntExprAST& rhs){
        this->value = rhs.value;
    }
    string str() override {
        return std::to_string(value);
    }
    int get_value() const {return value;}
    static bool classof(const CoalMemExprASTBase* base){
        return (base->get_type() == CoalMemExprASTType_t::ConstInt);
    }
};


#endif