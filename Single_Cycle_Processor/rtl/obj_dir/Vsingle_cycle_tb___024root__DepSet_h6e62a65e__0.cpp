// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsingle_cycle_tb.h for the primary calling header

#include "Vsingle_cycle_tb__pch.h"
#include "Vsingle_cycle_tb___024root.h"

VL_ATTR_COLD void Vsingle_cycle_tb___024root___eval_initial__TOP(Vsingle_cycle_tb___024root* vlSelf);
VlCoroutine Vsingle_cycle_tb___024root___eval_initial__TOP__Vtiming__0(Vsingle_cycle_tb___024root* vlSelf);
VlCoroutine Vsingle_cycle_tb___024root___eval_initial__TOP__Vtiming__1(Vsingle_cycle_tb___024root* vlSelf);

void Vsingle_cycle_tb___024root___eval_initial(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval_initial\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vsingle_cycle_tb___024root___eval_initial__TOP(vlSelf);
    Vsingle_cycle_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    Vsingle_cycle_tb___024root___eval_initial__TOP__Vtiming__1(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__single_cycle_tb__DOT__clock__0 
        = vlSelfRef.single_cycle_tb__DOT__clock;
}

VL_INLINE_OPT VlCoroutine Vsingle_cycle_tb___024root___eval_initial__TOP__Vtiming__0(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.single_cycle_tb__DOT__clock = 0U;
    while (1U) {
        co_await vlSelfRef.__VdlySched.delay(5ULL, 
                                             nullptr, 
                                             "single_cycle_tb.sv", 
                                             16);
        vlSelfRef.single_cycle_tb__DOT__clock = (1U 
                                                 & (~ (IData)(vlSelfRef.single_cycle_tb__DOT__clock)));
    }
}

VL_INLINE_OPT VlCoroutine Vsingle_cycle_tb___024root___eval_initial__TOP__Vtiming__1(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval_initial__TOP__Vtiming__1\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.single_cycle_tb__DOT__reset = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "single_cycle_tb.sv", 
                                         22);
    vlSelfRef.single_cycle_tb__DOT__reset = 0U;
    co_await vlSelfRef.__VdlySched.delay(0x64ULL, nullptr, 
                                         "single_cycle_tb.sv", 
                                         24);
    VL_FINISH_MT("single_cycle_tb.sv", 25, "");
}

