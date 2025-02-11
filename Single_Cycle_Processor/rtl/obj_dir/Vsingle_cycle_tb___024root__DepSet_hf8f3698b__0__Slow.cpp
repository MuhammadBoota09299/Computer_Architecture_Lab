// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsingle_cycle_tb.h for the primary calling header

#include "Vsingle_cycle_tb__pch.h"
#include "Vsingle_cycle_tb__Syms.h"
#include "Vsingle_cycle_tb___024root.h"

VL_ATTR_COLD void Vsingle_cycle_tb___024root___eval_initial__TOP(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval_initial__TOP\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<3>/*95:0*/ __Vtemp_1;
    // Body
    __Vtemp_1[0U] = 0x2e766364U;
    __Vtemp_1[1U] = 0x666f726dU;
    __Vtemp_1[2U] = 0x77617665U;
    vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(3, __Vtemp_1));
    vlSymsp->_traceDumpOpen();
    vlSelfRef.single_cycle_tb__DOT__uut__DOT___instruction_memory__DOT__inst_memory[0U] = 0U;
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsingle_cycle_tb___024root___dump_triggers__stl(Vsingle_cycle_tb___024root* vlSelf);
#endif  // VL_DEBUG

VL_ATTR_COLD void Vsingle_cycle_tb___024root___eval_triggers__stl(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval_triggers__stl\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VstlTriggered.set(0U, (IData)(vlSelfRef.__VstlFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vsingle_cycle_tb___024root___dump_triggers__stl(vlSelf);
    }
#endif
}
