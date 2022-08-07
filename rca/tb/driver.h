#include <systemc.h>

SC_MODULE (driver) 
{
	
	sc_in<bool>		clk,reset,w_flag;
	sc_out<bool>	cin,pwr_sig,clk_gate;
	sc_out<bool>	a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15;
	sc_out<bool>	a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b31,b30;
	sc_in<bool>		s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,cout;

	SC_CTOR(driver)		
	{
		SC_CTHREAD (prc_driver, clk.pos());
		reset_signal_is(reset,false);		
	}
	void prc_driver();
};
