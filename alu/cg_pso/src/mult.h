
#ifndef MULT_H_INCLUDED
#define MULT_H_INCLUDED
#include "alu_ops.h"


SC_MODULE(MULTIPLY) {
    sc_in<bool>				clk,reset;
	sc_in <sc_uint<4> >		EN;	 // Enable port coming from encoder
    sc_in <sc_uint<32> >	A;   // First operand
    sc_in <sc_uint<32> >	B;   // Second operand
	sc_out <sc_uint<32> >	OUTS; // Result
    sc_in <bool>			iso,ret,pse;

    void multiply();
    
    SC_CTOR(MULTIPLY) {
        SC_CTHREAD (multiply, clk.pos());
		reset_signal_is(reset,false);
    }
};

SC_MODULE(DIVIDE) {
    sc_in<bool>				clk,reset;
	sc_in <sc_uint<4> >		EN;	 // Enable port coming from encoder
    sc_in <sc_uint<32> >	A;   // First operand
    sc_in <sc_uint<32> >	B;   // Second operand
	sc_out <sc_uint<32> >	OUTS; // Result
	sc_in <bool>			iso,ret,pse;
    
    void divide();
    
    SC_CTOR(DIVIDE) {
        SC_CTHREAD (divide, clk.pos());
		reset_signal_is(reset,false);
    }
};

#endif
