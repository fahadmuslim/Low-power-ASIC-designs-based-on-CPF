#include "and-or.h"

void AND_OP::and_process()
{
    sc_uint<32> a, b, r;
	OUTS.write(0);

    #ifdef VERBOSE
        cerr << "AND" << endl;
    #endif
    while (true) 
	{
		wait();
		if(EN.read() == ALU_AND) 
		{
			// Read inputs
			a = A.read();
			b = B.read();
			
			// Compute result
			r = a & b;
		    
			// Set result on output
			OUTS.write(r);
		}
	}
}

void OR::or_process()
{
    sc_uint<32> a, b, r;
OUTS.write(0);

    			
    #ifdef VERBOSE
        cerr << "OR" << endl;
    #endif
    while (true) 
	{
		wait();
		if(EN.read() == ALU_OR) 
		{
			// Read inputs
			a = A.read();
			b = B.read();
			
			// Compute result
			r = a | b;
		   
			// Set result on output
			OUTS.write(r);
		}
	}
}
