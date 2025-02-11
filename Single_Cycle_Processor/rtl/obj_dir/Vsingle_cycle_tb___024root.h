// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vsingle_cycle_tb.h for the primary calling header

#ifndef VERILATED_VSINGLE_CYCLE_TB___024ROOT_H_
#define VERILATED_VSINGLE_CYCLE_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vsingle_cycle_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vsingle_cycle_tb___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ single_cycle_tb__DOT__clock;
    CData/*0:0*/ single_cycle_tb__DOT__reset;
    CData/*3:0*/ single_cycle_tb__DOT__uut__DOT__alu_op;
    CData/*0:0*/ single_cycle_tb__DOT__uut__DOT__reg_wr;
    CData/*4:0*/ single_cycle_tb__DOT__uut__DOT____Vcellinp___registerfile__waddr;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __Vtrigprevexpr___TOP__single_cycle_tb__DOT__clock__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ single_cycle_tb__DOT__uut__DOT__inst;
    IData/*31:0*/ single_cycle_tb__DOT__uut__DOT__pc;
    IData/*31:0*/ single_cycle_tb__DOT__uut__DOT__pc_next;
    IData/*31:0*/ single_cycle_tb__DOT__uut__DOT__result;
    IData/*31:0*/ single_cycle_tb__DOT__uut__DOT__rdata1;
    IData/*31:0*/ single_cycle_tb__DOT__uut__DOT__rdata2;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<IData/*31:0*/, 32> single_cycle_tb__DOT__uut__DOT___instruction_memory__DOT__inst_memory;
    VlUnpacked<IData/*31:0*/, 32> single_cycle_tb__DOT__uut__DOT___registerfile__DOT__register_file;
    VlUnpacked<CData/*0:0*/, 3> __Vm_traceActivity;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<3> __VactTriggered;
    VlTriggerVec<3> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vsingle_cycle_tb__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vsingle_cycle_tb___024root(Vsingle_cycle_tb__Syms* symsp, const char* v__name);
    ~Vsingle_cycle_tb___024root();
    VL_UNCOPYABLE(Vsingle_cycle_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
