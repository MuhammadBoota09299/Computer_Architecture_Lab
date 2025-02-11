// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Vsingle_cycle_processor__pch.h"
#include "Vsingle_cycle_processor.h"
#include "Vsingle_cycle_processor___024root.h"
#include "Vsingle_cycle_processor___024unit.h"

// FUNCTIONS
Vsingle_cycle_processor__Syms::~Vsingle_cycle_processor__Syms()
{
}

Vsingle_cycle_processor__Syms::Vsingle_cycle_processor__Syms(VerilatedContext* contextp, const char* namep, Vsingle_cycle_processor* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup module instances
    , TOP{this, namep}
{
        // Check resources
        Verilated::stackCheck(11);
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-12);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
}
