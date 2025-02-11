// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsingle_cycle_processor.h for the primary calling header

#include "Vsingle_cycle_processor__pch.h"
#include "Vsingle_cycle_processor__Syms.h"
#include "Vsingle_cycle_processor___024unit.h"

void Vsingle_cycle_processor___024unit___ctor_var_reset(Vsingle_cycle_processor___024unit* vlSelf);

Vsingle_cycle_processor___024unit::Vsingle_cycle_processor___024unit(Vsingle_cycle_processor__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vsingle_cycle_processor___024unit___ctor_var_reset(this);
}

void Vsingle_cycle_processor___024unit::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vsingle_cycle_processor___024unit::~Vsingle_cycle_processor___024unit() {
}
