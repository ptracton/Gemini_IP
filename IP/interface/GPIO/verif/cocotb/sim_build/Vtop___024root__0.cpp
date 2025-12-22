// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "Vtop__pch.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

void Vtop___024root___eval_triggers__ico(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_triggers__ico\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VicoTriggered[0U] = ((0xfffffffffffffffeULL 
                                      & vlSelfRef.__VicoTriggered
                                      [0U]) | (IData)((IData)(vlSelfRef.__VicoFirstIteration)));
    vlSelfRef.__VicoFirstIteration = 0U;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtop___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
    }
#endif
}

bool Vtop___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___trigger_anySet__ico\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

void Vtop___024root___ico_sequent__TOP__0(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___ico_sequent__TOP__0\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ io__en0;
    io__en0 = 0;
    // Body
    vlSelfRef.s_axi_awready = vlSelfRef.gpio_axi__DOT__s_axi_awready;
    vlSelfRef.s_axi_wready = vlSelfRef.gpio_axi__DOT__s_axi_wready;
    vlSelfRef.gpio_axi__DOT__s_axi_awprot = vlSelfRef.s_axi_awprot;
    vlSelfRef.s_axi_bresp = vlSelfRef.gpio_axi__DOT__s_axi_bresp;
    vlSelfRef.s_axi_bvalid = vlSelfRef.gpio_axi__DOT__s_axi_bvalid;
    vlSelfRef.gpio_axi__DOT__s_axi_bready = vlSelfRef.s_axi_bready;
    vlSelfRef.gpio_axi__DOT__s_axi_arprot = vlSelfRef.s_axi_arprot;
    vlSelfRef.s_axi_arready = vlSelfRef.gpio_axi__DOT__s_axi_arready;
    vlSelfRef.s_axi_rresp = vlSelfRef.gpio_axi__DOT__s_axi_rresp;
    vlSelfRef.s_axi_rvalid = vlSelfRef.gpio_axi__DOT__s_axi_rvalid;
    vlSelfRef.gpio_axi__DOT__s_axi_rready = vlSelfRef.s_axi_rready;
    vlSelfRef.gpio_axi__DOT__reg_ack = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__ack;
    vlSelfRef.gpio_axi__DOT__s_axi_wdata = vlSelfRef.s_axi_wdata;
    vlSelfRef.gpio_axi__DOT__s_axi_wstrb = vlSelfRef.s_axi_wstrb;
    vlSelfRef.gpio_axi__DOT__s_axi_arvalid = vlSelfRef.s_axi_arvalid;
    vlSelfRef.gpio_axi__DOT__s_axi_awaddr = vlSelfRef.s_axi_awaddr;
    vlSelfRef.gpio_axi__DOT__s_axi_araddr = vlSelfRef.s_axi_araddr;
    vlSelfRef.gpio_axi__DOT__s_axi_awvalid = vlSelfRef.s_axi_awvalid;
    vlSelfRef.gpio_axi__DOT__s_axi_wvalid = vlSelfRef.s_axi_wvalid;
    vlSelfRef.gpio_axi__DOT__s_axi_aclk = vlSelfRef.s_axi_aclk;
    vlSelfRef.gpio_axi__DOT__s_axi_aresetn = vlSelfRef.s_axi_aresetn;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pull_up_en 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pu_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pull_down_en 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pd_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
        = ((~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb_q);
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
        = ((~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb_q) 
           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reg_dir 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__open_drain 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_od_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_val 
        = ((((((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                   < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                   [0x1fU]) << 3U) | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [0x1eU]) << 2U)) 
                | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                     < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                     [0x1dU]) << 1U) | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [0x1cU]))) 
               << 0x0000000cU) | ((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                      < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                      [0x1bU]) << 3U) 
                                    | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [0x1aU]) << 2U)) 
                                   | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [0x19U]) << 1U) 
                                      | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                         < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                         [0x18U]))) 
                                  << 8U)) | (((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                  < 
                                                  vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                  [0x17U]) 
                                                 << 3U) 
                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                    < 
                                                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                    [0x16U]) 
                                                   << 2U)) 
                                               | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                    < 
                                                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                    [0x15U]) 
                                                   << 1U) 
                                                  | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                     < 
                                                     vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                     [0x14U]))) 
                                              << 4U) 
                                             | (((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                   < 
                                                   vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                   [0x13U]) 
                                                  << 3U) 
                                                 | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                     < 
                                                     vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                     [0x12U]) 
                                                    << 2U)) 
                                                | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                     < 
                                                     vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                     [0x11U]) 
                                                    << 1U) 
                                                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                      < 
                                                      vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                      [0x10U]))))) 
            << 0x00000010U) | ((((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                     < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                     [0x0fU]) << 3U) 
                                   | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [0x0eU]) << 2U)) 
                                  | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [0x0dU]) << 1U) 
                                     | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [0x0cU]))) 
                                 << 0x0000000cU) | 
                                ((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                     < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                     [0x0bU]) << 3U) 
                                   | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [0x0aU]) << 2U)) 
                                  | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [9U]) << 1U) 
                                     | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [8U]))) << 8U)) 
                               | (((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [7U]) << 3U) 
                                     | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                         < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                         [6U]) << 2U)) 
                                    | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                         < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                         [5U]) << 1U) 
                                       | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                          < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                          [4U]))) << 4U) 
                                  | (((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [3U]) << 3U) 
                                      | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                          < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                          [2U]) << 2U)) 
                                     | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                          < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                          [1U]) << 1U) 
                                        | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                           < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                           [0U]))))));
    vlSelfRef.gpio_axi__DOT__reg_wdata = vlSelfRef.gpio_axi__DOT__s_axi_wdata;
    vlSelfRef.gpio_axi__DOT__reg_be = vlSelfRef.gpio_axi__DOT__s_axi_wstrb;
    vlSelfRef.gpio_axi__DOT__reg_re = ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_arready) 
                                       & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_arvalid));
    vlSelfRef.gpio_axi__DOT__reg_we = ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_wready) 
                                       & ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_wvalid) 
                                          & ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_awready) 
                                             & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_awvalid))));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__s_axi_aclk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__s_axi_aclk;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__s_axi_aresetn;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__s_axi_aresetn;
    vlSelfRef.gpio_axi__DOT__pull_up_en = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pull_up_en;
    vlSelfRef.gpio_axi__DOT__pull_down_en = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pull_down_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__i 
        = (((((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__i) 
                  << 3U) | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__i) 
                            << 2U)) | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__i) 
                                        << 1U) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__i))) 
               << 0x0000000cU) | (((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__i) 
                                     << 3U) | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__i) 
                                               << 2U)) 
                                   | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__i) 
                                       << 1U) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__i))) 
                                  << 8U)) | ((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__i) 
                                                 << 3U) 
                                                | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 2U)) 
                                               | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 1U) 
                                                  | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__i))) 
                                              << 4U) 
                                             | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__i) 
                                                  << 3U) 
                                                 | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__i) 
                                                    << 2U)) 
                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__i) 
                                                    << 1U) 
                                                   | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__i))))) 
            << 0x00000010U) | (((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__i) 
                                    << 3U) | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__i) 
                                              << 2U)) 
                                  | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__i) 
                                      << 1U) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__i))) 
                                 << 0x0000000cU) | 
                                (((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__i) 
                                    << 3U) | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__i) 
                                              << 2U)) 
                                  | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__i) 
                                      << 1U) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__i))) 
                                 << 8U)) | ((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__i) 
                                                << 3U) 
                                               | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__i) 
                                                  << 2U)) 
                                              | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__i) 
                                                  << 1U) 
                                                 | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__i))) 
                                             << 4U) 
                                            | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__i) 
                                                 << 3U) 
                                                | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 2U)) 
                                               | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 1U) 
                                                  | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__i))))));
    vlSelfRef.gpio_axi__DOT__reg_dir = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reg_dir;
    vlSelfRef.gpio_axi__DOT__open_drain = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__open_drain;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reg_data_o 
        = ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_val 
            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_en) 
           | ((~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_en) 
              & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                 ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_out)));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata 
        = vlSelfRef.gpio_axi__DOT__reg_wdata;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be = vlSelfRef.gpio_axi__DOT__reg_be;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__re = vlSelfRef.gpio_axi__DOT__reg_re;
    if (vlSelfRef.gpio_axi__DOT__reg_we) {
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__we = 1U;
        vlSelfRef.gpio_axi__DOT__reg_addr = vlSelfRef.gpio_axi__DOT__s_axi_awaddr;
    } else {
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__we = 0U;
        vlSelfRef.gpio_axi__DOT__reg_addr = vlSelfRef.gpio_axi__DOT__s_axi_araddr;
    }
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__clk 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__clk;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__reset_n 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__reset_n;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
        = vlSelfRef.gpio_axi__DOT__pull_up_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
        = vlSelfRef.gpio_axi__DOT__pull_down_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr_cond 
        = ((((((((2U & (((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ 
                          >> 0x0000001fU) ? ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any 
                                              >> 0x0000001fU)
                                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                 >> 0x0000001fU)
                                              : ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol 
                                                  >> 0x0000001fU)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                  >> 0x0000001fU)
                                                  : 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                  >> 0x0000001fU)))
                          : ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol 
                              >> 0x0000001fU) ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                 >> 0x0000001fU)
                              : (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                    >> 0x0000001fU)))) 
                        << 1U)) | (1U & ((0x40000000U 
                                          & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                          ? ((0x40000000U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                 >> 0x0000001eU)
                                              : ((0x40000000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                  >> 0x0000001eU)
                                                  : 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                  >> 0x0000001eU)))
                                          : ((0x40000000U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                 >> 0x0000001eU)
                                              : (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x0000001eU)))))) 
                << 6U) | (((2U & (((0x20000000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                    ? ((0x20000000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                        ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                           >> 0x0000001dU)
                                        : ((0x20000000U 
                                            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                            ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                               >> 0x0000001dU)
                                            : (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                               >> 0x0000001dU)))
                                    : ((0x20000000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                        ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                           >> 0x0000001dU)
                                        : (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                              >> 0x0000001dU)))) 
                                  << 1U)) | (1U & (
                                                   (0x10000000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                    ? 
                                                   ((0x10000000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                     >> 0x0000001cU)
                                                     : 
                                                    ((0x10000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                      >> 0x0000001cU)
                                                      : 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                      >> 0x0000001cU)))
                                                    : 
                                                   ((0x10000000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 0x0000001cU)
                                                     : 
                                                    (~ 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                      >> 0x0000001cU)))))) 
                          << 4U)) | ((((2U & (((0x08000000U 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                ? (
                                                   (0x08000000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                    >> 0x0000001bU)
                                                    : 
                                                   ((0x08000000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                     >> 0x0000001bU)
                                                     : 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                     >> 0x0000001bU)))
                                                : (
                                                   (0x08000000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 0x0000001bU)
                                                    : 
                                                   (~ 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 0x0000001bU)))) 
                                              << 1U)) 
                                       | (1U & ((0x04000000U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                 ? 
                                                ((0x04000000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                  >> 0x0000001aU)
                                                  : 
                                                 ((0x04000000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                   >> 0x0000001aU)
                                                   : 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                   >> 0x0000001aU)))
                                                 : 
                                                ((0x04000000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x0000001aU)
                                                  : 
                                                 (~ 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 0x0000001aU)))))) 
                                      << 2U) | ((2U 
                                                 & (((0x02000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                      ? 
                                                     ((0x02000000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                       >> 0x00000019U)
                                                       : 
                                                      ((0x02000000U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                        >> 0x00000019U)
                                                        : 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                        >> 0x00000019U)))
                                                      : 
                                                     ((0x02000000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 0x00000019U)
                                                       : 
                                                      (~ 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 0x00000019U)))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & ((0x01000000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                       ? 
                                                      ((0x01000000U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                        >> 0x00000018U)
                                                        : 
                                                       ((0x01000000U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                         ? 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                         >> 0x00000018U)
                                                         : 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                         >> 0x00000018U)))
                                                       : 
                                                      ((0x01000000U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 0x00000018U)
                                                        : 
                                                       (~ 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                         >> 0x00000018U)))))))) 
             << 0x00000018U) | ((((((2U & (((0x00800000U 
                                             & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                             ? ((0x00800000U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                 ? 
                                                (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                 >> 0x00000017U)
                                                 : 
                                                ((0x00800000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                  >> 0x00000017U)
                                                  : 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                  >> 0x00000017U)))
                                             : ((0x00800000U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                 ? 
                                                (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                 >> 0x00000017U)
                                                 : 
                                                (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x00000017U)))) 
                                           << 1U)) 
                                    | (1U & ((0x00400000U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                              ? ((0x00400000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                  >> 0x00000016U)
                                                  : 
                                                 ((0x00400000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                   >> 0x00000016U)
                                                   : 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                   >> 0x00000016U)))
                                              : ((0x00400000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x00000016U)
                                                  : 
                                                 (~ 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 0x00000016U)))))) 
                                   << 6U) | (((2U & 
                                               (((0x00200000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                  ? 
                                                 ((0x00200000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                   >> 0x00000015U)
                                                   : 
                                                  ((0x00200000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                    >> 0x00000015U)
                                                    : 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                    >> 0x00000015U)))
                                                  : 
                                                 ((0x00200000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 0x00000015U)
                                                   : 
                                                  (~ 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 0x00000015U)))) 
                                                << 1U)) 
                                              | (1U 
                                                 & ((0x00100000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                     ? 
                                                    ((0x00100000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                      >> 0x00000014U)
                                                      : 
                                                     ((0x00100000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                       >> 0x00000014U)
                                                       : 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                       >> 0x00000014U)))
                                                     : 
                                                    ((0x00100000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                      >> 0x00000014U)
                                                      : 
                                                     (~ 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 0x00000014U)))))) 
                                             << 4U)) 
                                 | ((((2U & (((0x00080000U 
                                               & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                               ? ((0x00080000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                   >> 0x00000013U)
                                                   : 
                                                  ((0x00080000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                    >> 0x00000013U)
                                                    : 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                    >> 0x00000013U)))
                                               : ((0x00080000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 0x00000013U)
                                                   : 
                                                  (~ 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 0x00000013U)))) 
                                             << 1U)) 
                                      | (1U & ((0x00040000U 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                ? (
                                                   (0x00040000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                    >> 0x00000012U)
                                                    : 
                                                   ((0x00040000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                     >> 0x00000012U)
                                                     : 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                     >> 0x00000012U)))
                                                : (
                                                   (0x00040000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 0x00000012U)
                                                    : 
                                                   (~ 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 0x00000012U)))))) 
                                     << 2U) | ((2U 
                                                & (((0x00020000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                     ? 
                                                    ((0x00020000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                      >> 0x00000011U)
                                                      : 
                                                     ((0x00020000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                       >> 0x00000011U)
                                                       : 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                       >> 0x00000011U)))
                                                     : 
                                                    ((0x00020000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                      >> 0x00000011U)
                                                      : 
                                                     (~ 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 0x00000011U)))) 
                                                   << 1U)) 
                                               | (1U 
                                                  & ((0x00010000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                      ? 
                                                     ((0x00010000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                       >> 0x00000010U)
                                                       : 
                                                      ((0x00010000U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                        >> 0x00000010U)
                                                        : 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                        >> 0x00000010U)))
                                                      : 
                                                     ((0x00010000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 0x00000010U)
                                                       : 
                                                      (~ 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 0x00000010U)))))))) 
                                << 0x00000010U)) | 
           (((((((2U & (((0x00008000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                          ? ((0x00008000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                 >> 0x0000000fU) : 
                             ((0x00008000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                               ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                  >> 0x0000000fU) : 
                              (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                               >> 0x0000000fU))) : 
                         ((0x00008000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                           ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                              >> 0x0000000fU) : (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x0000000fU)))) 
                        << 1U)) | (1U & ((0x00004000U 
                                          & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                          ? ((0x00004000U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                 >> 0x0000000eU)
                                              : ((0x00004000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                  >> 0x0000000eU)
                                                  : 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                  >> 0x0000000eU)))
                                          : ((0x00004000U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                 >> 0x0000000eU)
                                              : (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x0000000eU)))))) 
                << 6U) | (((2U & (((0x00002000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                    ? ((0x00002000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                        ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                           >> 0x0000000dU)
                                        : ((0x00002000U 
                                            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                            ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                               >> 0x0000000dU)
                                            : (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                               >> 0x0000000dU)))
                                    : ((0x00002000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                        ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                           >> 0x0000000dU)
                                        : (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                              >> 0x0000000dU)))) 
                                  << 1U)) | (1U & (
                                                   (0x00001000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                    ? 
                                                   ((0x00001000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                     >> 0x0000000cU)
                                                     : 
                                                    ((0x00001000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                      >> 0x0000000cU)
                                                      : 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                      >> 0x0000000cU)))
                                                    : 
                                                   ((0x00001000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 0x0000000cU)
                                                     : 
                                                    (~ 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                      >> 0x0000000cU)))))) 
                          << 4U)) | ((((2U & (((0x00000800U 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                ? (
                                                   (0x00000800U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                    >> 0x0000000bU)
                                                    : 
                                                   ((0x00000800U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                     >> 0x0000000bU)
                                                     : 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                     >> 0x0000000bU)))
                                                : (
                                                   (0x00000800U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 0x0000000bU)
                                                    : 
                                                   (~ 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 0x0000000bU)))) 
                                              << 1U)) 
                                       | (1U & ((0x00000400U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                 ? 
                                                ((0x00000400U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                  >> 0x0000000aU)
                                                  : 
                                                 ((0x00000400U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                   >> 0x0000000aU)
                                                   : 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                   >> 0x0000000aU)))
                                                 : 
                                                ((0x00000400U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x0000000aU)
                                                  : 
                                                 (~ 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 0x0000000aU)))))) 
                                      << 2U) | ((2U 
                                                 & (((0x00000200U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                      ? 
                                                     ((0x00000200U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                       >> 9U)
                                                       : 
                                                      ((0x00000200U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                        >> 9U)
                                                        : 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                        >> 9U)))
                                                      : 
                                                     ((0x00000200U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 9U)
                                                       : 
                                                      (~ 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 9U)))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & ((0x00000100U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                       ? 
                                                      ((0x00000100U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                        >> 8U)
                                                        : 
                                                       ((0x00000100U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                         ? 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                         >> 8U)
                                                         : 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                         >> 8U)))
                                                       : 
                                                      ((0x00000100U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 8U)
                                                        : 
                                                       (~ 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                         >> 8U)))))))) 
             << 8U) | (((((2U & (((0x00000080U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                   ? ((0x00000080U 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                       ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                          >> 7U) : 
                                      ((0x00000080U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                        ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                           >> 7U) : 
                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                        >> 7U))) : 
                                  ((0x00000080U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                    ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                       >> 7U) : (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 7U)))) 
                                 << 1U)) | (1U & ((0x00000040U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                   ? 
                                                  ((0x00000040U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                    >> 6U)
                                                    : 
                                                   ((0x00000040U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                     >> 6U)
                                                     : 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                     >> 6U)))
                                                   : 
                                                  ((0x00000040U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 6U)
                                                    : 
                                                   (~ 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 6U)))))) 
                         << 6U) | (((2U & (((0x00000020U 
                                             & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                             ? ((0x00000020U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                 ? 
                                                (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                 >> 5U)
                                                 : 
                                                ((0x00000020U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                  >> 5U)
                                                  : 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                  >> 5U)))
                                             : ((0x00000020U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                 ? 
                                                (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                 >> 5U)
                                                 : 
                                                (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 5U)))) 
                                           << 1U)) 
                                    | (1U & ((0x00000010U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                              ? ((0x00000010U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                  >> 4U)
                                                  : 
                                                 ((0x00000010U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                   >> 4U)
                                                   : 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                   >> 4U)))
                                              : ((0x00000010U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 4U)
                                                  : 
                                                 (~ 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 4U)))))) 
                                   << 4U)) | ((((2U 
                                                 & (((8U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                      ? 
                                                     ((8U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                       >> 3U)
                                                       : 
                                                      ((8U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                        >> 3U)
                                                        : 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                        >> 3U)))
                                                      : 
                                                     ((8U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 3U)
                                                       : 
                                                      (~ 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 3U)))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & ((4U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                       ? 
                                                      ((4U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                        >> 2U)
                                                        : 
                                                       ((4U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                         ? 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                         >> 2U)
                                                         : 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                         >> 2U)))
                                                       : 
                                                      ((4U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 2U)
                                                        : 
                                                       (~ 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                         >> 2U)))))) 
                                               << 2U) 
                                              | ((2U 
                                                  & (((2U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                       ? 
                                                      ((2U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                        >> 1U)
                                                        : 
                                                       ((2U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                         ? 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                         >> 1U)
                                                         : 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                         >> 1U)))
                                                       : 
                                                      ((2U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 1U)
                                                        : 
                                                       (~ 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                         >> 1U)))) 
                                                     << 1U)) 
                                                 | (1U 
                                                    & ((1U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                        ? 
                                                       ((1U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                         ? vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any
                                                         : 
                                                        ((1U 
                                                          & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                          ? vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos
                                                          : vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg))
                                                        : 
                                                       ((1U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                         ? vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb
                                                         : 
                                                        (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb)))))))));
    vlSelfRef.gpio_axi__DOT__gpio_i = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__i;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
        = vlSelfRef.gpio_axi__DOT__reg_dir;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
        = vlSelfRef.gpio_axi__DOT__open_drain;
    vlSelfRef.gpio_axi__DOT__reg_data_o = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reg_data_o;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
        = vlSelfRef.gpio_axi__DOT__reg_addr;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr = 0U;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m = 0U;
    while (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m)) {
        if ((1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en 
                   >> (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m)))) {
            if ((1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ 
                       >> (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m)))) {
                if ((1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                           >> (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m)))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr = 1U;
                }
            } else if ((1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr_cond 
                              >> (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m)))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr = 1U;
            }
        }
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m 
            = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m);
    }
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
        = vlSelfRef.gpio_axi__DOT__gpio_i;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
        = vlSelfRef.gpio_axi__DOT__reg_data_o;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0U;
    if ((0x00000040U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((0x00000020U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_cfg;
            }
        } else if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_en;
                }
            } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pd_en;
            }
        } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pu_en;
            }
        } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_wr_mask;
        }
    } else if ((0x00000020U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                    = ((0xffff0000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [(0x0000001fU 
                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                            }
                        } else {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                    = ((0xffff0000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [(0x0000001fU 
                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                            }
                        } else {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_od_en;
                    }
                } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_out;
                }
            } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in;
                }
            } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en;
            }
        } else if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th;
                }
            } else if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                           - (IData)(0x00000054U)), 2U);
            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                       [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
        }
    } else if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k = 0U;
                    while (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = (((~ ((IData)(1U) << 
                                    (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k))) 
                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | (0x00000000ffffffffULL 
                                  & ((1U & ((1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ 
                                                   >> 
                                                   (0x0000001fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k)))
                                             ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                                                >> 
                                                (0x0000001fU 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k))
                                             : (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr_cond 
                                                >> 
                                                (0x0000001fU 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k)))) 
                                     << (0x0000001fU 
                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k))));
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k 
                            = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k);
                    }
                }
            } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any;
            }
        } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol;
            }
        } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ;
        }
    } else if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en;
            }
        } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir;
        }
    } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o;
        }
    } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                           - (IData)(0x00000054U)), 2U);
            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                       [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
        }
    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                           - (IData)(0x00000054U)), 2U);
            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                       [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
        }
    } else {
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb;
    }
    vlSelfRef.gpio_axi__DOT__intr = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__gpio_i_sync 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                 ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__gpio_i_sync 
        = ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
            ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__o 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__reg_rdata = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata;
    vlSelfRef.intr = vlSelfRef.gpio_axi__DOT__intr;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__s_axi_rdata = vlSelfRef.gpio_axi__DOT__reg_rdata;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out48 
        = ((0xfffffffeU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out48) 
           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__o) 
              & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe_actual)));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out63 
        = ((0xfffffffdU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out63) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out62 
        = ((0xfffffffbU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out62) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out61 
        = ((0xfffffff7U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out61) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out60 
        = ((0xffffffefU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out60) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out59 
        = ((0xffffffdfU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out59) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out58 
        = ((0xffffffbfU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out58) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out57 
        = ((0xffffff7fU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out57) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out56 
        = ((0xfffffeffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out56) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out55 
        = ((0xfffffdffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out55) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out54 
        = ((0xfffffbffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out54) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out53 
        = ((0xfffff7ffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out53) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out52 
        = ((0xffffefffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out52) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out51 
        = ((0xffffdfffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out51) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out50 
        = ((0xffffbfffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out50) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out49 
        = ((0xffff7fffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out49) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out32 
        = ((0xfffeffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out32) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out47 
        = ((0xfffdffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out47) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out46 
        = ((0xfffbffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out46) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out45 
        = ((0xfff7ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out45) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out44 
        = ((0xffefffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out44) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out43 
        = ((0xffdfffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out43) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out42 
        = ((0xffbfffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out42) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out41 
        = ((0xff7fffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out41) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out40 
        = ((0xfeffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out40) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out39 
        = ((0xfdffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out39) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out38 
        = ((0xfbffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out38) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out37 
        = ((0xf7ffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out37) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out36 
        = ((0xefffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out36) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out35 
        = ((0xdfffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out35) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out34 
        = ((0xbfffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out34) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out33 
        = ((0x7fffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out33) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001fU));
    io__en0 = (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                << 0x10U) | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                              << 0x1fU) | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                            << 0x1eU) 
                                           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                               << 0x1dU) 
                                              | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                  << 0x1cU) 
                                                 | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                     << 0x1bU) 
                                                    | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                        << 0x1aU) 
                                                       | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                           << 0x19U) 
                                                          | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                              << 0x18U) 
                                                             | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                 << 0x17U) 
                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                    << 0x16U) 
                                                                   | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                       << 0x15U) 
                                                                      | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                          << 0x14U) 
                                                                         | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                             << 0x13U) 
                                                                            | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x12U) 
                                                                               | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x11U) 
                                                                                | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0fU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0eU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0dU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0cU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0bU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0aU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 9U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 8U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 7U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 6U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 5U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 4U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 3U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 2U) 
                                                                                | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 1U))))))))))))))))))))))))))))))));
    vlSelfRef.s_axi_rdata = vlSelfRef.gpio_axi__DOT__s_axi_rdata;
    vlSelfRef.io = (io__en0 & ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out32 
                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                   << 0x10U)) | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out33 
                                                  & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                     << 0x1fU)) 
                                                 | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out34 
                                                     & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                        << 0x1eU)) 
                                                    | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out35 
                                                        & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                           << 0x1dU)) 
                                                       | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out36 
                                                           & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                              << 0x1cU)) 
                                                          | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out37 
                                                              & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                 << 0x1bU)) 
                                                             | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out38 
                                                                 & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                    << 0x1aU)) 
                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out39 
                                                                    & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                       << 0x19U)) 
                                                                   | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out40 
                                                                       & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                          << 0x18U)) 
                                                                      | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out41 
                                                                          & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                             << 0x17U)) 
                                                                         | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out42 
                                                                             & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x16U)) 
                                                                            | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out43 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x15U)) 
                                                                               | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out44 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x14U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out45 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x13U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out46 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x12U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out47 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x11U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out48 
                                                                                & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out49 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0fU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out50 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0eU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out51 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0dU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out52 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0cU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out53 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0bU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out54 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0aU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out55 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 9U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out56 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 8U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out57 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 7U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out58 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 6U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out59 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 5U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out60 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 4U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out61 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 3U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out62 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 2U)) 
                                                                                | (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out63 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 1U))))))))))))))))))))))))))))))))));
    vlSelfRef.gpio_axi__DOT__io = vlSelfRef.io;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
        = vlSelfRef.gpio_axi__DOT__io;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__pad 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
           >> 0x0000001fU);
}

