#include<systemc.h>
SC_MODULE (full_adder) 
{
    sc_in<bool>	clk, reset;
	sc_in<bool> a;
    sc_in<bool> b;
    sc_in<bool> cin;
	sc_out<bool> s;
	sc_out<bool> cout;

    //Constructor
    SC_CTOR(full_adder) 
	{
		SC_CTHREAD (adder, clk.pos());
		reset_signal_is(reset,false);
    }

	// methods
    void adder()
	{
	while (1) 
	{
		wait(); // wait for any signal on sensitivity list
		//wait(5, SC_NS); // delay to produce outputs.
		cout = (a & b) | (a & cin) | (b & cin);
		s = a ^ b ^ cin;
	}
	}
};
