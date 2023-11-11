#ifndef DEBUG_LOG_H
#define DEBUG_LOG_H
#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/AliasSetTracker.h"
#include "llvm/Pass.h"


#include  <iostream>
#include "llvm/Support/Format.h"
#include "llvm/IR/CFG.h"
#include <deque>
#include <optional>
#include <unordered_set>
#include <unordered_map>
#include <string>
#include <memory>
using namespace std;


using std::deque;
using std::optional;
using std::unordered_map;
using std::unordered_set;
using std::string;
using std::nullopt;
using namespace llvm;

#ifndef DEBUG
#define DEBUG true
#endif

#define log_debug(expr, fmt, ...)  \
                  if ((expr)) \
                      errs() << llvm::format(fmt"\n", ## __VA_ARGS__ )

#define log_debug_bb(expr, bbInfo, fmt, ...) \
                  if ((expr)) {  \
                    (bbInfo);    \
                  errs() << '\t'; errs() << llvm::format(fmt"\n", ## __VA_ARGS__ );}

#define seperator(num, charc) \
                  for (int i = 0; i < (num); i++) errs() << charc;\
                  errs() << '\n';

#define sep_center_idy(charc, center) \
        for (int i = 0; i < 18; i ++) errs() << charc; \
        errs() << '\t' << center << '\t'; \
        for (int i = 0; i < 18; i ++) errs() << charc; \
        errs() << '\n';

#if DEBUG
#define sep_center(center) \
        for (int i = 0; i < 18; i ++) errs() << '<'; \
        errs() << '\t' << center << '\t'; \
        for (int i = 0; i < 18; i ++) errs() << '>'; \
        errs() << '\n';
#else
#define sep_center(center)
#endif

#if DEBUG
#define sep_centerBB(center, BB) \
        for (int i = 0; i < 18; i ++) errs() << '<'; \
        errs() << "\nBasicBlock:\t"; BB->printAsOperand(errs(),false); errs() << '\n'; \
        errs() << center << "\n"; \
        for (int i = 0; i < 18; i ++) errs() << '>'; \
        errs() << '\n';
#else
#define sep_centerBB(center)
#endif

template<typename ...Args>
void tLog(Args && ...args)
{
    (errs() << ... << args);
    errs() << '\n';
}

template<typename ...Args>
void printBlockInfo(bool debug, BasicBlock* bb, Args && ...args){
    if (!debug) return;
    errs() << "Block: "; bb->printAsOperand(errs(), false); errs() << "\n";
    tLog(args...);
}

template<typename ...Args>
void printInfo(bool debug, Args && ...args){
    if (!debug) return;
    tLog(args...);
}



#endif