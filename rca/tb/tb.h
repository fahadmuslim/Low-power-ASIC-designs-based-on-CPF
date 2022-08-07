
#include <systemc.h>
#include "../src/RCA_32b.cc"
#include "driver.h"
#ifdef CTOS_MODEL
#include "../model/RCA_32b_ctos_wrapper.h"
#endif

SC_MODULE (tb) 
{
	#ifdef CTOS_MODEL
	RCA_32b_ctos_wrapper    RCA;
	#else /* CTOS_MODEL */
	RCA_32b	RCA;
	#endif /* CTOS_MODEL */
	
	driver	stimulus;
	sc_clock		clk;
	sc_signal<bool>	reset,cin,pwr_sig,clk_gate;
	sc_signal<bool>	flag,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15;
	sc_signal<bool>	a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b31,b30;
	sc_signal<bool>	s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,cout;
	sc_signal<sc_uint<10> >	out_flag;

	SC_CTOR(tb)
		: stimulus	("stimulus")
		  #ifdef  CTOS_MODEL
        , RCA		("RCA", CTOS_TARGET_SUFFIX(CTOS_MODEL))
		  #else
		, RCA		("RCA")	
		  #endif
		, clk		("clk", sc_time(5000, SC_PS), 0.5, SC_ZERO_TIME, false)
		, reset     ("reset")
		, cin		("cin")
		, pwr_sig	("pwr_sig")
		, clk_gate	("clk_gate")
		, a0		("a0")
		, a1		("a1")
		, a2		("a2")
		, a3		("a3")
		, a4		("a4")
		, a5		("a5")
		, a6		("a6")
		, a7		("a7")
		, a8		("a8")
		, a9		("a9")
		, a10		("a10")
		, a11		("a11")
		, a12		("a12")
		, a13		("a13")
		, a14		("a14")
		, a15		("a15")
		, a16		("a16")
		, a17		("a17")
		, a18		("a18")
		, a19		("a19")
		, a20		("a20")
		, a21		("a21")
		, a22		("a22")
		, a23		("a23")
		, a24		("a24")
		, a25		("a25")
		, a26		("a26")
		, a27		("a27")
		, a28		("a28")
		, a29		("a29")
		, a30		("a30")
		, a31		("a31")
		, b0		("b0")
		, b1		("b1")
		, b2		("b2")
		, b3		("b3")
		, b4		("b4")
		, b5		("b5")
		, b6		("b6")
		, b7		("b7")
		, b8		("b8")
		, b9		("b9")
		, b10		("b10")
		, b11		("b11")
		, b12		("b12")
		, b13		("b13")
		, b14		("b14")
		, b15		("b15")
		, b16		("b16")
		, b17		("b17")
		, b18		("b18")
		, b19		("b19")
		, b20		("b20")
		, b21		("b21")
		, b22		("b22")
		, b23		("b23")
		, b24		("b24")
		, b25		("b25")
		, b26		("b26")
		, b27		("b27")
		, b28		("b28")
		, b29		("b29")
		, b30		("b30")
		, b31		("b31")
		, s0		("s0")
		, s1		("s1")
		, s2		("s2")
		, s3		("s3")
		, s4		("s4")
		, s5		("s5")
		, s6		("s6")
		, s7		("s7")
		, s8		("s8")
		, s9		("s9")
		, s10		("s10")
		, s11		("s11")
		, s12		("s12")
		, s13		("s13")
		, s14		("s14")
		, s15		("s15")
		, s16		("s16")
		, s17		("s17")
		, s18		("s18")
		, s19		("s19")
		, s20		("s20")
		, s21		("s21")
		, s22		("s22")
		, s23		("s23")
		, s24		("s24")
		, s25		("s25")
		, s26		("s26")
		, s27		("s27")
		, s28		("s28")
		, s29		("s29")
		, s30		("s30")
		, s31		("s31")
		, cout		("cout")
	{
		SC_THREAD (reset_process);
		sensitive << clk.posedge_event();

		stimulus.clk(clk);
		stimulus.reset(reset);
		stimulus.pwr_sig(pwr_sig);
		stimulus.clk_gate(clk_gate);
		stimulus.w_flag(flag);
		stimulus.a0(a0);
		stimulus.b0(b0);
		stimulus.cin(cin);
		stimulus.s0(s0);
		stimulus.a1(a1);
		stimulus.b1(b1);
		stimulus.s1(s1);
		stimulus.a2(a2);
		stimulus.b2(b2);
		stimulus.s2(s2);
		stimulus.a3(a3);
		stimulus.b3(b3);
		stimulus.s3(s3);
		stimulus.a4(a4);
		stimulus.b4(b4);
		stimulus.s4(s4);
		stimulus.a5(a5);
		stimulus.b5(b5);
		stimulus.s5(s5);
		stimulus.a6(a6);
		stimulus.b6(b6);
		stimulus.s6(s6);
		stimulus.a7(a7);
		stimulus.b7(b7);
		stimulus.s7(s7);
		stimulus.a8(a8);
		stimulus.b8(b8);
		stimulus.s8(s8);
		stimulus.a9(a9);
		stimulus.b9(b9);
		stimulus.s9(s9);
		stimulus.a10(a10);
		stimulus.b10(b10);
		stimulus.s10(s10);
		stimulus.a11(a11);
		stimulus.b11(b11);
		stimulus.s11(s11);
		stimulus.a12(a12);
		stimulus.b12(b12);
		stimulus.s12(s12);
		stimulus.a13(a13);
		stimulus.b13(b13);
		stimulus.s13(s13);
		stimulus.a14(a14);
		stimulus.b14(b14);
		stimulus.s14(s14);
		stimulus.a15(a15);
		stimulus.b15(b15);
		stimulus.s15(s15);
		stimulus.a16(a16);
		stimulus.b16(b16);
		stimulus.s16(s16);
		stimulus.a17(a17);
		stimulus.b17(b17);
		stimulus.s17(s17);
		stimulus.a18(a18);
		stimulus.b18(b18);
		stimulus.s18(s18);
		stimulus.a19(a19);
		stimulus.b19(b19);
		stimulus.s19(s19);
		stimulus.a20(a20);
		stimulus.b20(b20);
		stimulus.s20(s20);
		stimulus.a21(a21);
		stimulus.b21(b21);
		stimulus.s21(s21);
		stimulus.a22(a22);
		stimulus.b22(b22);
		stimulus.s22(s22);
		stimulus.a23(a23);
		stimulus.b23(b23);
		stimulus.s23(s23);
		stimulus.a24(a24);
		stimulus.b24(b24);
		stimulus.s24(s24);
		stimulus.a25(a25);
		stimulus.b25(b25);
		stimulus.s25(s25);
		stimulus.a26(a26);
		stimulus.b26(b26);
		stimulus.s26(s26);
		stimulus.a27(a27);
		stimulus.b27(b27);
		stimulus.s27(s27);
		stimulus.a28(a28);
		stimulus.b28(b28);
		stimulus.s28(s28);
		stimulus.a29(a29);
		stimulus.b29(b29);
		stimulus.s29(s29);
		stimulus.a30(a30);
		stimulus.b30(b30);
		stimulus.s30(s30);
		stimulus.a31(a31);
		stimulus.b31(b31);
		stimulus.s31(s31);
		stimulus.cout(cout);

		RCA.clk(clk);
		RCA.reset(reset);
		RCA.pwr_sig(pwr_sig);
		RCA.clk_gate(clk_gate);
		RCA.w_flag(flag);
		RCA.a0(a0);
		RCA.b0(b0);
		RCA.cin(cin);
		RCA.s0(s0);
		RCA.a1(a1);
		RCA.b1(b1);
		RCA.s1(s1);
		RCA.a2(a2);
		RCA.b2(b2);
		RCA.s2(s2);
		RCA.a3(a3);
		RCA.b3(b3);
		RCA.s3(s3);
		RCA.a4(a4);
		RCA.b4(b4);
		RCA.s4(s4);
		RCA.a5(a5);
		RCA.b5(b5);
		RCA.s5(s5);
		RCA.a6(a6);
		RCA.b6(b6);
		RCA.s6(s6);
		RCA.a7(a7);
		RCA.b7(b7);
		RCA.s7(s7);
		RCA.a8(a8);
		RCA.b8(b8);
		RCA.s8(s8);
		RCA.a9(a9);
		RCA.b9(b9);
		RCA.s9(s9);
		RCA.a10(a10);
		RCA.b10(b10);
		RCA.s10(s10);
		RCA.a11(a11);
		RCA.b11(b11);
		RCA.s11(s11);
		RCA.a12(a12);
		RCA.b12(b12);
		RCA.s12(s12);
		RCA.a13(a13);
		RCA.b13(b13);
		RCA.s13(s13);
		RCA.a14(a14);
		RCA.b14(b14);
		RCA.s14(s14);
		RCA.a15(a15);
		RCA.b15(b15);
		RCA.s15(s15);
		RCA.a16(a16);
		RCA.b16(b16);
		RCA.s16(s16);
		RCA.a17(a17);
		RCA.b17(b17);
		RCA.s17(s17);
		RCA.a18(a18);
		RCA.b18(b18);
		RCA.s18(s18);
		RCA.a19(a19);
		RCA.b19(b19);
		RCA.s19(s19);
		RCA.a20(a20);
		RCA.b20(b20);
		RCA.s20(s20);
		RCA.a21(a21);
		RCA.b21(b21);
		RCA.s21(s21);
		RCA.a22(a22);
		RCA.b22(b22);
		RCA.s22(s22);
		RCA.a23(a23);
		RCA.b23(b23);
		RCA.s23(s23);
		RCA.a24(a24);
		RCA.b24(b24);
		RCA.s24(s24);
		RCA.a25(a25);
		RCA.b25(b25);
		RCA.s25(s25);
		RCA.a26(a26);
		RCA.b26(b26);
		RCA.s26(s26);
		RCA.a27(a27);
		RCA.b27(b27);
		RCA.s27(s27);
		RCA.a28(a28);
		RCA.b28(b28);
		RCA.s28(s28);
		RCA.a29(a29);
		RCA.b29(b29);
		RCA.s29(s29);
		RCA.a30(a30);
		RCA.b30(b30);
		RCA.s30(s30);
		RCA.a31(a31);
		RCA.b31(b31);
		RCA.s31(s31);
		RCA.cout(cout);
	}
	void reset_process();
};
