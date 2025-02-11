// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsingle_cycle_processor.h for the primary calling header

#include "Vsingle_cycle_processor__pch.h"
#include "Vsingle_cycle_processor___024root.h"

VL_ATTR_COLD void Vsingle_cycle_processor___024root___eval_static(Vsingle_cycle_processor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_processor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_processor___024root___eval_static\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vsingle_cycle_processor___024root___eval_initial(Vsingle_cycle_processor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_processor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_processor___024root___eval_initial\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vsingle_cycle_processor___024root___eval_final(Vsingle_cycle_processor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_processor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_processor___024root___eval_final\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vsingle_cycle_processor___024root___eval_settle(Vsingle_cycle_processor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_processor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_processor___024root___eval_settle\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsingle_cycle_processor___024root___dump_triggers__act(Vsingle_cycle_processor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_processor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_processor___024root___dump_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsingle_cycle_processor___024root___dump_triggers__nba(Vsingle_cycle_processor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_processor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_processor___024root___dump_triggers__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vsingle_cycle_processor___024root___ctor_var_reset(Vsingle_cycle_processor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_processor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_processor___024root___ctor_var_reset\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->clock = VL_RAND_RESET_I(1);
}
