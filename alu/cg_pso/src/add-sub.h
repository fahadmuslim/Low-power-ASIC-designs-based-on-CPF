
#ifndef ADD_H_INCLUDED
#define ADD_H_INCLUDED
#include "alu_ops.h"

SC_MODULE(ADD) {
    sc_in<bool>				clk,reset;
	sc_in <sc_uint<4> >		EN;	 // Enable port coming from encoder
    sc_in <sc_uint<32> >	A;   // First operand
    sc_in <sc_uint<32> >	B;   // Second operand
    sc_out<sc_uint<32> >	OUTS; // Result
    
    void add();
    
    // Constructor
    SC_CTOR(ADD) {
        SC_CTHREAD (add, clk.pos());
		reset_signal_is(reset,false);
    }
};

SC_MODULE(SUBTRACT) {
    sc_in<bool>				clk,reset;
	sc_in <sc_uint<4> >		EN;	 // Enable port coming from encoder
    sc_in <sc_uint<32> >	A;   // First operand
    sc_in <sc_uint<32> >	B;   // Second operand
    sc_out<sc_uint<32> >	OUTS; // Result
    
    void subtract();
    
    // Constructor
    SC_CTOR(SUBTRACT) {
        SC_CTHREAD (subtract, clk.pos());
		reset_signal_is(reset,false);
    }
};

#endif
