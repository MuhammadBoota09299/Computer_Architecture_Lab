// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vsingle_cycle_processor.h for the primary calling header

#ifndef VERILATED_VSINGLE_CYCLE_PROCESSOR___024UNIT_H_
#define VERILATED_VSINGLE_CYCLE_PROCESSOR___024UNIT_H_  // guard

#include "verilated.h"


class Vsingle_cycle_processor__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vsingle_cycle_processor___024unit final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vsingle_cycle_processor__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vsingle_cycle_processor___024unit(Vsingle_cycle_processor__Syms* symsp, const char* v__name);
    ~Vsingle_cycle_processor___024unit();
    VL_UNCOPYABLE(Vsingle_cycle_processor___024unit);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
