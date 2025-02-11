// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VSINGLE_CYCLE_PROCESSOR__SYMS_H_
#define VERILATED_VSINGLE_CYCLE_PROCESSOR__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vsingle_cycle_processor.h"

// INCLUDE MODULE CLASSES
#include "Vsingle_cycle_processor___024root.h"
#include "Vsingle_cycle_processor___024unit.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)Vsingle_cycle_processor__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vsingle_cycle_processor* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vsingle_cycle_processor___024root TOP;

    // CONSTRUCTORS
    Vsingle_cycle_processor__Syms(VerilatedContext* contextp, const char* namep, Vsingle_cycle_processor* modelp);
    ~Vsingle_cycle_processor__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