void Vtop___024root___eval_ico(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_ico\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VicoTriggered[0U])) {
        Vtop___024root___ico_sequent__TOP__0(vlSelf);
    }
}

bool Vtop___024root___eval_phase__ico(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_phase__ico\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VicoExecute;
    // Body
    Vtop___024root___eval_triggers__ico(vlSelf);
    __VicoExecute = Vtop___024root___trigger_anySet__ico(vlSelfRef.__VicoTriggered);
    if (__VicoExecute) {
        Vtop___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 2> &triggers, const std::string &tag);
#endif  // VL_DEBUG

void Vtop___024root___eval_triggers__act(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_triggers__act\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered[0U] = (((QData)((IData)(
                                                      ((((((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                               & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                              << 3U) 
                                                             | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                 & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                << 2U)) 
                                                            | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                 & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                << 1U) 
                                                               | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                  & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                           << 0x0000000cU) 
                                                          | ((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                 & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                << 3U) 
                                                               | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                   & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                  << 2U)) 
                                                              | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                   & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                  << 1U) 
                                                                 | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                    & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                             << 8U)) 
                                                         | (((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                 & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                << 3U) 
                                                               | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                   & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                  << 2U)) 
                                                              | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                   & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                  << 1U) 
                                                                 | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                    & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                             << 4U) 
                                                            | (((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                  & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                 << 3U) 
                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                    & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                   << 2U)) 
                                                               | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                    & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                   << 1U) 
                                                                  | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                     & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__clk__0))))))) 
                                                        << 0x00000010U) 
                                                       | ((((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                               << 3U) 
                                                              | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                  & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                 << 2U)) 
                                                             | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                  & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                 << 1U) 
                                                                | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                   & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                            << 0x0000000cU) 
                                                           | ((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                  & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                 << 3U) 
                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                    & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                   << 2U)) 
                                                               | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                    & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                   << 1U) 
                                                                  | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                     & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                              << 8U)) 
                                                          | (((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                  & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                 << 3U) 
                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                    & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                   << 2U)) 
                                                               | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                    & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                   << 1U) 
                                                                  | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                     & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                              << 4U) 
                                                             | (((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                   & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                  << 3U) 
                                                                 | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                     & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                    << 2U)) 
                                                                | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                     & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                    << 1U) 
                                                                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                      & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__clk__0)))))))))) 
                                      << 0x00000020U) 
                                     | (QData)((IData)(
                                                       ((((((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                               << 3U) 
                                                              | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                  & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                 << 2U)) 
                                                             | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                  & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                 << 1U) 
                                                                | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                   & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                            << 0x0000000cU) 
                                                           | ((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                  & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                 << 3U) 
                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                    & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                   << 2U)) 
                                                               | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                    & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                   << 1U) 
                                                                  | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                     & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                              << 8U)) 
                                                          | (((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                  & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                 << 3U) 
                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                    & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                   << 2U)) 
                                                               | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                    & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                   << 1U) 
                                                                  | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                     & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                              << 4U) 
                                                             | (((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                   & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                  << 3U) 
                                                                 | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                     & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                    << 2U)) 
                                                                | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                     & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                    << 1U) 
                                                                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                      & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__clk__0))))))) 
                                                         << 0x00000010U) 
                                                        | ((((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                 & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                << 3U) 
                                                               | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                   & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                  << 2U)) 
                                                              | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                   & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                  << 1U) 
                                                                 | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                    & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                             << 0x0000000cU) 
                                                            | ((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                   & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                  << 3U) 
                                                                 | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                     & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                    << 2U)) 
                                                                | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                     & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                    << 1U) 
                                                                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                      & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                               << 8U)) 
                                                           | (((((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                   & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                  << 3U) 
                                                                 | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                     & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                                    << 2U)) 
                                                                | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                                     & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                                    << 1U) 
                                                                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__clk) 
                                                                      & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__clk__0))))) 
                                                               << 4U) 
                                                              | (((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n)) 
                                                                    & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_regs__DOT__reset_n__0)) 
                                                                   << 3U) 
                                                                  | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__clk) 
                                                                      & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_regs__DOT__clk__0))) 
                                                                     << 2U)) 
                                                                 | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__s_axi_aresetn)) 
                                                                      & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__s_axi_aresetn__0)) 
                                                                     << 1U) 
                                                                    | ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_aclk) 
                                                                       & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__s_axi_aclk__0)))))))))));
    vlSelfRef.__VactTriggered[1U] = (QData)((IData)(
                                                    (((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                        & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                       << 3U) 
                                                      | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__clk) 
                                                          & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__clk__0))) 
                                                         << 2U)) 
                                                     | ((((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__reset_n)) 
                                                          & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__reset_n__0)) 
                                                         << 1U) 
                                                        | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__clk) 
                                                           & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__clk__0)))))));
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__s_axi_aclk__0 
        = vlSelfRef.gpio_axi__DOT__s_axi_aclk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__s_axi_aresetn__0 
        = vlSelfRef.gpio_axi__DOT__s_axi_aresetn;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_regs__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_regs__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__reset_n;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__clk__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__reset_n__0 
        = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__reset_n;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtop___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
}

