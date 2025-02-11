// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vsingle_cycle_tb__Syms.h"


void Vsingle_cycle_tb___024root__trace_chg_0_sub_0(Vsingle_cycle_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vsingle_cycle_tb___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root__trace_chg_0\n"); );
    // Init
    Vsingle_cycle_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsingle_cycle_tb___024root*>(voidSelf);
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vsingle_cycle_tb___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vsingle_cycle_tb___024root__trace_chg_0_sub_0(Vsingle_cycle_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root__trace_chg_0_sub_0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY(vlSelfRef.__Vm_traceActivity[1U])) {
        bufp->chgIData(oldp+0,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__inst),32);
        bufp->chgIData(oldp+1,(((IData)(4U) + vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc_next)),32);
        bufp->chgIData(oldp+2,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc_next),32);
        bufp->chgCData(oldp+3,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op),4);
        bufp->chgBit(oldp+4,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__reg_wr));
    }
    if (VL_UNLIKELY(vlSelfRef.__Vm_traceActivity[2U])) {
        bufp->chgIData(oldp+5,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__result),32);
        bufp->chgIData(oldp+6,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1),32);
        bufp->chgIData(oldp+7,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2),32);
    }
    bufp->chgBit(oldp+8,(vlSelfRef.single_cycle_tb__DOT__clock));
    bufp->chgBit(oldp+9,(vlSelfRef.single_cycle_tb__DOT__reset));
}

void Vsingle_cycle_tb___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root__trace_cleanup\n"); );
    // Init
    Vsingle_cycle_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsingle_cycle_tb___024root*>(voidSelf);
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
}
