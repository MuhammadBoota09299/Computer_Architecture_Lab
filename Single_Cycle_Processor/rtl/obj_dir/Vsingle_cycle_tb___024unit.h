// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vsingle_cycle_tb.h for the primary calling header

#ifndef VERILATED_VSINGLE_CYCLE_TB___024UNIT_H_
#define VERILATED_VSINGLE_CYCLE_TB___024UNIT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vsingle_cycle_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vsingle_cycle_tb___024unit final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vsingle_cycle_tb__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vsingle_cycle_tb___024unit(Vsingle_cycle_tb__Syms* symsp, const char* v__name);
    ~Vsingle_cycle_tb___024unit();
    VL_UNCOPYABLE(Vsingle_cycle_tb___024unit);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
