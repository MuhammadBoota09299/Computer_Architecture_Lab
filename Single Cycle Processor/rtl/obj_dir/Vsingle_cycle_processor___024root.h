// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vsingle_cycle_processor.h for the primary calling header

#ifndef VERILATED_VSINGLE_CYCLE_PROCESSOR___024ROOT_H_
#define VERILATED_VSINGLE_CYCLE_PROCESSOR___024ROOT_H_  // guard

#include "verilated.h"


class Vsingle_cycle_processor__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vsingle_cycle_processor___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlTriggerVec<0> __VactTriggered;
    VlTriggerVec<0> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vsingle_cycle_processor__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vsingle_cycle_processor___024root(Vsingle_cycle_processor__Syms* symsp, const char* v__name);
    ~Vsingle_cycle_processor___024root();
    VL_UNCOPYABLE(Vsingle_cycle_processor___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
