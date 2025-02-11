// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsingle_cycle_tb.h for the primary calling header

#include "Vsingle_cycle_tb__pch.h"
#include "Vsingle_cycle_tb__Syms.h"
#include "Vsingle_cycle_tb___024root.h"

void Vsingle_cycle_tb___024root___ctor_var_reset(Vsingle_cycle_tb___024root* vlSelf);

Vsingle_cycle_tb___024root::Vsingle_cycle_tb___024root(Vsingle_cycle_tb__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vsingle_cycle_tb___024root___ctor_var_reset(this);
}

void Vsingle_cycle_tb___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vsingle_cycle_tb___024root::~Vsingle_cycle_tb___024root() {
}
