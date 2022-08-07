#include "alu_ops.h"
#include "powercontrol.h"
#ifdef CTOS
#include "add-sub.cpp"
#include "aluctrl.cpp"
#include "and-or.cpp"
#include "mult-div.cpp"
#include "shift.cpp"
#include "ctos_clock_gating.h"
#else
#include "add-sub.h"
#include "aluctrl.h"
#include "and-or.h"
#include "mult-div.h"
#include "shift.h"

#endif
SC_MODULE (Processor)
{  
	powercontrol			pwr_ctrl;
	ALUCTRL					aluctrl;
	ADD						add;
	SUBTRACT				sub;
	AND_OP					and_op;
	OR						or_op;
	MULTIPLY				mult;
	DIVIDE					div;
	SHIFTRIGHT				shift_r;
	SHIFTLEFT				shift_l;
	
	sc_in<bool>				clk, reset;
	sc_in<bool>				pwr_mult,pwr_div,clk_gate_mult,clk_gate_div;
	sc_in<sc_uint<32> >		A,B;
	sc_in<sc_uint<4> >		SEL;
	sc_out<sc_uint<32> >	OUTS;
	sc_signal<sc_uint<4> >	EN;
	sc_signal<bool>			iso_mult,ret_mult,pse_mult,iso_div,ret_div,pse_div;
	sc_signal<sc_uint<32> >	out_and_op,out_or_op,out_add,out_sub,out_mult,out_div,out_sl,out_sr;
	
	#ifdef CTOS
	ctos_clock_gate_signal  GCLK_MULT;
    ctos_clock_gate_module  GCLK_MOD_MULT;
	ctos_clock_gate_signal  GCLK_DIV;
    ctos_clock_gate_module  GCLK_MOD_DIV;
	#endif
	
SC_CTOR(Processor)
    : pwr_ctrl	("pwr_ctrl")
	, aluctrl	("aluctrl")
	, add		("add")
	, sub		("sub")
	, and_op	("and_op")
	, or_op		("or_op")
	, mult		("mult")
	, div		("div")
	, shift_r	("shift_r")
	, shift_l	("shift_l")
	
	#ifdef CTOS
	, GCLK_MOD_MULT	("Clock_gate_module_MULT")
	, GCLK_MOD_DIV	("Clock_gate_module_DIV")
	#endif
	, clk		("clk")
    , reset     ("reset")
	, A			("A")
	, B			("B")
	, SEL		("SEL")
	, OUTS		("OUTS")
	, EN		("EN")
	, pwr_mult	("pwr_mult")
	, iso_mult	("iso_mult")
	, ret_mult	("ret_mult")
	, pse_mult	("pse_mult")
	, clk_gate_mult	("clk_gate_mult")
	, clk_gate_div	("clk_gate_div")
	, pwr_div	("pwr_div")
	, iso_div	("iso_div")
	, ret_div	("ret_div")
	, pse_div	("pse_div")
  {
	#ifdef CTOS
	GCLK_MOD_MULT.clk_in(clk);
    GCLK_MOD_MULT.clk_out(GCLK_MULT);
    GCLK_MOD_MULT.enable(clk_gate_mult);
	GCLK_MOD_DIV.clk_in(clk);
    GCLK_MOD_DIV.clk_out(GCLK_DIV);
    GCLK_MOD_DIV.enable(clk_gate_div);
	#endif	
	pwr_ctrl.clk(clk);
	pwr_ctrl.reset(reset);
	pwr_ctrl.pwr_mult(pwr_mult);
	pwr_ctrl.pse_mult(pse_mult);
	pwr_ctrl.ret_mult(ret_mult);
	pwr_ctrl.iso_mult(iso_mult);
	//pwr_ctrl.clk_gate(clk_gate);
	pwr_ctrl.pwr_div(pwr_div);
	pwr_ctrl.pse_div(pse_div);
	pwr_ctrl.ret_div(ret_div);
	pwr_ctrl.iso_div(iso_div);
	//pwr_ctrl.clk_gate_div(clk_gate_div);

	aluctrl.clk(clk);
	aluctrl.reset(reset);
	aluctrl.SEL(SEL);
	aluctrl.EN(EN);
	aluctrl.OUT_AND(out_and_op);
	aluctrl.OUT_OR(out_or_op);
	aluctrl.OUT_ADD(out_add);
	aluctrl.OUT_SUB(out_sub);
	aluctrl.OUT_MULT(out_mult);
	aluctrl.OUT_DIV(out_div);
	aluctrl.OUT_SL(out_sl);
	aluctrl.OUT_SR(out_sr);
	aluctrl.OUTS(OUTS);

	add.clk(clk);
	add.reset(reset);
	add.EN(EN);
	add.A(A);
	add.B(B);
	add.OUTS(out_add);

	sub.clk(clk);
	sub.reset(reset);
	sub.EN(EN);
	sub.A(A);
	sub.B(B);
	sub.OUTS(out_sub);
	
	and_op.clk(clk);
	and_op.reset(reset);
	and_op.EN(EN);
	and_op.A(A);
	and_op.B(B);
	and_op.OUTS(out_and_op);

	or_op.clk(clk);
	or_op.reset(reset);
	or_op.EN(EN);
	or_op.A(A);
	or_op.B(B);
	or_op.OUTS(out_or_op);

	shift_l.clk(clk);
	shift_l.reset(reset);
	shift_l.EN(EN);
	shift_l.A(A);
	shift_l.B(B);
	shift_l.OUTS(out_sl);
	
	shift_r.clk(clk);
	shift_r.reset(reset);
	shift_r.EN(EN);
	shift_r.A(A);
	shift_r.B(B);
	shift_r.OUTS(out_sr);
	
	mult.reset(reset);
	mult.EN(EN);
	mult.A(A);
	mult.B(B);
	mult.OUTS(out_mult);
	mult.pse(pse_mult);
	mult.ret(ret_mult);
	mult.iso(iso_mult);

	div.reset(reset);
	div.EN(EN);
	div.A(A);
	div.B(B);
	div.OUTS(out_div);
	div.pse(pse_div);
	div.ret(ret_div);
	div.iso(iso_div);

	#ifdef CTOS
	mult.clk(GCLK_MULT);
	div.clk(GCLK_DIV);
	#else
	mult.clk(clk);
	div.clk(clk);
	#endif
	
  }
  
};
#ifdef CTOS
NCSC_MODULE_EXPORT(Processor)
#endif
