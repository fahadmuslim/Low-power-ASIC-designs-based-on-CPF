#ifndef ALUCTRL_H_INCLUDED
#define ALUCTRL_H_INCLUDED
#include "alu_ops.h"

SC_MODULE(ALUCTRL) {
    sc_in<bool>				clk,reset;
	sc_in<sc_uint<4> >		SEL;   // Bit [0,3] of instruction
    sc_out<sc_uint<4> >		EN;        // Control output to ALU
	sc_in<sc_uint<32> >		OUT_AND,OUT_OR,OUT_ADD,OUT_SUB,OUT_MULT,OUT_DIV,OUT_SL,OUT_SR;
	sc_out<sc_uint<32> >	OUTS;
    
    void aluctrl();
    
    // Constructor
    SC_CTOR(ALUCTRL) {
        SC_CTHREAD (aluctrl, clk.pos());
		reset_signal_is(reset,false);
    }
};

#endif
