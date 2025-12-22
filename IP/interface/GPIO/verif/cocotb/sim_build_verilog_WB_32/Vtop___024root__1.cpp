// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "Vtop__pch.h"

void Vtop___024root___nba_comb__TOP__0(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_comb__TOP__0\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__i 
        = (((((((((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__31__KET____DOT__u_gpio_bit__DOT__i) 
                  << 3U) | ((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__30__KET____DOT__u_gpio_bit__DOT__i) 
                            << 2U)) | (((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__29__KET____DOT__u_gpio_bit__DOT__i) 
                                        << 1U) | (IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__28__KET____DOT__u_gpio_bit__DOT__i))) 
               << 0x0000000cU) | (((((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__27__KET____DOT__u_gpio_bit__DOT__i) 
                                     << 3U) | ((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__26__KET____DOT__u_gpio_bit__DOT__i) 
                                               << 2U)) 
                                   | (((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__25__KET____DOT__u_gpio_bit__DOT__i) 
                                       << 1U) | (IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__24__KET____DOT__u_gpio_bit__DOT__i))) 
                                  << 8U)) | ((((((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__23__KET____DOT__u_gpio_bit__DOT__i) 
                                                 << 3U) 
                                                | ((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__22__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 2U)) 
                                               | (((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__21__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 1U) 
                                                  | (IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__20__KET____DOT__u_gpio_bit__DOT__i))) 
                                              << 4U) 
                                             | ((((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__19__KET____DOT__u_gpio_bit__DOT__i) 
                                                  << 3U) 
                                                 | ((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__18__KET____DOT__u_gpio_bit__DOT__i) 
                                                    << 2U)) 
                                                | (((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__17__KET____DOT__u_gpio_bit__DOT__i) 
                                                    << 1U) 
                                                   | (IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__16__KET____DOT__u_gpio_bit__DOT__i))))) 
            << 0x00000010U) | (((((((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__15__KET____DOT__u_gpio_bit__DOT__i) 
                                    << 3U) | ((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__14__KET____DOT__u_gpio_bit__DOT__i) 
                                              << 2U)) 
                                  | (((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__13__KET____DOT__u_gpio_bit__DOT__i) 
                                      << 1U) | (IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__12__KET____DOT__u_gpio_bit__DOT__i))) 
                                 << 0x0000000cU) | 
                                (((((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__11__KET____DOT__u_gpio_bit__DOT__i) 
                                    << 3U) | ((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__10__KET____DOT__u_gpio_bit__DOT__i) 
                                              << 2U)) 
                                  | (((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__9__KET____DOT__u_gpio_bit__DOT__i) 
                                      << 1U) | (IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__8__KET____DOT__u_gpio_bit__DOT__i))) 
                                 << 8U)) | ((((((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__7__KET____DOT__u_gpio_bit__DOT__i) 
                                                << 3U) 
                                               | ((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__6__KET____DOT__u_gpio_bit__DOT__i) 
                                                  << 2U)) 
                                              | (((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__5__KET____DOT__u_gpio_bit__DOT__i) 
                                                  << 1U) 
                                                 | (IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__4__KET____DOT__u_gpio_bit__DOT__i))) 
                                             << 4U) 
                                            | ((((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__3__KET____DOT__u_gpio_bit__DOT__i) 
                                                 << 3U) 
                                                | ((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__2__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 2U)) 
                                               | (((IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__1__KET____DOT__u_gpio_bit__DOT__i) 
                                                   << 1U) 
                                                  | (IData)(vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__gen_gpio_bits__BRA__0__KET____DOT__u_gpio_bit__DOT__i))))));
    vlSelfRef.gpio_wb__DOT__gpio_i = vlSelfRef.gpio_wb__DOT__u_gpio_wrapper__DOT__i;
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
        = vlSelfRef.gpio_wb__DOT__gpio_i;
}

void Vtop___024root___nba_comb__TOP__1(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_comb__TOP__1\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__0__KET____DOT__gpio_i_sync 
        = (1U & (vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                 ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__1__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 1U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__2__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 2U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__3__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 3U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__4__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 4U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__5__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 5U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__6__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 6U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__7__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 7U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__8__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 8U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__9__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 9U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__10__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000aU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__11__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000bU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__12__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000cU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__13__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000dU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__14__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000eU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__15__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000000fU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__16__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000010U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__17__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000011U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__18__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000012U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__19__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000013U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__20__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000014U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__21__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000015U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__22__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000016U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__23__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000017U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__24__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000018U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__25__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x00000019U));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__26__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001aU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__27__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001bU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__28__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001cU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__29__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001dU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__30__KET____DOT__gpio_i_sync 
        = (1U & ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
                  ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
                 >> 0x0000001eU));
    vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gen_deb__BRA__31__KET____DOT__gpio_i_sync 
        = ((vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__gpio_i 
            ^ vlSelfRef.gpio_wb__DOT__u_gpio_regs__DOT__s_reg_inv_in) 
           >> 0x0000001fU);
}

void Vtop___024root___nba_sequent__TOP__0(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__1(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__2(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__3(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__4(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__5(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__6(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__7(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__8(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__9(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__10(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__11(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__12(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__13(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__14(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__15(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__16(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__17(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__18(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__19(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__20(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__21(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__22(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__23(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__24(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__25(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__26(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__27(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__28(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__29(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__30(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__31(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__32(Vtop___024root* vlSelf);

void Vtop___024root___eval_nba(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_nba\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((0x000000000000000cULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__0(vlSelf);
    }
    if ((0x0000000000000030ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__1(vlSelf);
    }
    if ((0x00000000000000c0ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__2(vlSelf);
    }
    if ((0x0000000000000300ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__3(vlSelf);
    }
    if ((0x0000000000000c00ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__4(vlSelf);
    }
    if ((0x0000000000003000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__5(vlSelf);
    }
    if ((0x000000000000c000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__6(vlSelf);
    }
    if ((0x0000000000030000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__7(vlSelf);
    }
    if ((0x00000000000c0000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__8(vlSelf);
    }
    if ((0x0000000000300000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__9(vlSelf);
    }
    if ((0x0000000000c00000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__10(vlSelf);
    }
    if ((0x0000000003000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__11(vlSelf);
    }
    if ((0x000000000c000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__12(vlSelf);
    }
    if ((0x0000000030000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__13(vlSelf);
    }
    if ((0x00000000c0000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__14(vlSelf);
    }
    if ((0x0000000300000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__15(vlSelf);
    }
    if ((0x0000000c00000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__16(vlSelf);
    }
    if ((0x0000003000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__17(vlSelf);
    }
    if ((0x000000c000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__18(vlSelf);
    }
    if ((0x0000030000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__19(vlSelf);
    }
    if ((0x00000c0000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__20(vlSelf);
    }
    if ((0x0000300000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__21(vlSelf);
    }
    if ((0x0000c00000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__22(vlSelf);
    }
    if ((0x0003000000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__23(vlSelf);
    }
    if ((0x000c000000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__24(vlSelf);
    }
    if ((0x0030000000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__25(vlSelf);
    }
    if ((0x00c0000000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__26(vlSelf);
    }
    if ((0x0300000000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__27(vlSelf);
    }
    if ((0x0c00000000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__28(vlSelf);
    }
    if ((0x3000000000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__29(vlSelf);
    }
    if ((0xc000000000000000ULL & vlSelfRef.__VnbaTriggered
         [0U])) {
        Vtop___024root___nba_sequent__TOP__30(vlSelf);
    }
    if ((3ULL & vlSelfRef.__VnbaTriggered[1U])) {
        Vtop___024root___nba_sequent__TOP__31(vlSelf);
    }
    if ((3ULL & vlSelfRef.__VnbaTriggered[0U])) {
        Vtop___024root___nba_sequent__TOP__32(vlSelf);
    }
    if (((3ULL & vlSelfRef.__VnbaTriggered[1U]) | (0xfffffffffffffffcULL 
                                                   & vlSelfRef.__VnbaTriggered
                                                   [0U]))) {
        Vtop___024root___nba_comb__TOP__0(vlSelf);
    }
    if ((vlSelfRef.__VnbaTriggered[0U] | (3ULL & vlSelfRef.__VnbaTriggered
                                          [1U]))) {
        Vtop___024root___nba_comb__TOP__1(vlSelf);
    }
}

void Vtop___024root___trigger_orInto__act(VlUnpacked<QData/*63:0*/, 2> &out, const VlUnpacked<QData/*63:0*/, 2> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___trigger_orInto__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((2U > n));
}

void Vtop___024root___eval_triggers__act(Vtop___024root* vlSelf);

bool Vtop___024root___eval_phase__act(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_phase__act\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vtop___024root___eval_triggers__act(vlSelf);
    Vtop___024root___trigger_orInto__act(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    return (0U);
}

void Vtop___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 2> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((2U > n));
}

bool Vtop___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 2> &in);

bool Vtop___024root___eval_phase__nba(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_phase__nba\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vtop___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        Vtop___024root___eval_nba(vlSelf);
        Vtop___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
bool Vtop___024root___eval_phase__ico(Vtop___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 2> &triggers, const std::string &tag);
#endif  // VL_DEBUG

void Vtop___024root___eval(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VicoIterCount = 0U;
    vlSelfRef.__VicoFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00000064U < __VicoIterCount)))) {
#ifdef VL_DEBUG
            Vtop___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
#endif
            VL_FATAL_MT("/home/ptracton/src/Gemini_IP/IP/interface/GPIO/verif/cocotb/../../rtl/verilog/gpio_wb.sv", 18, "", "Input combinational region did not converge after 100 tries");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
    } while (Vtop___024root___eval_phase__ico(vlSelf));
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00000064U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vtop___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("/home/ptracton/src/Gemini_IP/IP/interface/GPIO/verif/cocotb/../../rtl/verilog/gpio_wb.sv", 18, "", "NBA region did not converge after 100 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00000064U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vtop___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                VL_FATAL_MT("/home/ptracton/src/Gemini_IP/IP/interface/GPIO/verif/cocotb/../../rtl/verilog/gpio_wb.sv", 18, "", "Active region did not converge after 100 tries");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
        } while (Vtop___024root___eval_phase__act(vlSelf));
    } while (Vtop___024root___eval_phase__nba(vlSelf));
}

#ifdef VL_DEBUG
void Vtop___024root___eval_debug_assertions(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_debug_assertions\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY(((vlSelfRef.wb_clk_i & 0xfeU)))) {
        Verilated::overWidthError("wb_clk_i");
    }
    if (VL_UNLIKELY(((vlSelfRef.wb_rst_i & 0xfeU)))) {
        Verilated::overWidthError("wb_rst_i");
    }
    if (VL_UNLIKELY(((vlSelfRef.wb_we_i & 0xfeU)))) {
        Verilated::overWidthError("wb_we_i");
    }
    if (VL_UNLIKELY(((vlSelfRef.wb_sel_i & 0xf0U)))) {
        Verilated::overWidthError("wb_sel_i");
    }
    if (VL_UNLIKELY(((vlSelfRef.wb_stb_i & 0xfeU)))) {
        Verilated::overWidthError("wb_stb_i");
    }
    if (VL_UNLIKELY(((vlSelfRef.wb_cyc_i & 0xfeU)))) {
        Verilated::overWidthError("wb_cyc_i");
    }
}
#endif  // VL_DEBUG
