
#include <systemc.h>
#include "../src/processor.cc"
#include "driver.h"
#ifdef CTOS_MODEL
#include "../model/Processor_ctos_wrapper.h"
#endif

SC_MODULE (tb) 
{
	#ifdef CTOS_MODEL
	Processor_ctos_wrapper    ALU;
	#else /* CTOS_MODEL */
	Processor	ALU;
	#endif /* CTOS_MODEL */
	
	driver	stimulus;
	sc_clock		clk;
	sc_signal<bool>	reset,pwr_mult,pwr_div,clk_gate_mult,clk_gate_div;
	sc_signal<sc_uint<32> > a,b,outs;
	sc_signal<sc_uint<4> > sel;

	SC_CTOR(tb)
		: stimulus	("stimulus")
		  #ifdef  CTOS_MODEL
        , ALU		("ALU", CTOS_TARGET_SUFFIX(CTOS_MODEL))
		  #else
		, ALU		("ALU")	
		  #endif
		, clk		("clk", sc_time(5000, SC_PS), 0.5, SC_ZERO_TIME, false)
		, reset     ("reset")
		, pwr_mult	("pwr_mult")
		, pwr_div	("pwr_div")
		, clk_gate_mult	("clk_gate_mult")
		, clk_gate_div	("clk_gate_div")
		, a			("a")
		, b			("b")
		, outs		("outs")
		, sel		("sel")
		
	{
		SC_THREAD (reset_process);
		sensitive << clk.posedge_event();

		stimulus.clk(clk);
		stimulus.reset(reset);
		stimulus.PWR_MULT(pwr_mult);
		stimulus.PWR_DIV(pwr_div);
		stimulus.CLK_GATE_MULT(clk_gate_mult);
		stimulus.CLK_GATE_DIV(clk_gate_div);
		stimulus.A(a);
		stimulus.B(b);
		stimulus.OUTS(outs);
		stimulus.SEL(sel);
		
		ALU.clk(clk);
		ALU.reset(reset);
		ALU.clk_gate_mult(clk_gate_mult);
		ALU.clk_gate_div(clk_gate_div);
		ALU.pwr_mult(pwr_mult);
		ALU.pwr_div(pwr_div);
		ALU.A(a);
		ALU.B(b);
		ALU.OUTS(outs);
		ALU.SEL(sel);
	}
	void reset_process();
};
