// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vsingle_cycle_processor__pch.h"

//============================================================
// Constructors

Vsingle_cycle_processor::Vsingle_cycle_processor(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vsingle_cycle_processor__Syms(contextp(), _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vsingle_cycle_processor::Vsingle_cycle_processor(const char* _vcname__)
    : Vsingle_cycle_processor(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vsingle_cycle_processor::~Vsingle_cycle_processor() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vsingle_cycle_processor___024root___eval_debug_assertions(Vsingle_cycle_processor___024root* vlSelf);
#endif  // VL_DEBUG
void Vsingle_cycle_processor___024root___eval_static(Vsingle_cycle_processor___024root* vlSelf);
void Vsingle_cycle_processor___024root___eval_initial(Vsingle_cycle_processor___024root* vlSelf);
void Vsingle_cycle_processor___024root___eval_settle(Vsingle_cycle_processor___024root* vlSelf);
void Vsingle_cycle_processor___024root___eval(Vsingle_cycle_processor___024root* vlSelf);

void Vsingle_cycle_processor::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vsingle_cycle_processor::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vsingle_cycle_processor___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vsingle_cycle_processor___024root___eval_static(&(vlSymsp->TOP));
        Vsingle_cycle_processor___024root___eval_initial(&(vlSymsp->TOP));
        Vsingle_cycle_processor___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vsingle_cycle_processor___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vsingle_cycle_processor::eventsPending() { return false; }

uint64_t Vsingle_cycle_processor::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vsingle_cycle_processor::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vsingle_cycle_processor___024root___eval_final(Vsingle_cycle_processor___024root* vlSelf);

VL_ATTR_COLD void Vsingle_cycle_processor::final() {
    Vsingle_cycle_processor___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vsingle_cycle_processor::hierName() const { return vlSymsp->name(); }
const char* Vsingle_cycle_processor::modelName() const { return "Vsingle_cycle_processor"; }
unsigned Vsingle_cycle_processor::threads() const { return 1; }
void Vsingle_cycle_processor::prepareClone() const { contextp()->prepareClone(); }
void Vsingle_cycle_processor::atClone() const {
    contextp()->threadPoolpOnClone();
}
