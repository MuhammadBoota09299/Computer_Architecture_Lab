// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vsingle_cycle_tb__Syms.h"


VL_ATTR_COLD void Vsingle_cycle_tb___024root__trace_init_sub__TOP__0(Vsingle_cycle_tb___024root* vlSelf, VerilatedVcd* tracep) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root__trace_init_sub__TOP__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->pushPrefix("single_cycle_tb", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+9,0,"clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+10,0,"reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("uut", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+10,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+9,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1,0,"inst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+2,0,"pc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+3,0,"pc_next",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+6,0,"result",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+7,0,"rdata1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+8,0,"rdata2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+4,0,"alu_op",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+5,0,"reg_wr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("pc_4_add", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+3,0,"pc_next",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+2,0,"pc",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
}

VL_ATTR_COLD void Vsingle_cycle_tb___024root__trace_init_top(Vsingle_cycle_tb___024root* vlSelf, VerilatedVcd* tracep) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root__trace_init_top\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vsingle_cycle_tb___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vsingle_cycle_tb___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
VL_ATTR_COLD void Vsingle_cycle_tb___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vsingle_cycle_tb___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vsingle_cycle_tb___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void Vsingle_cycle_tb___024root__trace_register(Vsingle_cycle_tb___024root* vlSelf, VerilatedVcd* tracep) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root__trace_register\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    tracep->addConstCb(&Vsingle_cycle_tb___024root__trace_const_0, 0U, vlSelf);
    tracep->addFullCb(&Vsingle_cycle_tb___024root__trace_full_0, 0U, vlSelf);
    tracep->addChgCb(&Vsingle_cycle_tb___024root__trace_chg_0, 0U, vlSelf);
    tracep->addCleanupCb(&Vsingle_cycle_tb___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vsingle_cycle_tb___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root__trace_const_0\n"); );
    // Init
    Vsingle_cycle_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsingle_cycle_tb___024root*>(voidSelf);
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
}

VL_ATTR_COLD void Vsingle_cycle_tb___024root__trace_full_0_sub_0(Vsingle_cycle_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vsingle_cycle_tb___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root__trace_full_0\n"); );
    // Init
    Vsingle_cycle_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsingle_cycle_tb___024root*>(voidSelf);
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vsingle_cycle_tb___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vsingle_cycle_tb___024root__trace_full_0_sub_0(Vsingle_cycle_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root__trace_full_0_sub_0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullIData(oldp+1,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__inst),32);
    bufp->fullIData(oldp+2,(((IData)(4U) + vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc_next)),32);
    bufp->fullIData(oldp+3,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc_next),32);
    bufp->fullCData(oldp+4,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op),4);
    bufp->fullBit(oldp+5,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__reg_wr));
    bufp->fullIData(oldp+6,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__result),32);
    bufp->fullIData(oldp+7,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1),32);
    bufp->fullIData(oldp+8,(vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2),32);
    bufp->fullBit(oldp+9,(vlSelfRef.single_cycle_tb__DOT__clock));
    bufp->fullBit(oldp+10,(vlSelfRef.single_cycle_tb__DOT__reset));
}