void Vsingle_cycle_tb___024root___eval_act(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval_act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vsingle_cycle_tb___024root___nba_sequent__TOP__0(Vsingle_cycle_tb___024root* vlSelf);
void Vsingle_cycle_tb___024root___nba_sequent__TOP__1(Vsingle_cycle_tb___024root* vlSelf);
void Vsingle_cycle_tb___024root___nba_comb__TOP__0(Vsingle_cycle_tb___024root* vlSelf);

void Vsingle_cycle_tb___024root___eval_nba(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval_nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vsingle_cycle_tb___024root___nba_sequent__TOP__0(vlSelf);
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vsingle_cycle_tb___024root___nba_sequent__TOP__1(vlSelf);
        vlSelfRef.__Vm_traceActivity[1U] = 1U;
    }
    if ((3ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vsingle_cycle_tb___024root___nba_comb__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
    }
}

VL_INLINE_OPT void Vsingle_cycle_tb___024root___nba_sequent__TOP__0(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___nba_sequent__TOP__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VdlySet__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v0;
    __VdlySet__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v0 = 0;
    IData/*31:0*/ __VdlyVal__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32;
    __VdlyVal__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32 = 0;
    CData/*4:0*/ __VdlyDim0__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32;
    __VdlyDim0__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32 = 0;
    CData/*0:0*/ __VdlySet__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32;
    __VdlySet__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32 = 0;
    // Body
    __VdlySet__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v0 = 0U;
    __VdlySet__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32 = 0U;
    if (vlSelfRef.single_cycle_tb__DOT__reset) {
        __VdlySet__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v0 = 1U;
    } else if (((IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__reg_wr) 
                & (0U != (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT____Vcellinp___registerfile__waddr)))) {
        __VdlyVal__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32 
            = vlSelfRef.single_cycle_tb__DOT__uut__DOT__result;
        __VdlyDim0__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32 
            = vlSelfRef.single_cycle_tb__DOT__uut__DOT____Vcellinp___registerfile__waddr;
        __VdlySet__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32 = 1U;
    }
    if (__VdlySet__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v0) {
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x1fU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x1eU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x1dU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x1cU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x1bU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x1aU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x19U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x18U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x17U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x16U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x15U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x14U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x13U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x12U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x11U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0x10U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0xfU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0xeU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0xdU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0xcU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0xbU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0xaU] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[9U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[8U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[7U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[6U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[5U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[4U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[3U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[2U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[1U] = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[0U] = 0U;
    }
    if (__VdlySet__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32) {
        vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file[__VdlyDim0__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32] 
            = __VdlyVal__single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file__v32;
    }
}

VL_INLINE_OPT void Vsingle_cycle_tb___024root___nba_sequent__TOP__1(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___nba_sequent__TOP__1\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*2:0*/ single_cycle_tb__DOT__uut__DOT___decoder__DOT__funct3;
    single_cycle_tb__DOT__uut__DOT___decoder__DOT__funct3 = 0;
    CData/*6:0*/ single_cycle_tb__DOT__uut__DOT___decoder__DOT__opcode;
    single_cycle_tb__DOT__uut__DOT___decoder__DOT__opcode = 0;
    // Body
    vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc_next 
        = ((IData)(vlSelfRef.single_cycle_tb__DOT__reset)
            ? 0U : vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc);
    vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc = 
        ((IData)(4U) + vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc_next);
    vlSelfRef.single_cycle_tb__DOT__uut__DOT____Vcellinp___registerfile__waddr 
        = (0x1fU & (vlSelfRef.single_cycle_tb__DOT__uut__DOT___instruction_memory__DOT__inst_memory
                    [(0x1fU & (vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc_next 
                               >> 2U))] >> 7U));
    vlSelfRef.single_cycle_tb__DOT__uut__DOT__inst 
        = vlSelfRef.single_cycle_tb__DOT__uut__DOT___instruction_memory__DOT__inst_memory
        [(0x1fU & (vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc_next 
                   >> 2U))];
    single_cycle_tb__DOT__uut__DOT___decoder__DOT__opcode 
        = (0x7fU & vlSelfRef.single_cycle_tb__DOT__uut__DOT__inst);
    single_cycle_tb__DOT__uut__DOT___decoder__DOT__funct3 
        = (7U & (vlSelfRef.single_cycle_tb__DOT__uut__DOT__inst 
                 >> 0xcU));
    if ((0x33U == (IData)(single_cycle_tb__DOT__uut__DOT___decoder__DOT__opcode))) {
        vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op 
            = (((IData)(single_cycle_tb__DOT__uut__DOT___decoder__DOT__funct3) 
                << 1U) | (1U & (vlSelfRef.single_cycle_tb__DOT__uut__DOT__inst 
                                >> 0x1eU)));
        vlSelfRef.single_cycle_tb__DOT__uut__DOT__reg_wr = 1U;
    } else {
        vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op = 0U;
        vlSelfRef.single_cycle_tb__DOT__uut__DOT__reg_wr = 0U;
    }
}

VL_INLINE_OPT void Vsingle_cycle_tb___024root___nba_comb__TOP__0(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___nba_comb__TOP__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1 
        = vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file
        [(0x1fU & (vlSelfRef.single_cycle_tb__DOT__uut__DOT___instruction_memory__DOT__inst_memory
                   [(0x1fU & (vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc_next 
                              >> 2U))] >> 0xfU))];
    vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2 
        = vlSelfRef.single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file
        [(0x1fU & (vlSelfRef.single_cycle_tb__DOT__uut__DOT___instruction_memory__DOT__inst_memory
                   [(0x1fU & (vlSelfRef.single_cycle_tb__DOT__uut__DOT__pc_next 
                              >> 2U))] >> 0x14U))];
    vlSelfRef.single_cycle_tb__DOT__uut__DOT__result 
        = ((8U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
            ? ((4U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                ? ((2U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                    ? ((1U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                        ? 0U : (vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1 
                                & vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2))
                    : ((1U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                        ? 0U : (vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1 
                                | vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2)))
                : ((2U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                    ? ((1U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                        ? VL_SHIFTRS_III(32,32,5, vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1, 
                                         (0x1fU & vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2))
                        : (vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1 
                           >> (0x1fU & vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2)))
                    : ((1U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                        ? 0U : (vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1 
                                ^ vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2))))
            : ((4U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                ? ((2U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                    ? ((1U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                        ? 0U : ((vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1 
                                 < vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2)
                                 ? 1U : 0U)) : ((1U 
                                                 & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                                                 ? 0U
                                                 : 
                                                (VL_LTS_III(32, vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1, vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2)
                                                  ? 1U
                                                  : 0U)))
                : ((2U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                    ? ((1U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                        ? 0U : (vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1 
                                << (0x1fU & vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2)))
                    : ((1U & (IData)(vlSelfRef.single_cycle_tb__DOT__uut__DOT__alu_op))
                        ? (vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1 
                           - vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2)
                        : (vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata1 
                           + vlSelfRef.single_cycle_tb__DOT__uut__DOT__rdata2)))));
}

void Vsingle_cycle_tb___024root___timing_resume(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___timing_resume\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vsingle_cycle_tb___024root___eval_triggers__act(Vsingle_cycle_tb___024root* vlSelf);

bool Vsingle_cycle_tb___024root___eval_phase__act(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval_phase__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<3> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vsingle_cycle_tb___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vsingle_cycle_tb___024root___timing_resume(vlSelf);
        Vsingle_cycle_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vsingle_cycle_tb___024root___eval_phase__nba(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval_phase__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vsingle_cycle_tb___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsingle_cycle_tb___024root___dump_triggers__nba(Vsingle_cycle_tb___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vsingle_cycle_tb___024root___dump_triggers__act(Vsingle_cycle_tb___024root* vlSelf);
#endif  // VL_DEBUG

void Vsingle_cycle_tb___024root___eval(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vsingle_cycle_tb___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("single_cycle_tb.sv", 1, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                Vsingle_cycle_tb___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("single_cycle_tb.sv", 1, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vsingle_cycle_tb___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vsingle_cycle_tb___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vsingle_cycle_tb___024root___eval_debug_assertions(Vsingle_cycle_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vsingle_cycle_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsingle_cycle_tb___024root___eval_debug_assertions\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
