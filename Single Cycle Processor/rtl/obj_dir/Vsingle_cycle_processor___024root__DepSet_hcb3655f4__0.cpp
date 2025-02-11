// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsingle_cycle_processor.h for the primary calling header

#include "Vsingle_cycle_processor__pch.h"
#include "Vsingle_cycle_processor__Syms.h"
#include "Vsingle_cycle_processor___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsingle_cycle_processor___024root___dump_triggers__act(Vsingle_cycle_processor___024root* vlSelf);
#endif  // VL_DEBUG

void Vsingle_cycle_processor___024root___eval_triggers__act(Vsingle_cycle_processor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_processor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_processor___024root___eval_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vsingle_cycle_processor___024root___dump_triggers__act(vlSelf);
    }
#endif
}
