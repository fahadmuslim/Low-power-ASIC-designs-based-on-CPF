#include "aluctrl.h"

void ALUCTRL::aluctrl()
{
    sc_uint<4> sel,en;
    
    #ifdef VERBOSE
        cerr << "ALUCTRL" << endl;
    #endif
    EN.write(0);
    OUTS.write(0);
   wait();
    while (true) 
	{
		wait();
		// Determine output
		sel = SEL.read();
    
		switch (sel) {
			case ALU_AND:
						en = ALU_AND;
						OUTS = OUT_AND;
						break;
        
			case ALU_OR:
						en = ALU_OR;
						OUTS = OUT_OR;
						break;
        
			case ALU_ADD:
						en = ALU_ADD;
						OUTS = OUT_ADD;
						break;
        
			case ALU_SUB:
						en = ALU_SUB;
						OUTS = OUT_SUB;
						break;

			case ALU_SHIFT_L:
						en = ALU_SHIFT_L;
						OUTS = OUT_SL;
						break;
        
			case ALU_SHIFT_R:
						en = ALU_SHIFT_R;
						OUTS = OUT_SR;
						break;

			case ALU_MULT:
						en = ALU_MULT;
						OUTS = OUT_MULT;
						break;
        
			case ALU_DIV:
						en = ALU_DIV;
						OUTS = OUT_DIV;
						break;
		}
		// Set result on output
		EN.write(en);
	}
}
