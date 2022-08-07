
 
#include "add-sub.h"

void ADD::add()
{
    sc_uint<32> a, b, r;
	OUTS.write(0);

    #ifdef VERBOSE
        cerr << "ADD" << endl;
    #endif
    while (true) 
	{
		wait();
		if(EN.read() == ALU_ADD) 
		{
			// Read inputs
			a = A.read();
			b = B.read();
			
			// Compute result
			r = a + b;
		    
			// Set result on output
			OUTS.write(r);
		}
	}
}

void SUBTRACT::subtract()
{
    sc_uint<32> a, b, r;
OUTS.write(0);			
    #ifdef VERBOSE
        cerr << "SUBTRACT" << endl;
    #endif
    while (true) 
	{
		wait();
		if(EN.read() == ALU_SUB) 
		{
			// Read inputs
			a = A.read();
			b = B.read();
			
			// Compute result
			r = a - b;
		    
			// Set result on output
			OUTS.write(r);
		}
	}
}
