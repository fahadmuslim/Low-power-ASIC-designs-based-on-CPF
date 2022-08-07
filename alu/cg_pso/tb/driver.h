#include "../src/alu_ops.h"

SC_MODULE (driver) 
{
	
	sc_in<bool>				clk,reset;
	sc_out<bool>			PWR_MULT,PWR_DIV,CLK_GATE_MULT,CLK_GATE_DIV;
	sc_out<sc_uint<32> >	A,B;
	sc_out<sc_uint<4> >		SEL;
	sc_in<sc_uint<32> >		OUTS;

	SC_CTOR(driver)		
	{
		SC_CTHREAD (prc_driver, clk.pos());
		reset_signal_is(reset,false);		
	}
	void prc_driver();
};
