// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VTOP__SYMS_H_
#define VERILATED_VTOP__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vtop.h"

// INCLUDE MODULE CLASSES
#include "Vtop___024root.h"

// DPI TYPES for DPI Export callbacks (Internal use)

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Vtop__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vtop* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vtop___024root                 TOP;

    // SCOPE NAMES
    VerilatedScope* __Vscopep_TOP;
    VerilatedScope* __Vscopep_gpio_axi;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__0__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__10__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__11__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__12__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__13__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__14__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__15__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__16__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__17__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__18__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__19__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__1__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__20__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__21__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__22__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__23__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__24__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__25__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__26__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__27__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__28__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__29__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__2__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__30__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__31__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__3__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__4__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__5__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__6__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__7__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__8__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__gen_deb__BRA__9__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_intr_out;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_intr_out__unnamedblk22;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_read;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_read__unnamedblk21;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk1;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk10;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk11;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk12;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk13;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk14;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk15;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk16;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk17;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk18;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk19;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk2;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk20;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk3;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk4;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk5;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk6;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk7;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk8;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_regs__proc_reg_write__unnamedblk9;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__0__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__0__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__10__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__10__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__11__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__11__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__12__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__12__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__13__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__13__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__14__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__14__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__15__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__15__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__16__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__16__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__17__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__17__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__18__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__18__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__19__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__19__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__1__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__1__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__20__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__20__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__21__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__21__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__22__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__22__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__23__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__23__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__24__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__24__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__25__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__25__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__26__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__26__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__27__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__27__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__28__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__28__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__29__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__29__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__2__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__2__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__30__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__30__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__31__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__31__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__3__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__3__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__4__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__4__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__5__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__5__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__6__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__6__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__7__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__7__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__8__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__8__KET____u_gpio_bit;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__9__KET__;
    VerilatedScope* __Vscopep_gpio_axi__u_gpio_wrapper__gen_gpio_bits__BRA__9__KET____u_gpio_bit;

    // SCOPE HIERARCHY
    VerilatedHierarchy __Vhier;

    // CONSTRUCTORS
    Vtop__Syms(VerilatedContext* contextp, const char* namep, Vtop* modelp);
    ~Vtop__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
