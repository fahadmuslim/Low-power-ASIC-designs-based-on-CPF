 
#include "shift.h"

void SHIFTRIGHT::shiftright()
{
    sc_uint<32> a,b,r;
   	OUTS.write(0); 
    #ifdef VERBOSE
        cerr << "SHIFTRIGHT" << endl;
    #endif
    while (true) 
	{
		wait();
		if(EN.read() == ALU_SHIFT_R) 
		{
			a = A.read();
			b = B.read();
			r = a >> b;
			OUTS.write(r);

			#ifdef VERBOSE
				cerr << "Shifter: " << a;
				cerr << " -> ";
				cerr << b << endl;
			#endif
		}
	}
}

void SHIFTLEFT::shiftleft()
{
    sc_uint<32> a,b,r;
       	OUTS.write(0);
    #ifdef VERBOSE
        cerr << "SHIFTRIGHT" << endl;
    #endif
    while (true) 
	{
		wait();
		if(EN.read() == ALU_SHIFT_L) 
		{
			a = A.read();
			b = B.read();
			r = a << b;
			OUTS.write(r);

			#ifdef VERBOSE
				cerr << "Shifter: " << a;
				cerr << " -> ";
				cerr << b << endl;
			#endif
		}
	}
}
