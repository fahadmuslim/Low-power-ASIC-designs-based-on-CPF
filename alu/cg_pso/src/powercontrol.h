#include<systemc.h>

SC_MODULE(powercontrol) 
{
    sc_in<bool>  clk;
    sc_in<bool>	 reset;
    sc_in<bool>	 pwr_mult,pwr_div;
    sc_out<bool> pse_mult,pse_div;
    sc_out<bool> iso_mult,iso_div;
    sc_out<bool> ret_mult,ret_div;
    //sc_out<bool> clk_gate;
    
	SC_CTOR(powercontrol):
        clk			("clk"),
		reset		("reset"),
		pwr_mult	("pwr_mult"),
		pse_mult	("pse_mult"),
        iso_mult    ("iso_mult"),
        ret_mult    ("ret_mult"),
		pwr_div		("pwr_div"),
		pse_div		("pse_div"),
        iso_div     ("iso_div"),
        ret_div     ("ret_div")
	//clk_gate	("clk_gate")
		//clk_gate_div	("clk_gate_div")
    {
		SC_CTHREAD(process, clk.pos());
        reset_signal_is(reset, false);
    }

	void process()
	{
		iso_mult = 0;
		ret_mult = 0;
		pse_mult = 1;
		iso_div = 0;
		ret_div = 0;
		pse_div = 1;
		//clk_gate = 0;
		wait();
		while (1)
		{
			if (pwr_mult == 1)
			{
				iso_mult = 1;
				wait();
				ret_mult = 1;
				wait();
				pse_mult = 0;
				//clk_gate_mult = 0;
			}
			else
			{
				//clk_gate_mult = 1;
				pse_mult = 1;
				wait();
				ret_mult = 0;
				wait();
				iso_mult = 0;
			}
			if (pwr_div == 1)
			{
				iso_div = 1;
				wait();
				ret_div = 1;
				wait();
				pse_div = 0;
				//clk_gate_div = 0;
			}
			else
			{
				//clk_gate_div = 1;
				pse_div = 1;
				wait();
				ret_div = 0;
				wait();
				iso_div = 0;
			}
		}
	}
};
