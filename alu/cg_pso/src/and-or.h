 
#ifndef AND_OR_H_INCLUDED
#define AND_OR_H_INCLUDED
#include "alu_ops.h"


SC_MODULE(AND_OP) {
	sc_in<bool>				clk,reset;
	sc_in <sc_uint<4> >		EN;	 // Enable port coming from encoder
    sc_in <sc_uint<32> >	A;   // First operand
    sc_in <sc_uint<32> >	B;   // Second operand
    sc_out<sc_uint<32> >	OUTS; // Result
    
    void and_process();
    
    // Constructor
    SC_CTOR(AND_OP) 
	{
        SC_CTHREAD (and_process, clk.pos());
		reset_signal_is(reset,false);
    }
};

SC_MODULE(OR) {
	sc_in<bool>				clk,reset;
	sc_in <sc_uint<4> >		EN;	 // Enable port coming from encoder
    sc_in <sc_uint<32> >	A;   // First operand
    sc_in <sc_uint<32> >	B;   // Second operand
    sc_out <sc_uint<32> >	OUTS; // Result
    
    void or_process();
    
    // Constructor
    SC_CTOR(OR) 
	{
        SC_CTHREAD (or_process, clk.pos());
		reset_signal_is(reset,false);
    }
};

#endif
