#include<systemc.h>
#include "fa.h" 

SC_MODULE (RCA_16b)
{  
	full_adder ad0;
	full_adder ad1;
	full_adder ad2;
	full_adder ad3;
	full_adder ad4;
	full_adder ad5;
	full_adder ad6;
	full_adder ad7;
	full_adder ad8;
	full_adder ad9;
	full_adder ad10;
	full_adder ad11;
	full_adder ad12;
	full_adder ad13;
	full_adder ad14;
	full_adder ad15;
	sc_in<bool>					clk, reset;
	sc_in<bool>					cin,iso,ret,pse;
	sc_in<bool>					a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15;
//	sc_out<sc_uint<10> >		out_flag;
	sc_out<bool>				s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,cout;
	sc_signal<bool>				c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14;
	  

SC_CTOR(RCA_16b)
    : /* clk("clk")
    , reset      ("reset")
	, out_flag  ("out_flag")
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
	,*/ad0		("ad0")
	,ad1		("ad1")
	,ad2		("ad2")
	,ad3		("ad3")
	,ad4		("ad4")
	,ad5		("ad5")
	,ad6		("ad6")
	,ad7		("ad7")
	,ad8		("ad8")
	,ad9		("ad9")
	,ad10		("ad10")
	,ad11		("ad11")
	,ad12		("ad12")
	,ad13		("ad13")
	,ad14		("ad14")
	,ad15		("ad15")
  {	  
	ad0.clk(clk);
	ad0.reset(reset);
	ad0.a(a0);
	ad0.b(b0);
	ad0.cin(cin);
	ad0.s(s0);
	ad0.cout(c0);

	ad1.clk(clk);
	ad1.reset(reset);
	ad1.a(a1);
	ad1.b(b1);
	ad1.cin(c0);
	ad1.s(s1);
	ad1.cout(c1);

	ad2.clk(clk);
	ad2.reset(reset);
	ad2.a(a2);
	ad2.b(b2);
	ad2.cin(c1);
	ad2.s(s2);
	ad2.cout(c2);

	ad3.clk(clk);
	ad3.reset(reset);
	ad3.a(a3);
	ad3.b(b3);
	ad3.cin(c2);
	ad3.s(s3);
	ad3.cout(c3);

	ad4.clk(clk);
	ad4.reset(reset);
	ad4.a(a4);
	ad4.b(b4);
	ad4.cin(c3);
	ad4.s(s4);
	ad4.cout(c4);

	ad5.clk(clk);
	ad5.reset(reset);
	ad5.a(a5);
	ad5.b(b5);
	ad5.cin(c4);
	ad5.s(s5);
	ad5.cout(c5);

	ad6.clk(clk);
	ad6.reset(reset);
	ad6.a(a6);
	ad6.b(b6);
	ad6.cin(c5);
	ad6.s(s6);
	ad6.cout(c6);

	ad7.clk(clk);
	ad7.reset(reset);
	ad7.a(a7);
	ad7.b(b7);
	ad7.cin(c6);
	ad7.s(s7);
	ad7.cout(c7);

	ad8.clk(clk);
	ad8.reset(reset);
	ad8.a(a8);
	ad8.b(b8);
	ad8.cin(c7);
	ad8.s(s8);
	ad8.cout(c8);

	ad9.clk(clk);
	ad9.reset(reset);
	ad9.a(a9);
	ad9.b(b9);
	ad9.cin(c8);
	ad9.s(s9);
	ad9.cout(c9);

	ad10.clk(clk);
	ad10.reset(reset);
	ad10.a(a10);
	ad10.b(b10);
	ad10.cin(c9);
	ad10.s(s10);
	ad10.cout(c10);

	ad11.clk(clk);
	ad11.reset(reset);
	ad11.a(a11);
	ad11.b(b11);
	ad11.cin(c10);
	ad11.s(s11);
	ad11.cout(c11);

	ad12.clk(clk);
	ad12.reset(reset);
	ad12.a(a12);
	ad12.b(b12);
	ad12.cin(c11);
	ad12.s(s12);
	ad12.cout(c12);

	ad13.clk(clk);
	ad13.reset(reset);
	ad13.a(a13);
	ad13.b(b13);
	ad13.cin(c12);
	ad13.s(s13);
	ad13.cout(c13);

	ad14.clk(clk);
	ad14.reset(reset);
	ad14.a(a14);
	ad14.b(b14);
	ad14.cin(c13);
	ad14.s(s14);
	ad14.cout(c14);

	ad15.clk(clk);
	ad15.reset(reset);
	ad15.a(a15);
	ad15.b(b15);
	ad15.cin(c14);
	ad15.s(s15);
	ad15.cout(cout);
  }
  
};
