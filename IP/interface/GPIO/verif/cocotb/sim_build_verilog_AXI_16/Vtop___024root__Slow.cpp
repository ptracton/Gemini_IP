// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "Vtop__pch.h"

// Parameter definitions for Vtop___024root
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_DATA_I;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_DATA_O;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_DIR;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_INT_EN;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_INT_TYP;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_INT_POL;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_INT_ANY;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_INT_STS;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_SET_O;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_CLR_O;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_TGL_O;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_DEB_TH;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_DEB_EN;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_INV_IN;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_INV_OUT;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_OD_EN;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_WR_MASK;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_PU_EN;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_PD_EN;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_PWM_EN;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_PWM_CFG;
constexpr CData/*6:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__ADDR_PWM_DUTY;
constexpr IData/*31:0*/ Vtop___024root::gpio_axi__DOT__NUM_BITS;
constexpr IData/*31:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_regs__DOT__NUM_BITS;
constexpr IData/*31:0*/ Vtop___024root::gpio_axi__DOT__u_gpio_wrapper__DOT__NUM_BITS;


void Vtop___024root___ctor_var_reset(Vtop___024root* vlSelf);

Vtop___024root::Vtop___024root(Vtop__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vtop___024root___ctor_var_reset(this);
}

void Vtop___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vtop___024root::~Vtop___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
