
#ifndef SHIFT_H_INCLUDED
#define SHIFT_H_INCLUDED
#include "alu_ops.h"


SC_MODULE(SHIFTRIGHT) {
    sc_in<bool>				clk,reset;
	sc_in <sc_uint<4> >		EN;	 // Enable port coming from encoder
    sc_in <sc_uint<32> >	A;   // First operand
    sc_in <sc_uint<32> >	B;   // Second operand
	sc_out <sc_uint<32> >	OUTS; // Result
    
    void shiftright();
    
    SC_CTOR(SHIFTRIGHT) {
        SC_CTHREAD (shiftright, clk.pos());
		reset_signal_is(reset,false);
    }
};

SC_MODULE(SHIFTLEFT) {
    sc_in<bool>				clk,reset;
	sc_in <sc_uint<4> >		EN;	 // Enable port coming from encoder
    sc_in <sc_uint<32> >	A;   // First operand
    sc_in <sc_uint<32> >	B;   // Second operand
	sc_out <sc_uint<32> >	OUTS; // Result
    
    void shiftleft();
    
    SC_CTOR(SHIFTLEFT) {
        SC_CTHREAD (shiftleft, clk.pos());
		reset_signal_is(reset,false);
    }
};

#endif