bool Vtop___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 2> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___trigger_anySet__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((2U > n));
    return (0U);
}

void Vtop___024root___nba_sequent__TOP__0(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__0\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __Vdly__gpio_axi__DOT__s_axi_awready;
    __Vdly__gpio_axi__DOT__s_axi_awready = 0;
    CData/*0:0*/ __Vdly__gpio_axi__DOT__s_axi_wready;
    __Vdly__gpio_axi__DOT__s_axi_wready = 0;
    CData/*0:0*/ __Vdly__gpio_axi__DOT__s_axi_bvalid;
    __Vdly__gpio_axi__DOT__s_axi_bvalid = 0;
    CData/*0:0*/ __Vdly__gpio_axi__DOT__s_axi_arready;
    __Vdly__gpio_axi__DOT__s_axi_arready = 0;
    CData/*0:0*/ __Vdly__gpio_axi__DOT__s_axi_rvalid;
    __Vdly__gpio_axi__DOT__s_axi_rvalid = 0;
    // Body
    __Vdly__gpio_axi__DOT__s_axi_arready = vlSelfRef.gpio_axi__DOT__s_axi_arready;
    __Vdly__gpio_axi__DOT__s_axi_rvalid = vlSelfRef.gpio_axi__DOT__s_axi_rvalid;
    __Vdly__gpio_axi__DOT__s_axi_bvalid = vlSelfRef.gpio_axi__DOT__s_axi_bvalid;
    __Vdly__gpio_axi__DOT__s_axi_wready = vlSelfRef.gpio_axi__DOT__s_axi_wready;
    __Vdly__gpio_axi__DOT__s_axi_awready = vlSelfRef.gpio_axi__DOT__s_axi_awready;
    __Vdly__gpio_axi__DOT__s_axi_arready = ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_aresetn) 
                                            && ((~ (IData)(vlSelfRef.gpio_axi__DOT__s_axi_arready)) 
                                                & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_arvalid)));
    __Vdly__gpio_axi__DOT__s_axi_wready = ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_aresetn) 
                                           && ((((~ (IData)(vlSelfRef.gpio_axi__DOT__s_axi_wready)) 
                                                 & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_wvalid)) 
                                                & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_awvalid)) 
                                               & (IData)(vlSelfRef.gpio_axi__DOT__aw_en)));
    if (vlSelfRef.gpio_axi__DOT__s_axi_aresetn) {
        if (((((~ (IData)(vlSelfRef.gpio_axi__DOT__s_axi_awready)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_awvalid)) 
              & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_wvalid)) 
             & (IData)(vlSelfRef.gpio_axi__DOT__aw_en))) {
            __Vdly__gpio_axi__DOT__s_axi_awready = 1U;
            vlSelfRef.gpio_axi__DOT__aw_en = 0U;
        } else if (((IData)(vlSelfRef.gpio_axi__DOT__s_axi_bready) 
                    & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_bvalid))) {
            vlSelfRef.gpio_axi__DOT__aw_en = 1U;
            __Vdly__gpio_axi__DOT__s_axi_awready = 0U;
        } else {
            __Vdly__gpio_axi__DOT__s_axi_awready = 0U;
        }
        if ((((IData)(vlSelfRef.gpio_axi__DOT__s_axi_arready) 
              & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_arvalid)) 
             & (~ (IData)(vlSelfRef.gpio_axi__DOT__s_axi_rvalid)))) {
            __Vdly__gpio_axi__DOT__s_axi_rvalid = 1U;
            vlSelfRef.gpio_axi__DOT__s_axi_rresp = 0U;
        } else if (((IData)(vlSelfRef.gpio_axi__DOT__s_axi_rready) 
                    & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_rvalid))) {
            __Vdly__gpio_axi__DOT__s_axi_rvalid = 0U;
        }
        if ((((((IData)(vlSelfRef.gpio_axi__DOT__s_axi_awready) 
                & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_awvalid)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_wready)) 
              & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_wvalid)) 
             & (~ (IData)(vlSelfRef.gpio_axi__DOT__s_axi_bvalid)))) {
            __Vdly__gpio_axi__DOT__s_axi_bvalid = 1U;
            vlSelfRef.gpio_axi__DOT__s_axi_bresp = 0U;
        } else if (((IData)(vlSelfRef.gpio_axi__DOT__s_axi_bready) 
                    & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_bvalid))) {
            __Vdly__gpio_axi__DOT__s_axi_bvalid = 0U;
        }
    } else {
        __Vdly__gpio_axi__DOT__s_axi_awready = 0U;
        vlSelfRef.gpio_axi__DOT__aw_en = 1U;
        __Vdly__gpio_axi__DOT__s_axi_rvalid = 0U;
        vlSelfRef.gpio_axi__DOT__s_axi_rresp = 0U;
        __Vdly__gpio_axi__DOT__s_axi_bvalid = 0U;
        vlSelfRef.gpio_axi__DOT__s_axi_bresp = 0U;
    }
    vlSelfRef.gpio_axi__DOT__s_axi_rvalid = __Vdly__gpio_axi__DOT__s_axi_rvalid;
    vlSelfRef.gpio_axi__DOT__s_axi_arready = __Vdly__gpio_axi__DOT__s_axi_arready;
    vlSelfRef.gpio_axi__DOT__s_axi_bvalid = __Vdly__gpio_axi__DOT__s_axi_bvalid;
    vlSelfRef.gpio_axi__DOT__s_axi_awready = __Vdly__gpio_axi__DOT__s_axi_awready;
    vlSelfRef.gpio_axi__DOT__s_axi_wready = __Vdly__gpio_axi__DOT__s_axi_wready;
    vlSelfRef.s_axi_rvalid = vlSelfRef.gpio_axi__DOT__s_axi_rvalid;
    vlSelfRef.s_axi_rresp = vlSelfRef.gpio_axi__DOT__s_axi_rresp;
    vlSelfRef.s_axi_arready = vlSelfRef.gpio_axi__DOT__s_axi_arready;
    vlSelfRef.gpio_axi__DOT__reg_re = ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_arready) 
                                       & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_arvalid));
    vlSelfRef.s_axi_bvalid = vlSelfRef.gpio_axi__DOT__s_axi_bvalid;
    vlSelfRef.s_axi_bresp = vlSelfRef.gpio_axi__DOT__s_axi_bresp;
    vlSelfRef.s_axi_awready = vlSelfRef.gpio_axi__DOT__s_axi_awready;
    vlSelfRef.s_axi_wready = vlSelfRef.gpio_axi__DOT__s_axi_wready;
    vlSelfRef.gpio_axi__DOT__reg_we = ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_wready) 
                                       & ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_wvalid) 
                                          & ((IData)(vlSelfRef.gpio_axi__DOT__s_axi_awready) 
                                             & (IData)(vlSelfRef.gpio_axi__DOT__s_axi_awvalid))));
    vlSelfRef.gpio_axi__DOT__reg_addr = ((IData)(vlSelfRef.gpio_axi__DOT__reg_we)
                                          ? vlSelfRef.gpio_axi__DOT__s_axi_awaddr
                                          : vlSelfRef.gpio_axi__DOT__s_axi_araddr);
}

