#include "mult.h"

void MULTIPLY::multiply()
{
    sc_uint<32> a,b,r;
    
    #ifdef VERBOSE
        cerr << "Multiply" << endl;
    #endif
    while (true) 
	{
		wait();
		if(EN.read() == ALU_MULT) 
		{
			a = A.read();
			b = B.read();
			r = a * b;
			OUTS.write(r);
		}
	}
}

void DIVIDE::divide()
{
    int a,b;
	sc_uint<32> r,tmp;
	
    
    #ifdef VERBOSE
        cerr << "Divide" << endl;
    #endif
    while (true) 
	{
		wait();
		if(EN.read() == ALU_DIV) 
		{
			a = A.read();
			b = B.read();
			int quo = 0;
			int sign = (a*b < 0)? -1 : 1;
			while( (a-=b) >= 0 )
				quo++;
			r = sign*quo;
			OUTS.write(r);
		}
	}
}
