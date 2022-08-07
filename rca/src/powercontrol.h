#include<systemc.h>

SC_MODULE(powercontrol) 
{
    sc_in<bool>  clk;
    sc_in<bool>	 reset;
    sc_in<bool>	 pwr_sig;
	sc_out<bool> w_flag;
    sc_out<bool> pse,pse1;
    sc_out<bool> iso,iso1;
    sc_out<bool> ret,ret1;
    //sc_out<bool> clk_gate;
    
	SC_CTOR(powercontrol):
        clk     ("clk"),
		reset   ("reset"),
		w_flag	("w_flag"),
		pwr_sig ("pwr_sig"),
		pse		("pse"),
        iso     ("iso"),
        ret     ("ret")
		//clk_gate	("clk_gate")
    {
		SC_CTHREAD(process, clk.pos());
        reset_signal_is(reset, false);
    }

	void process()
	{
		w_flag = 0;
		iso = 0;
		ret = 0;
		pse = 1;
		iso1 = 0;
		ret1 = 0;
		pse1 = 1;
		//clk_gate = 0;
		wait();
		while (1)
		{
			//w_flag = 1;
			//wait();
			if (pwr_sig == 1)
			{
				iso = 1;
				wait();
				ret = 1;
				wait();
				pse = 0;
				//clk_gate_sig = 0;
			}
			else
			{
				//clk_gate_sig = 1;
				pse = 1;
				wait();
				ret = 0;
				wait();
				iso = 0;
			}
			//w_flag = 0;
			//wait();
		}
	}
};