void Vtop___024root___nba_sequent__TOP__1(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__1\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__2(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__2\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__3(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__3\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__4(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__4\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__5(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__5\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__6(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__6\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__7(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__7\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__8(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__8\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__9(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__9\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__10(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__10\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__11(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__11\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__12(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__12\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__13(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__13\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__14(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__14\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__15(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__15\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__16(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__16\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__17(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__17\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__18(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__18\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__19(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__19\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__20(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__20\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__21(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__21\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__22(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__22\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__23(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__23\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__24(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__24\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__25(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__25\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__26(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__26\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__27(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__27\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__28(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__28\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__29(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__29\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__30(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__30\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__31(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__31\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__32(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__32\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__sync_reg 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__reset_n)
            ? ((2U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                      << 1U)) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__pad))
            : 0U);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__i 
        = (1U & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__sync_reg) 
                 >> 1U));
}

void Vtop___024root___nba_sequent__TOP__33(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__33\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ io__en0;
    io__en0 = 0;
    SData/*15:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts = 0;
    IData/*31:0*/ __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts;
    __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts = 0;
    IData/*31:0*/ __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o = 0;
    IData/*31:0*/ __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o;
    __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v0;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v0 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v0;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v0 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v1;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v1 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v1;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v1 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v2;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v2 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v2;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v2 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v3;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v3 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v3;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v3 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v4;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v4 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v4;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v4 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v5;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v5 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v5;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v5 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v6;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v6 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v6;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v6 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v7;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v7 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v7;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v7 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v8;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v8 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v8;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v8 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v9;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v9 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v9;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v9 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v10;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v10 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v10;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v10 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v11;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v11 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v11;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v11 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v12;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v12 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v12;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v12 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v13;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v13 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v13;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v13 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v14;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v14 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v14;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v14 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v15;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v15 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v15;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v15 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v16;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v16 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v16;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v16 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v17;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v17 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v17;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v17 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v18;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v18 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v18;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v18 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v19;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v19 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v19;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v19 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v20;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v20 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v20;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v20 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v21;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v21 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v21;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v21 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v22;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v22 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v22;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v22 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v23;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v23 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v23;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v23 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v24;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v24 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v24;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v24 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v25;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v25 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v25;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v25 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v26;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v26 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v26;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v26 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v27;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v27 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v27;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v27 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v28;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v28 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v28;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v28 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v29;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v29 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v29;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v29 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v30;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v30 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v30;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v30 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v31;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v31 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v31;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v31 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v32;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v32 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v32;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v32 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v33;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v33 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v33;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v33 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v34;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v34 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v34;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v34 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v35;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v35 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v35;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v35 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v36;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v36 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v36;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v36 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v37;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v37 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v37;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v37 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v38;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v38 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v38;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v38 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v39;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v39 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v39;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v39 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v40;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v40 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v40;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v40 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v41;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v41 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v41;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v41 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v42;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v42 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v42;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v42 = 0;
    SData/*15:0*/ __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v43;
    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v43 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v43;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v43 = 0;
    CData/*4:0*/ __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v44;
    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v44 = 0;
    // Body
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler;
    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb;
    if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n) {
        if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__we) {
            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                          >> 6U)))) {
                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                              >> 5U)))) {
                    if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        if ((1U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                                                = (
                                                   (0xffffff00U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts) 
                                                   | (0x000000ffU 
                                                      & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                                                         & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata))));
                                        }
                                        if ((2U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                                                = (
                                                   (0xffff00ffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts) 
                                                   | (0x0000ff00U 
                                                      & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                                                         & ((~ 
                                                             (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata 
                                                              >> 8U)) 
                                                            << 8U))));
                                        }
                                        if ((4U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                                                = (
                                                   (0xff00ffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts) 
                                                   | (0x00ff0000U 
                                                      & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                                                         & ((~ 
                                                             (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata 
                                                              >> 0x10U)) 
                                                            << 0x00000010U))));
                                        }
                                        if ((8U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                                                = (
                                                   (0x00ffffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts) 
                                                   | (0xff000000U 
                                                      & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                                                         & ((~ 
                                                             (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata 
                                                              >> 0x18U)) 
                                                            << 0x00000018U))));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n) {
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk2__DOT__r = 0U;
        while (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk2__DOT__r)) {
            if ((1U & (((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en 
                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ) 
                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr_cond) 
                       >> (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk2__DOT__r)))) {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                    = (__Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                       | (0x00000000ffffffffULL & ((IData)(1U) 
                                                   << 
                                                   (0x0000001fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk2__DOT__r))));
                __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                    = (__VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                       | (0x00000000ffffffffULL & ((IData)(1U) 
                                                   << 
                                                   (0x0000001fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk2__DOT__r))));
            }
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk2__DOT__r 
                = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk2__DOT__r);
        }
    } else {
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts = 0U;
        __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts = 0xffffffffU;
    }
    if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n) {
        if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__we) {
            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                          >> 6U)))) {
                if ((0x00000020U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                  >> 4U)))) {
                        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                          >> 2U)))) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                                            = (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                                               ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    }
                                }
                            }
                        } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                          >> 1U)))) {
                                if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                                        = (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                                           & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                }
                            }
                        } else if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                             >> 1U)))) {
                            if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                                    = (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            }
                        }
                    }
                }
            }
        }
    }
    if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n) {
        if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__we) {
            if ((0x00000040U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x00000020U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v0 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v0 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v0, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v0));
                        }
                    }
                } else if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v1 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v1 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v1, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v1));
                            }
                        }
                    } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v2 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v2 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v2, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v2));
                            }
                        }
                    } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v3 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v3 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v3, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v3));
                            }
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v4 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v4 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v4, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v4));
                            }
                        }
                    }
                } else if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((0x54U <= (0x0000007fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                    = VL_SHIFTR_III(32,32,32, 
                                                    ((0x0000007fU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                     - (IData)(0x00000054U)), 2U);
                                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v5 
                                        = (0x0000ffffU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v5 
                                        = (0x0000001fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v5, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v5));
                                }
                            }
                        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((0x54U <= (0x0000007fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                    = VL_SHIFTR_III(32,32,32, 
                                                    ((0x0000007fU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                     - (IData)(0x00000054U)), 2U);
                                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v6 
                                        = (0x0000ffffU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v6 
                                        = (0x0000001fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v6, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v6));
                                }
                            }
                        }
                    } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v7 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v7 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v7, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v7));
                            }
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v8 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v8 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v8, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v8));
                            }
                        }
                    }
                } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v9 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v9 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v9, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v9));
                            }
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v10 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v10 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v10, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v10));
                            }
                        }
                    }
                } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v11 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v11 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v11, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v11));
                        }
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v12 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v12 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v12, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v12));
                        }
                    }
                }
            } else if ((0x00000020U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((0x54U <= (0x0000007fU 
                                               & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                        = VL_SHIFTR_III(32,32,32, 
                                                        ((0x0000007fU 
                                                          & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                         - (IData)(0x00000054U)), 2U);
                                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                        __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v13 
                                            = (0x0000ffffU 
                                               & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                        __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v13 
                                            = (0x0000001fU 
                                               & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                        vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v13, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v13));
                                    }
                                }
                            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((0x54U <= (0x0000007fU 
                                               & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                        = VL_SHIFTR_III(32,32,32, 
                                                        ((0x0000007fU 
                                                          & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                         - (IData)(0x00000054U)), 2U);
                                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                        __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v14 
                                            = (0x0000ffffU 
                                               & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                        __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v14 
                                            = (0x0000001fU 
                                               & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                        vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v14, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v14));
                                    }
                                }
                            }
                        } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((0x54U <= (0x0000007fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                    = VL_SHIFTR_III(32,32,32, 
                                                    ((0x0000007fU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                     - (IData)(0x00000054U)), 2U);
                                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v15 
                                        = (0x0000ffffU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v15 
                                        = (0x0000001fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v15, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v15));
                                }
                            }
                        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((0x54U <= (0x0000007fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                    = VL_SHIFTR_III(32,32,32, 
                                                    ((0x0000007fU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                     - (IData)(0x00000054U)), 2U);
                                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v16 
                                        = (0x0000ffffU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v16 
                                        = (0x0000001fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v16, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v16));
                                }
                            }
                        }
                    } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((0x54U <= (0x0000007fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                    = VL_SHIFTR_III(32,32,32, 
                                                    ((0x0000007fU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                     - (IData)(0x00000054U)), 2U);
                                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v17 
                                        = (0x0000ffffU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v17 
                                        = (0x0000001fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v17, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v17));
                                }
                            }
                        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((0x54U <= (0x0000007fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                    = VL_SHIFTR_III(32,32,32, 
                                                    ((0x0000007fU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                     - (IData)(0x00000054U)), 2U);
                                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v18 
                                        = (0x0000ffffU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v18 
                                        = (0x0000001fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v18, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v18));
                                }
                            }
                        }
                    } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v19 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v19 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v19, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v19));
                            }
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v20 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v20 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v20, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v20));
                            }
                        }
                    }
                } else if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((0x54U <= (0x0000007fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                    = VL_SHIFTR_III(32,32,32, 
                                                    ((0x0000007fU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                     - (IData)(0x00000054U)), 2U);
                                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v21 
                                        = (0x0000ffffU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v21 
                                        = (0x0000001fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v21, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v21));
                                }
                            }
                        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((0x54U <= (0x0000007fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                    = VL_SHIFTR_III(32,32,32, 
                                                    ((0x0000007fU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                     - (IData)(0x00000054U)), 2U);
                                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v22 
                                        = (0x0000ffffU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v22 
                                        = (0x0000001fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v22, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v22));
                                }
                            }
                        }
                    } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v23 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v23 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v23, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v23));
                            }
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v24 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v24 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v24, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v24));
                            }
                        }
                    }
                } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v25 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v25 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v25, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v25));
                            }
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v26 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v26 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v26, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v26));
                            }
                        }
                    }
                } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v27 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v27 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v27, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v27));
                        }
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v28 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v28 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v28, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v28));
                        }
                    }
                }
            } else if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((0x54U <= (0x0000007fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                    = VL_SHIFTR_III(32,32,32, 
                                                    ((0x0000007fU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                     - (IData)(0x00000054U)), 2U);
                                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v29 
                                        = (0x0000ffffU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v29 
                                        = (0x0000001fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v29, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v29));
                                }
                            }
                        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((0x54U <= (0x0000007fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                    = VL_SHIFTR_III(32,32,32, 
                                                    ((0x0000007fU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                     - (IData)(0x00000054U)), 2U);
                                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v30 
                                        = (0x0000ffffU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v30 
                                        = (0x0000001fU 
                                           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v30, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v30));
                                }
                            }
                        }
                    } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v31 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v31 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v31, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v31));
                            }
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v32 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v32 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v32, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v32));
                            }
                        }
                    }
                } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v33 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v33 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v33, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v33));
                            }
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v34 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v34 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v34, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v34));
                            }
                        }
                    }
                } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v35 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v35 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v35, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v35));
                        }
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v36 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v36 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v36, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v36));
                        }
                    }
                }
            } else if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v37 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v37 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v37, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v37));
                            }
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                                __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v38 
                                    = (0x0000ffffU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                                __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v38 
                                    = (0x0000001fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                                vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v38, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v38));
                            }
                        }
                    }
                } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v39 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v39 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v39, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v39));
                        }
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v40 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v40 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v40, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v40));
                        }
                    }
                }
            } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v41 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v41 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v41, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v41));
                        }
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                            __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v42 
                                = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v42 
                                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v42, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v42));
                        }
                    }
                }
            } else if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx)) {
                    __VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v43 
                        = (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata);
                    __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v43 
                        = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk6__DOT__duty_idx);
                    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(__VdlyVal__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v43, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v43));
                }
            }
        }
    } else {
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk1__DOT__r = 0U;
        while (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk1__DOT__r)) {
            __VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v44 
                = (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk1__DOT__r);
            vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.enqueue(0U, (IData)(__VdlyDim0__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty__v44));
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk1__DOT__r 
                = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk1__DOT__r);
        }
    }
    if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n) {
        if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__we) {
            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                          >> 6U)))) {
                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                              >> 5U)))) {
                    if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                  >> 4U)))) {
                        if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                      >> 3U)))) {
                            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__b = 0U;
                                        while (VL_GTS_III(32, 4U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__b)) {
                                            if ((1U 
                                                 & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be) 
                                                    >> 
                                                    (3U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__b)))) {
                                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__k = 0U;
                                                while (
                                                       VL_GTS_III(32, 8U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__k)) {
                                                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__unnamedblk5__DOT__bit_idx 
                                                        = 
                                                        (VL_MULS_III(32, (IData)(8U), vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__b) 
                                                         + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__k);
                                                    if (
                                                        (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__unnamedblk5__DOT__bit_idx) 
                                                         & (~ 
                                                            (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_wr_mask 
                                                             >> 
                                                             (0x0000001fU 
                                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__unnamedblk5__DOT__bit_idx))))) {
                                                        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                                                            = 
                                                            (((~ 
                                                               ((IData)(1U) 
                                                                << 
                                                                (0x0000001fU 
                                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__unnamedblk5__DOT__bit_idx))) 
                                                              & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o) 
                                                             | (0x00000000ffffffffULL 
                                                                & ((1U 
                                                                    & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata 
                                                                       >> 
                                                                       (0x0000001fU 
                                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__unnamedblk5__DOT__bit_idx))) 
                                                                   << 
                                                                   (0x0000001fU 
                                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__unnamedblk5__DOT__bit_idx))));
                                                        __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                                                            = 
                                                            (__VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                                                             | (0x00000000ffffffffULL 
                                                                & ((IData)(1U) 
                                                                   << 
                                                                   (0x0000001fU 
                                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__unnamedblk5__DOT__bit_idx))));
                                                    }
                                                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__k 
                                                        = 
                                                        ((IData)(1U) 
                                                         + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__unnamedblk4__DOT__k);
                                                }
                                            }
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__b 
                                                = ((IData)(1U) 
                                                   + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk3__DOT__b);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o = 0U;
        __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o = 0xffffffffU;
    }
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__ack 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n) 
           & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__we) 
              | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__re)));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
        = ((__Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
            & __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts) 
           | (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
              & (~ __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts)));
    __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts = 0U;
    if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n) {
        if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__gpio_i_sync) 
                 != (1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffffffeU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__gpio_i_sync));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffffffeU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__gpio_i_sync));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt = 0U;
        }
        if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 1U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffffffdU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__gpio_i_sync) 
                              << 1U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffffffdU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__gpio_i_sync) 
                      << 1U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt = 0U;
        }
        if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 2U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffffffbU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__gpio_i_sync) 
                              << 2U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffffffbU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__gpio_i_sync) 
                      << 2U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt = 0U;
        }
        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 3U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffffff7U & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__gpio_i_sync) 
                              << 3U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffffff7U & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__gpio_i_sync) 
                      << 3U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 4U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffffffefU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__gpio_i_sync) 
                              << 4U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffffffefU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__gpio_i_sync) 
                      << 4U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00000020U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 5U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffffffdfU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__gpio_i_sync) 
                              << 5U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffffffdfU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__gpio_i_sync) 
                      << 5U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00000040U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 6U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffffffbfU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__gpio_i_sync) 
                              << 6U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffffffbfU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__gpio_i_sync) 
                      << 6U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00000080U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 7U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffffff7fU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__gpio_i_sync) 
                              << 7U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffffff7fU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__gpio_i_sync) 
                      << 7U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00000100U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 8U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffffeffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__gpio_i_sync) 
                              << 8U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffffeffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__gpio_i_sync) 
                      << 8U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00000200U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 9U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffffdffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__gpio_i_sync) 
                              << 9U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffffdffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__gpio_i_sync) 
                      << 9U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00000400U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x0aU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffffbffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__gpio_i_sync) 
                              << 0x0000000aU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffffbffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__gpio_i_sync) 
                      << 0x0000000aU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00000800U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x0bU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffff7ffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__gpio_i_sync) 
                              << 0x0000000bU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffff7ffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__gpio_i_sync) 
                      << 0x0000000bU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00001000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x0cU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffffefffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__gpio_i_sync) 
                              << 0x0000000cU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffffefffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__gpio_i_sync) 
                      << 0x0000000cU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00002000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x0dU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffffdfffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__gpio_i_sync) 
                              << 0x0000000dU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffffdfffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__gpio_i_sync) 
                      << 0x0000000dU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00004000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x0eU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffffbfffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__gpio_i_sync) 
                              << 0x0000000eU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffffbfffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__gpio_i_sync) 
                      << 0x0000000eU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00008000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x0fU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffff7fffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__gpio_i_sync) 
                              << 0x0000000fU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffff7fffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__gpio_i_sync) 
                      << 0x0000000fU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00010000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x10U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffeffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__gpio_i_sync) 
                              << 0x00000010U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffeffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__gpio_i_sync) 
                      << 0x00000010U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00020000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x11U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffdffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__gpio_i_sync) 
                              << 0x00000011U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffdffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__gpio_i_sync) 
                      << 0x00000011U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00040000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x12U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfffbffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__gpio_i_sync) 
                              << 0x00000012U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfffbffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__gpio_i_sync) 
                      << 0x00000012U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00080000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x13U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfff7ffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__gpio_i_sync) 
                              << 0x00000013U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfff7ffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__gpio_i_sync) 
                      << 0x00000013U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00100000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x14U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffefffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__gpio_i_sync) 
                              << 0x00000014U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffefffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__gpio_i_sync) 
                      << 0x00000014U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00200000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x15U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffdfffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__gpio_i_sync) 
                              << 0x00000015U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffdfffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__gpio_i_sync) 
                      << 0x00000015U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00400000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x16U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xffbfffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__gpio_i_sync) 
                              << 0x00000016U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xffbfffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__gpio_i_sync) 
                      << 0x00000016U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt = 0U;
        }
        if ((0x00800000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x17U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xff7fffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__gpio_i_sync) 
                              << 0x00000017U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xff7fffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__gpio_i_sync) 
                      << 0x00000017U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt = 0U;
        }
        if ((0x01000000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x18U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfeffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__gpio_i_sync) 
                              << 0x00000018U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfeffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__gpio_i_sync) 
                      << 0x00000018U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt = 0U;
        }
        if ((0x02000000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x19U)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfdffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__gpio_i_sync) 
                              << 0x00000019U));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfdffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__gpio_i_sync) 
                      << 0x00000019U));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt = 0U;
        }
        if ((0x04000000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x1aU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xfbffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__gpio_i_sync) 
                              << 0x0000001aU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xfbffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__gpio_i_sync) 
                      << 0x0000001aU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt = 0U;
        }
        if ((0x08000000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x1bU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xf7ffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__gpio_i_sync) 
                              << 0x0000001bU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xf7ffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__gpio_i_sync) 
                      << 0x0000001bU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt = 0U;
        }
        if ((0x10000000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x1cU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xefffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__gpio_i_sync) 
                              << 0x0000001cU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xefffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__gpio_i_sync) 
                      << 0x0000001cU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt = 0U;
        }
        if ((0x20000000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x1dU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xdfffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__gpio_i_sync) 
                              << 0x0000001dU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xdfffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__gpio_i_sync) 
                      << 0x0000001dU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt = 0U;
        }
        if ((0x40000000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__gpio_i_sync) 
                 != (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                           >> 0x1eU)))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0xbfffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__gpio_i_sync) 
                              << 0x0000001eU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0xbfffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__gpio_i_sync) 
                      << 0x0000001eU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt = 0U;
        }
        if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en 
             >> 0x1fU)) {
            if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__gpio_i_sync) 
                 != (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                     >> 0x1fU))) {
                if ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt 
                     >= vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th)) {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                        = ((0x7fffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__gpio_i_sync) 
                              << 0x0000001fU));
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt = 0U;
                } else {
                    __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt 
                        = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt);
                }
            } else {
                __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt = 0U;
            }
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                = ((0x7fffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__gpio_i_sync) 
                      << 0x0000001fU));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt = 0U;
        }
        if (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler) 
             >= (0x0000ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_cfg))) {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt 
                = (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                    >= (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_cfg 
                        >> 0x10U)) ? 0U : (0x0000ffffU 
                                           & ((IData)(1U) 
                                              + (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt))));
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler = 0U;
        } else {
            __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler 
                = (0x0000ffffU & ((IData)(1U) + (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler)));
        }
        if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__we) {
            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                          >> 6U)))) {
                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                              >> 5U)))) {
                    if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                          >> 2U)))) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        if ((1U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any 
                                                = (
                                                   (0xffffff00U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any) 
                                                   | (0x000000ffU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((2U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any 
                                                = (
                                                   (0xffff00ffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any) 
                                                   | (0x0000ff00U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((4U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any 
                                                = (
                                                   (0xff00ffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any) 
                                                   | (0x00ff0000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((8U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any 
                                                = (
                                                   (0x00ffffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any) 
                                                   | (0xff000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                    }
                                }
                            }
                        }
                        if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                      >> 3U)))) {
                            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        if ((1U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol 
                                                = (
                                                   (0xffffff00U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol) 
                                                   | (0x000000ffU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((2U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol 
                                                = (
                                                   (0xffff00ffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol) 
                                                   | (0x0000ff00U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((4U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol 
                                                = (
                                                   (0xff00ffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol) 
                                                   | (0x00ff0000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((8U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol 
                                                = (
                                                   (0x00ffffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol) 
                                                   | (0xff000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                  >> 4U)))) {
                        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                          >> 2U)))) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        if ((1U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir 
                                                = (
                                                   (0xffffff00U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir) 
                                                   | (0x000000ffU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((2U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir 
                                                = (
                                                   (0xffff00ffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir) 
                                                   | (0x0000ff00U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((4U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir 
                                                = (
                                                   (0xff00ffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir) 
                                                   | (0x00ff0000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((8U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir 
                                                = (
                                                   (0x00ffffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir) 
                                                   | (0xff000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if ((0x00000020U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                      >> 3U)))) {
                            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in 
                                            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata;
                                    }
                                }
                            }
                        }
                        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_od_en 
                                            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata;
                                    }
                                }
                            }
                            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                          >> 2U)))) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_out 
                                            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((0x00000040U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                              >> 5U)))) {
                    if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                  >> 4U)))) {
                        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                          >> 2U)))) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pd_en 
                                            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata;
                                    }
                                }
                            }
                            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_en 
                                            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata;
                                    }
                                }
                            }
                        }
                        if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                      >> 3U)))) {
                            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pu_en 
                                            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb_q 
            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb;
    } else {
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffffffeU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffffffdU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffffffbU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffffff7U & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffffffefU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffffffdfU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffffffbfU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffffff7fU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffffeffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffffdffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffffbffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffff7ffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffffefffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffffdfffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffffbfffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffff7fffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffeffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffdffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfffbffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfff7ffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffefffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffdfffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xffbfffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xff7fffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfeffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfdffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xfbffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xf7ffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xefffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xdfffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0xbfffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
            = (0x7fffffffU & __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt = 0U;
        __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pd_en = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pu_en = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb_q = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_od_en = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_en = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_out = 0U;
    }
    vlSelfRef.__VdlyCommitQueuegpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty.commit(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty);
    if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reset_n) {
        if (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__we) {
            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                          >> 6U)))) {
                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                              >> 5U)))) {
                    if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                  >> 4U)))) {
                        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        if ((1U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en 
                                                = (
                                                   (0xffffff00U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en) 
                                                   | (0x000000ffU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((2U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en 
                                                = (
                                                   (0xffff00ffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en) 
                                                   | (0x0000ff00U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((4U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en 
                                                = (
                                                   (0xff00ffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en) 
                                                   | (0x00ff0000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((8U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en 
                                                = (
                                                   (0x00ffffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en) 
                                                   | (0xff000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                      >> 3U)))) {
                            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                          >> 2U)))) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        if ((1U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ 
                                                = (
                                                   (0xffffff00U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ) 
                                                   | (0x000000ffU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((2U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ 
                                                = (
                                                   (0xffff00ffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ) 
                                                   | (0x0000ff00U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((4U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ 
                                                = (
                                                   (0xff00ffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ) 
                                                   | (0x00ff0000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((8U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ 
                                                = (
                                                   (0x00ffffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ) 
                                                   | (0xff000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if ((0x00000020U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                      >> 3U)))) {
                            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                          >> 2U)))) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        if ((1U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en 
                                                = (
                                                   (0xffffff00U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en) 
                                                   | (0x000000ffU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((2U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en 
                                                = (
                                                   (0xffff00ffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en) 
                                                   | (0x0000ff00U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((4U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en 
                                                = (
                                                   (0xff00ffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en) 
                                                   | (0x00ff0000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((8U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en 
                                                = (
                                                   (0x00ffffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en) 
                                                   | (0xff000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                  >> 4U)))) {
                        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        if ((1U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th 
                                                = (
                                                   (0xffffff00U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th) 
                                                   | (0x000000ffU 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((2U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th 
                                                = (
                                                   (0xffff00ffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th) 
                                                   | (0x0000ff00U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((4U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th 
                                                = (
                                                   (0xff00ffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th) 
                                                   | (0x00ff0000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                        if ((8U & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__be))) {
                                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th 
                                                = (
                                                   (0x00ffffffU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th) 
                                                   | (0xff000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if ((0x00000040U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                              >> 5U)))) {
                    if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                  >> 4U)))) {
                        if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                      >> 3U)))) {
                            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                          >> 2U)))) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_wr_mask 
                                            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata;
                                    }
                                }
                            }
                        }
                    }
                    if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                      >> 3U)))) {
                            if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                          >> 2U)))) {
                                if ((1U & (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
                                              >> 1U)))) {
                                    if ((1U & (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_cfg 
                                            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__wdata;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_wr_mask = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th = 0U;
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_cfg = 0U;
    }
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
        = ((__Vdly__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
            & __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o) 
           | (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
              & (~ __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o)));
    __VdlyMask__gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o = 0U;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__deb_cnt;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__pwm_prescaler;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
        = __Vdly__gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_val 
        = ((((((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                   < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                   [0x1fU]) << 3U) | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [0x1eU]) << 2U)) 
                | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                     < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                     [0x1dU]) << 1U) | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [0x1cU]))) 
               << 0x0000000cU) | ((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                      < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                      [0x1bU]) << 3U) 
                                    | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [0x1aU]) << 2U)) 
                                   | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [0x19U]) << 1U) 
                                      | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                         < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                         [0x18U]))) 
                                  << 8U)) | (((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                  < 
                                                  vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                  [0x17U]) 
                                                 << 3U) 
                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                    < 
                                                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                    [0x16U]) 
                                                   << 2U)) 
                                               | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                    < 
                                                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                    [0x15U]) 
                                                   << 1U) 
                                                  | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                     < 
                                                     vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                     [0x14U]))) 
                                              << 4U) 
                                             | (((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                   < 
                                                   vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                   [0x13U]) 
                                                  << 3U) 
                                                 | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                     < 
                                                     vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                     [0x12U]) 
                                                    << 2U)) 
                                                | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                     < 
                                                     vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                     [0x11U]) 
                                                    << 1U) 
                                                   | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                                      < 
                                                      vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                                      [0x10U]))))) 
            << 0x00000010U) | ((((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                     < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                     [0x0fU]) << 3U) 
                                   | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [0x0eU]) << 2U)) 
                                  | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [0x0dU]) << 1U) 
                                     | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [0x0cU]))) 
                                 << 0x0000000cU) | 
                                ((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                     < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                     [0x0bU]) << 3U) 
                                   | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [0x0aU]) << 2U)) 
                                  | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [9U]) << 1U) 
                                     | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [8U]))) << 8U)) 
                               | (((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                       < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [7U]) << 3U) 
                                     | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                         < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                         [6U]) << 2U)) 
                                    | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                         < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                         [5U]) << 1U) 
                                       | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                          < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                          [4U]))) << 4U) 
                                  | (((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                        < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                        [3U]) << 3U) 
                                      | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                          < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                          [2U]) << 2U)) 
                                     | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                          < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                          [1U]) << 1U) 
                                        | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_cnt) 
                                           < vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                           [0U]))))));
    vlSelfRef.gpio_axi__DOT__reg_ack = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__ack;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pull_down_en 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pd_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pull_up_en 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pu_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
        = ((~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb) 
           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb_q);
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
        = ((~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb_q) 
           & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb);
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__open_drain 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_od_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reg_dir 
        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reg_data_o 
        = ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pwm_val 
            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_en) 
           | ((~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_en) 
              & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o 
                 ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_out)));
    vlSelfRef.gpio_axi__DOT__pull_down_en = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pull_down_en;
    vlSelfRef.gpio_axi__DOT__pull_up_en = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__pull_up_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos);
    vlSelfRef.gpio_axi__DOT__open_drain = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__open_drain;
    vlSelfRef.gpio_axi__DOT__reg_dir = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reg_dir;
    vlSelfRef.gpio_axi__DOT__reg_data_o = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__reg_data_o;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
        = vlSelfRef.gpio_axi__DOT__pull_down_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
        = vlSelfRef.gpio_axi__DOT__pull_up_en;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr_cond 
        = ((((((((2U & (((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ 
                          >> 0x0000001fU) ? ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any 
                                              >> 0x0000001fU)
                                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                 >> 0x0000001fU)
                                              : ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol 
                                                  >> 0x0000001fU)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                  >> 0x0000001fU)
                                                  : 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                  >> 0x0000001fU)))
                          : ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol 
                              >> 0x0000001fU) ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                 >> 0x0000001fU)
                              : (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                    >> 0x0000001fU)))) 
                        << 1U)) | (1U & ((0x40000000U 
                                          & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                          ? ((0x40000000U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                 >> 0x0000001eU)
                                              : ((0x40000000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                  >> 0x0000001eU)
                                                  : 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                  >> 0x0000001eU)))
                                          : ((0x40000000U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                 >> 0x0000001eU)
                                              : (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x0000001eU)))))) 
                << 6U) | (((2U & (((0x20000000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                    ? ((0x20000000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                        ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                           >> 0x0000001dU)
                                        : ((0x20000000U 
                                            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                            ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                               >> 0x0000001dU)
                                            : (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                               >> 0x0000001dU)))
                                    : ((0x20000000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                        ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                           >> 0x0000001dU)
                                        : (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                              >> 0x0000001dU)))) 
                                  << 1U)) | (1U & (
                                                   (0x10000000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                    ? 
                                                   ((0x10000000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                     >> 0x0000001cU)
                                                     : 
                                                    ((0x10000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                      >> 0x0000001cU)
                                                      : 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                      >> 0x0000001cU)))
                                                    : 
                                                   ((0x10000000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 0x0000001cU)
                                                     : 
                                                    (~ 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                      >> 0x0000001cU)))))) 
                          << 4U)) | ((((2U & (((0x08000000U 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                ? (
                                                   (0x08000000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                    >> 0x0000001bU)
                                                    : 
                                                   ((0x08000000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                     >> 0x0000001bU)
                                                     : 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                     >> 0x0000001bU)))
                                                : (
                                                   (0x08000000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 0x0000001bU)
                                                    : 
                                                   (~ 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 0x0000001bU)))) 
                                              << 1U)) 
                                       | (1U & ((0x04000000U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                 ? 
                                                ((0x04000000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                  >> 0x0000001aU)
                                                  : 
                                                 ((0x04000000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                   >> 0x0000001aU)
                                                   : 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                   >> 0x0000001aU)))
                                                 : 
                                                ((0x04000000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x0000001aU)
                                                  : 
                                                 (~ 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 0x0000001aU)))))) 
                                      << 2U) | ((2U 
                                                 & (((0x02000000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                      ? 
                                                     ((0x02000000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                       >> 0x00000019U)
                                                       : 
                                                      ((0x02000000U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                        >> 0x00000019U)
                                                        : 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                        >> 0x00000019U)))
                                                      : 
                                                     ((0x02000000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 0x00000019U)
                                                       : 
                                                      (~ 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 0x00000019U)))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & ((0x01000000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                       ? 
                                                      ((0x01000000U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                        >> 0x00000018U)
                                                        : 
                                                       ((0x01000000U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                         ? 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                         >> 0x00000018U)
                                                         : 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                         >> 0x00000018U)))
                                                       : 
                                                      ((0x01000000U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 0x00000018U)
                                                        : 
                                                       (~ 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                         >> 0x00000018U)))))))) 
             << 0x00000018U) | ((((((2U & (((0x00800000U 
                                             & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                             ? ((0x00800000U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                 ? 
                                                (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                 >> 0x00000017U)
                                                 : 
                                                ((0x00800000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                  >> 0x00000017U)
                                                  : 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                  >> 0x00000017U)))
                                             : ((0x00800000U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                 ? 
                                                (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                 >> 0x00000017U)
                                                 : 
                                                (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x00000017U)))) 
                                           << 1U)) 
                                    | (1U & ((0x00400000U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                              ? ((0x00400000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                  >> 0x00000016U)
                                                  : 
                                                 ((0x00400000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                   >> 0x00000016U)
                                                   : 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                   >> 0x00000016U)))
                                              : ((0x00400000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x00000016U)
                                                  : 
                                                 (~ 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 0x00000016U)))))) 
                                   << 6U) | (((2U & 
                                               (((0x00200000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                  ? 
                                                 ((0x00200000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                   >> 0x00000015U)
                                                   : 
                                                  ((0x00200000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                    >> 0x00000015U)
                                                    : 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                    >> 0x00000015U)))
                                                  : 
                                                 ((0x00200000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 0x00000015U)
                                                   : 
                                                  (~ 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 0x00000015U)))) 
                                                << 1U)) 
                                              | (1U 
                                                 & ((0x00100000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                     ? 
                                                    ((0x00100000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                      >> 0x00000014U)
                                                      : 
                                                     ((0x00100000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                       >> 0x00000014U)
                                                       : 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                       >> 0x00000014U)))
                                                     : 
                                                    ((0x00100000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                      >> 0x00000014U)
                                                      : 
                                                     (~ 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 0x00000014U)))))) 
                                             << 4U)) 
                                 | ((((2U & (((0x00080000U 
                                               & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                               ? ((0x00080000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                   >> 0x00000013U)
                                                   : 
                                                  ((0x00080000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                    >> 0x00000013U)
                                                    : 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                    >> 0x00000013U)))
                                               : ((0x00080000U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 0x00000013U)
                                                   : 
                                                  (~ 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 0x00000013U)))) 
                                             << 1U)) 
                                      | (1U & ((0x00040000U 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                ? (
                                                   (0x00040000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                    >> 0x00000012U)
                                                    : 
                                                   ((0x00040000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                     >> 0x00000012U)
                                                     : 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                     >> 0x00000012U)))
                                                : (
                                                   (0x00040000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 0x00000012U)
                                                    : 
                                                   (~ 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 0x00000012U)))))) 
                                     << 2U) | ((2U 
                                                & (((0x00020000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                     ? 
                                                    ((0x00020000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                      >> 0x00000011U)
                                                      : 
                                                     ((0x00020000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                       >> 0x00000011U)
                                                       : 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                       >> 0x00000011U)))
                                                     : 
                                                    ((0x00020000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                      >> 0x00000011U)
                                                      : 
                                                     (~ 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 0x00000011U)))) 
                                                   << 1U)) 
                                               | (1U 
                                                  & ((0x00010000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                      ? 
                                                     ((0x00010000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                       >> 0x00000010U)
                                                       : 
                                                      ((0x00010000U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                        >> 0x00000010U)
                                                        : 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                        >> 0x00000010U)))
                                                      : 
                                                     ((0x00010000U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 0x00000010U)
                                                       : 
                                                      (~ 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 0x00000010U)))))))) 
                                << 0x00000010U)) | 
           (((((((2U & (((0x00008000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                          ? ((0x00008000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                 >> 0x0000000fU) : 
                             ((0x00008000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                               ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                  >> 0x0000000fU) : 
                              (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                               >> 0x0000000fU))) : 
                         ((0x00008000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                           ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                              >> 0x0000000fU) : (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x0000000fU)))) 
                        << 1U)) | (1U & ((0x00004000U 
                                          & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                          ? ((0x00004000U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                 >> 0x0000000eU)
                                              : ((0x00004000U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                  >> 0x0000000eU)
                                                  : 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                  >> 0x0000000eU)))
                                          : ((0x00004000U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                              ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                 >> 0x0000000eU)
                                              : (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x0000000eU)))))) 
                << 6U) | (((2U & (((0x00002000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                    ? ((0x00002000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                        ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                           >> 0x0000000dU)
                                        : ((0x00002000U 
                                            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                            ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                               >> 0x0000000dU)
                                            : (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                               >> 0x0000000dU)))
                                    : ((0x00002000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                        ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                           >> 0x0000000dU)
                                        : (~ (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                              >> 0x0000000dU)))) 
                                  << 1U)) | (1U & (
                                                   (0x00001000U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                    ? 
                                                   ((0x00001000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                     >> 0x0000000cU)
                                                     : 
                                                    ((0x00001000U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                      ? 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                      >> 0x0000000cU)
                                                      : 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                      >> 0x0000000cU)))
                                                    : 
                                                   ((0x00001000U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 0x0000000cU)
                                                     : 
                                                    (~ 
                                                     (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                      >> 0x0000000cU)))))) 
                          << 4U)) | ((((2U & (((0x00000800U 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                ? (
                                                   (0x00000800U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                    >> 0x0000000bU)
                                                    : 
                                                   ((0x00000800U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                     >> 0x0000000bU)
                                                     : 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                     >> 0x0000000bU)))
                                                : (
                                                   (0x00000800U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 0x0000000bU)
                                                    : 
                                                   (~ 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 0x0000000bU)))) 
                                              << 1U)) 
                                       | (1U & ((0x00000400U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                 ? 
                                                ((0x00000400U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                  >> 0x0000000aU)
                                                  : 
                                                 ((0x00000400U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                   >> 0x0000000aU)
                                                   : 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                   >> 0x0000000aU)))
                                                 : 
                                                ((0x00000400U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 0x0000000aU)
                                                  : 
                                                 (~ 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 0x0000000aU)))))) 
                                      << 2U) | ((2U 
                                                 & (((0x00000200U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                      ? 
                                                     ((0x00000200U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                       >> 9U)
                                                       : 
                                                      ((0x00000200U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                        >> 9U)
                                                        : 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                        >> 9U)))
                                                      : 
                                                     ((0x00000200U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 9U)
                                                       : 
                                                      (~ 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 9U)))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & ((0x00000100U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                       ? 
                                                      ((0x00000100U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                        >> 8U)
                                                        : 
                                                       ((0x00000100U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                         ? 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                         >> 8U)
                                                         : 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                         >> 8U)))
                                                       : 
                                                      ((0x00000100U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 8U)
                                                        : 
                                                       (~ 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                         >> 8U)))))))) 
             << 8U) | (((((2U & (((0x00000080U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                   ? ((0x00000080U 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                       ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                          >> 7U) : 
                                      ((0x00000080U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                        ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                           >> 7U) : 
                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                        >> 7U))) : 
                                  ((0x00000080U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                    ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                       >> 7U) : (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 7U)))) 
                                 << 1U)) | (1U & ((0x00000040U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                   ? 
                                                  ((0x00000040U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                    >> 6U)
                                                    : 
                                                   ((0x00000040U 
                                                     & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                     ? 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                     >> 6U)
                                                     : 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                     >> 6U)))
                                                   : 
                                                  ((0x00000040U 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                    ? 
                                                   (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                    >> 6U)
                                                    : 
                                                   (~ 
                                                    (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                     >> 6U)))))) 
                         << 6U) | (((2U & (((0x00000020U 
                                             & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                             ? ((0x00000020U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                 ? 
                                                (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                 >> 5U)
                                                 : 
                                                ((0x00000020U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                  >> 5U)
                                                  : 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                  >> 5U)))
                                             : ((0x00000020U 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                 ? 
                                                (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                 >> 5U)
                                                 : 
                                                (~ 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 5U)))) 
                                           << 1U)) 
                                    | (1U & ((0x00000010U 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                              ? ((0x00000010U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                  >> 4U)
                                                  : 
                                                 ((0x00000010U 
                                                   & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                   ? 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                   >> 4U)
                                                   : 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                   >> 4U)))
                                              : ((0x00000010U 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                  ? 
                                                 (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                  >> 4U)
                                                  : 
                                                 (~ 
                                                  (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                   >> 4U)))))) 
                                   << 4U)) | ((((2U 
                                                 & (((8U 
                                                      & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                      ? 
                                                     ((8U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                       >> 3U)
                                                       : 
                                                      ((8U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                        >> 3U)
                                                        : 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                        >> 3U)))
                                                      : 
                                                     ((8U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                       ? 
                                                      (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                       >> 3U)
                                                       : 
                                                      (~ 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 3U)))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & ((4U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                       ? 
                                                      ((4U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                        >> 2U)
                                                        : 
                                                       ((4U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                         ? 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                         >> 2U)
                                                         : 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                         >> 2U)))
                                                       : 
                                                      ((4U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 2U)
                                                        : 
                                                       (~ 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                         >> 2U)))))) 
                                               << 2U) 
                                              | ((2U 
                                                  & (((2U 
                                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                       ? 
                                                      ((2U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any 
                                                        >> 1U)
                                                        : 
                                                       ((2U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                         ? 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos 
                                                         >> 1U)
                                                         : 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg 
                                                         >> 1U)))
                                                       : 
                                                      ((2U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                        ? 
                                                       (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                        >> 1U)
                                                        : 
                                                       (~ 
                                                        (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb 
                                                         >> 1U)))) 
                                                     << 1U)) 
                                                 | (1U 
                                                    & ((1U 
                                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ)
                                                        ? 
                                                       ((1U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any)
                                                         ? vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_any
                                                         : 
                                                        ((1U 
                                                          & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                          ? vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_pos
                                                          : vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_edge_neg))
                                                        : 
                                                       ((1U 
                                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol)
                                                         ? vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb
                                                         : 
                                                        (~ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb)))))))));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
        = vlSelfRef.gpio_axi__DOT__open_drain;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
        = vlSelfRef.gpio_axi__DOT__reg_dir;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
        = vlSelfRef.gpio_axi__DOT__reg_data_o;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__pull_down_en 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_down_en 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__pull_up_en 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__pull_up_en 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr = 0U;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m = 0U;
    while (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m)) {
        if ((1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en 
                   >> (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m)))) {
            if ((1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ 
                       >> (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m)))) {
                if ((1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                           >> (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m)))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr = 1U;
                }
            } else if ((1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr_cond 
                              >> (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m)))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr = 1U;
            }
        }
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m 
            = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk9__DOT__m);
    }
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__open_drain 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__open_drain 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__oe 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__o 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__o 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__o 
           >> 0x0000001fU);
    vlSelfRef.gpio_axi__DOT__intr = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe_actual 
        = ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__open_drain)
            ? ((~ (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__o)) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe))
            : (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe));
    vlSelfRef.intr = vlSelfRef.gpio_axi__DOT__intr;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out48 
        = ((0xfffffffeU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out48) 
           | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__o) 
              & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe_actual)));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out63 
        = ((0xfffffffdU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out63) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out62 
        = ((0xfffffffbU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out62) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out61 
        = ((0xfffffff7U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out61) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out60 
        = ((0xffffffefU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out60) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out59 
        = ((0xffffffdfU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out59) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out58 
        = ((0xffffffbfU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out58) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out57 
        = ((0xffffff7fU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out57) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out56 
        = ((0xfffffeffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out56) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out55 
        = ((0xfffffdffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out55) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out54 
        = ((0xfffffbffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out54) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out53 
        = ((0xfffff7ffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out53) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out52 
        = ((0xffffefffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out52) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out51 
        = ((0xffffdfffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out51) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out50 
        = ((0xffffbfffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out50) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out49 
        = ((0xffff7fffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out49) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out32 
        = ((0xfffeffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out32) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out47 
        = ((0xfffdffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out47) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out46 
        = ((0xfffbffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out46) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out45 
        = ((0xfff7ffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out45) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out44 
        = ((0xffefffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out44) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out43 
        = ((0xffdfffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out43) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out42 
        = ((0xffbfffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out42) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out41 
        = ((0xff7fffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out41) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out40 
        = ((0xfeffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out40) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out39 
        = ((0xfdffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out39) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out38 
        = ((0xfbffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out38) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out37 
        = ((0xf7ffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out37) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out36 
        = ((0xefffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out36) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out35 
        = ((0xdfffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out35) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out34 
        = ((0xbfffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out34) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out33 
        = ((0x7fffffffU & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out33) 
           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__o) 
               & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
              << 0x0000001fU));
    io__en0 = (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                << 0x10U) | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                              << 0x1fU) | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                            << 0x1eU) 
                                           | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                               << 0x1dU) 
                                              | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                  << 0x1cU) 
                                                 | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                     << 0x1bU) 
                                                    | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                        << 0x1aU) 
                                                       | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                           << 0x19U) 
                                                          | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                              << 0x18U) 
                                                             | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                 << 0x17U) 
                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                    << 0x16U) 
                                                                   | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                       << 0x15U) 
                                                                      | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                          << 0x14U) 
                                                                         | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                             << 0x13U) 
                                                                            | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x12U) 
                                                                               | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x11U) 
                                                                                | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0fU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0eU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0dU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0cU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0bU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0aU) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 9U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 8U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 7U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 6U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 5U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 4U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 3U) 
                                                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 2U) 
                                                                                | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 1U))))))))))))))))))))))))))))))));
    vlSelfRef.io = (io__en0 & ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out32 
                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                   << 0x10U)) | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out33 
                                                  & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                     << 0x1fU)) 
                                                 | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out34 
                                                     & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                        << 0x1eU)) 
                                                    | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out35 
                                                        & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                           << 0x1dU)) 
                                                       | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out36 
                                                           & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                              << 0x1cU)) 
                                                          | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out37 
                                                              & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                 << 0x1bU)) 
                                                             | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out38 
                                                                 & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                    << 0x1aU)) 
                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out39 
                                                                    & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                       << 0x19U)) 
                                                                   | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out40 
                                                                       & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                          << 0x18U)) 
                                                                      | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out41 
                                                                          & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                             << 0x17U)) 
                                                                         | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out42 
                                                                             & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x16U)) 
                                                                            | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out43 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x15U)) 
                                                                               | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out44 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x14U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out45 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x13U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out46 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x12U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out47 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x11U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out48 
                                                                                & (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__oe_actual)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out49 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0fU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out50 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0eU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out51 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0dU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out52 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0cU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out53 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0bU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out54 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 0x0aU)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out55 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 9U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out56 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 8U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out57 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 7U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out58 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 6U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out59 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 5U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out60 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 4U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out61 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 3U)) 
                                                                                | ((vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out62 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 2U)) 
                                                                                | (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io__out__strong__out63 
                                                                                & ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__oe_actual) 
                                                                                << 1U))))))))))))))))))))))))))))))))));
    vlSelfRef.gpio_axi__DOT__io = vlSelfRef.io;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
        = vlSelfRef.gpio_axi__DOT__io;
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io);
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__pad 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__pad 
        = (vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__io 
           >> 0x0000001fU);
}

