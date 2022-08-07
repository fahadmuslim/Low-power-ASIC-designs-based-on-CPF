#include "powercontrol.h" 
#include "RCA_16b.h" 
#ifdef CTOS
#include "ctos_clock_gating.h"
#endif
SC_MODULE (RCA_32b)
{  
	RCA_16b					lsb_rca;
	RCA_16b					msb_rca;
	powercontrol			pwr_ctrl;
	sc_in<bool>				clk, reset;
	sc_in<bool>				cin,pwr_sig,clk_gate;
	sc_in<bool>				a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15;
	sc_in<bool>				a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31;
	sc_out<bool>			w_flag;
	sc_out<bool>			s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,cout;
	sc_signal<bool>			cout_lsb,iso,ret,pse,iso1,ret1,pse1;
	#ifdef CTOS
	ctos_clock_gate_signal  GCLK;
    ctos_clock_gate_module  GCLK_MOD;
	#endif
	  
SC_CTOR(RCA_32b)
    : lsb_rca	("lsb_rca")
	, msb_rca	("msb_rca")
	, pwr_ctrl	("pwr_ctrl")
	#ifdef CTOS
	, GCLK_MOD	("Clock_gate_module")
	#endif
	, clk		("clk")
    , reset     ("reset")
	, clk_gate	("clk_gate")
	, w_flag	("w_flag")
	, cin		("cin")
	,a0			("a0")
	,a1			("a1")
	,a2			("a2")
	,a3			("a3")
	,a4			("a4")
	,a5			("a5")
	,a6			("a6")
	,a7			("a7")
	,a8			("a8")
	,a9			("a9")
	,a10		("a10")
	,a11		("a11")
	,a12		("a12")
	,a13		("a13")
	,a14		("a14")
	,a15		("a15")
	,b0			("b0")
	,b1			("b1")
	,b2			("b2")
	,b3			("b3")
	,b4			("b4")
	,b5			("b5")
	,b6			("b6")
	,b7			("b7")
	,b8			("b8")
	,b9			("b9")
	,b10		("b10")
	,b11		("b11")
	,b12		("b12")
	,b13		("b13")
	,b14		("b14")
	,b15		("b15")
	,s0			("s0")
	,s1			("s1")
	,s2			("s2")
	,s3			("s3")
	,s4			("s4")
	,s5			("s5")
	,s6			("s6")
	,s7			("s7")
	,s8			("s8")
	,s9			("s9")
	,s10		("s10")
	,s11		("s11")
	,s12		("s12")
	,s13		("s13")
	,s14		("s14")
	,s15		("s15")
	,cout		("cout")
        ,pse		("pse")
	,iso		("iso")
	,ret		("ret")
  {
	#ifdef CTOS
	GCLK_MOD.clk_in(clk);
    GCLK_MOD.clk_out(GCLK);
    GCLK_MOD.enable(clk_gate);
	#endif

	pwr_ctrl.clk(clk);
	pwr_ctrl.reset(reset);
	pwr_ctrl.pwr_sig(pwr_sig);
	//pwr_ctrl.clk_gate(clk_gate);
	pwr_ctrl.pse(pse);
	pwr_ctrl.ret(ret);
	pwr_ctrl.iso(iso);
	pwr_ctrl.pse1(pse1);
	pwr_ctrl.ret1(ret1);
	pwr_ctrl.iso1(iso1);
	pwr_ctrl.w_flag(w_flag);
	lsb_rca.iso(iso1);
	lsb_rca.ret(ret1);
	lsb_rca.pse(pse1);
	lsb_rca.clk(clk);
	lsb_rca.reset(reset);
	lsb_rca.a0(a0);
	lsb_rca.b0(b0);
	lsb_rca.cin(cin);
	lsb_rca.s0(s0);
	lsb_rca.a1(a1);
	lsb_rca.b1(b1);
	lsb_rca.s1(s1);
	lsb_rca.a2(a2);
	lsb_rca.b2(b2);
	lsb_rca.s2(s2);
	lsb_rca.a3(a3);
	lsb_rca.b3(b3);
	lsb_rca.s3(s3);
	lsb_rca.a4(a4);
	lsb_rca.b4(b4);
	lsb_rca.s4(s4);
	lsb_rca.a5(a5);
	lsb_rca.b5(b5);
	lsb_rca.s5(s5);
	lsb_rca.a6(a6);
	lsb_rca.b6(b6);
	lsb_rca.s6(s6);
	lsb_rca.a7(a7);
	lsb_rca.b7(b7);
	lsb_rca.s7(s7);
	lsb_rca.a8(a8);
	lsb_rca.b8(b8);
	lsb_rca.s8(s8);
	lsb_rca.a9(a9);
	lsb_rca.b9(b9);
	lsb_rca.s9(s9);
	lsb_rca.a10(a10);
	lsb_rca.b10(b10);
	lsb_rca.s10(s10);
	lsb_rca.a11(a11);
	lsb_rca.b11(b11);
	lsb_rca.s11(s11);
	lsb_rca.a12(a12);
	lsb_rca.b12(b12);
	lsb_rca.s12(s12);
	lsb_rca.a13(a13);
	lsb_rca.b13(b13);
	lsb_rca.s13(s13);
	lsb_rca.a14(a14);
	lsb_rca.b14(b14);
	lsb_rca.s14(s14);
	lsb_rca.a15(a15);
	lsb_rca.b15(b15);
	lsb_rca.s15(s15);
	lsb_rca.cout(cout_lsb);
	#ifdef CTOS
	msb_rca.clk(GCLK);
	#else
	msb_rca.clk(clk);
	#endif
	msb_rca.reset(reset);
	msb_rca.iso(iso);
	msb_rca.ret(ret);
	msb_rca.pse(pse);
	msb_rca.cin(cout_lsb);
	msb_rca.a0(a16);
	msb_rca.b0(b16);
	msb_rca.s0(s16);
	msb_rca.a1(a17);
	msb_rca.b1(b17);
	msb_rca.s1(s17);
	msb_rca.a2(a18);
	msb_rca.b2(b18);
	msb_rca.s2(s18);
	msb_rca.a3(a19);
	msb_rca.b3(b19);
	msb_rca.s3(s19);
	msb_rca.a4(a20);
	msb_rca.b4(b20);
	msb_rca.s4(s20);
	msb_rca.a5(a21);
	msb_rca.b5(b21);
	msb_rca.s5(s21);
	msb_rca.a6(a22);
	msb_rca.b6(b22);
	msb_rca.s6(s22);
	msb_rca.a7(a23);
	msb_rca.b7(b23);
	msb_rca.s7(s23);
	msb_rca.a8(a24);
	msb_rca.b8(b24);
	msb_rca.s8(s24);
	msb_rca.a9(a25);
	msb_rca.b9(b25);
	msb_rca.s9(s25);
	msb_rca.a10(a26);
	msb_rca.b10(b26);
	msb_rca.s10(s26);
	msb_rca.a11(a27);
	msb_rca.b11(b27);
	msb_rca.s11(s27);
	msb_rca.a12(a28);
	msb_rca.b12(b28);
	msb_rca.s12(s28);
	msb_rca.a13(a29);
	msb_rca.b13(b29);
	msb_rca.s13(s29);
	msb_rca.a14(a30);
	msb_rca.b14(b30);
	msb_rca.s14(s30);
	msb_rca.a15(a31);
	msb_rca.b15(b31);
	msb_rca.s15(s31);
	msb_rca.cout(cout);
  }
  
};
#ifdef CTOS
NCSC_MODULE_EXPORT(RCA_32b)
#endif