void Vtop___024root___nba_comb__TOP__0(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_comb__TOP__0\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__i 
        = (((((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__i) 
                  << 3U) | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__i) 
                            << 2U)) | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__i) 
                                        << 1U) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__i))) 
               << 0x0000000cU) | (((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__i) 
                                     << 3U) | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__i) 
                                               << 2U)) 
                                   | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__i) 
                                       << 1U) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__i))) 
                                  << 8U)) | ((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__i) 
                                                 << 3U) 
                                                | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 2U)) 
                                               | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 1U) 
                                                  | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__i))) 
                                              << 4U) 
                                             | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__i) 
                                                  << 3U) 
                                                 | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__i) 
                                                    << 2U)) 
                                                | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__i) 
                                                    << 1U) 
                                                   | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__i))))) 
            << 0x00000010U) | (((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__i) 
                                    << 3U) | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__i) 
                                              << 2U)) 
                                  | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__i) 
                                      << 1U) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__i))) 
                                 << 0x0000000cU) | 
                                (((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__i) 
                                    << 3U) | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__i) 
                                              << 2U)) 
                                  | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__i) 
                                      << 1U) | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__i))) 
                                 << 8U)) | ((((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__i) 
                                                << 3U) 
                                               | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__i) 
                                                  << 2U)) 
                                              | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__i) 
                                                  << 1U) 
                                                 | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__i))) 
                                             << 4U) 
                                            | ((((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__i) 
                                                 << 3U) 
                                                | ((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 2U)) 
                                               | (((IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 1U) 
                                                  | (IData)(vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__i))))));
    vlSelfRef.gpio_axi__DOT__gpio_i = vlSelfRef.gpio_axi__DOT__u_gpio_wrapper__DOT__i;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
        = vlSelfRef.gpio_axi__DOT__gpio_i;
}

void Vtop___024root___nba_sequent__TOP__34(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__34\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__re = vlSelfRef.gpio_axi__DOT__reg_re;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__we = vlSelfRef.gpio_axi__DOT__reg_we;
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr 
        = vlSelfRef.gpio_axi__DOT__reg_addr;
}

void Vtop___024root___nba_comb__TOP__1(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_comb__TOP__1\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__gpio_i_sync 
        = (1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                 ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 1U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 2U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 3U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 4U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 5U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 6U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 7U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 8U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 9U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000fU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000010U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000011U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000012U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000013U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000014U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000015U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000016U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000017U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000018U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000019U));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001aU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001bU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001cU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001dU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001eU));
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__gpio_i_sync 
        = ((vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i 
            ^ vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
           >> 0x0000001fU);
}

void Vtop___024root___nba_comb__TOP__2(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_comb__TOP__2\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0U;
    if ((0x00000040U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((0x00000020U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_cfg;
            }
        } else if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_en;
                }
            } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pd_en;
            }
        } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pu_en;
            }
        } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_wr_mask;
        }
    } else if ((0x00000020U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                    = ((0xffff0000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [(0x0000001fU 
                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                            }
                        } else {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                        }
                    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                        if ((0x54U <= (0x0000007fU 
                                       & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                                = VL_SHIFTR_III(32,32,32, 
                                                ((0x0000007fU 
                                                  & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                 - (IData)(0x00000054U)), 2U);
                            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                    = ((0xffff0000U 
                                        & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                       [(0x0000001fU 
                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                            }
                        } else {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_od_en;
                    }
                } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_out;
                }
            } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_inv_in;
                }
            } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_en;
            }
        } else if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_deb_th;
                }
            } else if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                           - (IData)(0x00000054U)), 2U);
            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                       [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
        }
    } else if ((0x00000010U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                    if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                            = VL_SHIFTR_III(32,32,32, 
                                            ((0x0000007fU 
                                              & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                             - (IData)(0x00000054U)), 2U);
                        if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                                = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                                   | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                                   [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                        }
                    } else {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k = 0U;
                    while (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = (((~ ((IData)(1U) << 
                                    (0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k))) 
                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | (0x00000000ffffffffULL 
                                  & ((1U & ((1U & (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ 
                                                   >> 
                                                   (0x0000001fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k)))
                                             ? (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_sts 
                                                >> 
                                                (0x0000001fU 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k))
                                             : (vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__intr_cond 
                                                >> 
                                                (0x0000001fU 
                                                 & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k)))) 
                                     << (0x0000001fU 
                                         & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k))));
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k 
                            = ((IData)(1U) + vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk7__DOT__k);
                    }
                }
            } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_any;
            }
        } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_pol;
            }
        } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_typ;
        }
    } else if ((8U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
                if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                        = VL_SHIFTR_III(32,32,32, (
                                                   (0x0000007fU 
                                                    & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                                   - (IData)(0x00000054U)), 2U);
                    if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                            = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                               | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                               [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                    }
                } else {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_int_en;
            }
        } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_dir;
        }
    } else if ((4U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
            if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                    = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                                & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                               - (IData)(0x00000054U)), 2U);
                if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                    vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                        = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                           | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                           [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
                }
            } else {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_data_o;
        }
    } else if ((2U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                           - (IData)(0x00000054U)), 2U);
            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                       [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
        }
    } else if ((1U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr)) {
        if ((0x54U <= (0x0000007fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr))) {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx 
                = VL_SHIFTR_III(32,32,32, ((0x0000007fU 
                                            & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__addr) 
                                           - (IData)(0x00000054U)), 2U);
            if (VL_GTS_III(32, 0x00000020U, vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)) {
                vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
                    = ((0xffff0000U & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata) 
                       | vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__s_reg_pwm_duty
                       [(0x0000001fU & vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__unnamedblk8__DOT__duty_idx)]);
            }
        } else {
            vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata = 0xdeadbeefU;
        }
    } else {
        vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata 
            = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__gpio_i_deb;
    }
    vlSelfRef.gpio_axi__DOT__reg_rdata = vlSelfRef.gpio_axi__DOT__u_gpio_regs__DOT__rdata;
    vlSelfRef.gpio_axi__DOT__s_axi_rdata = vlSelfRef.gpio_axi__DOT__reg_rdata;
    vlSelfRef.s_axi_rdata = vlSelfRef.gpio_axi__DOT__s_axi_rdata;
}
