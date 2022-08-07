/*****************************************************************************
 
  main.cpp -- This is the top level file instantiating the modules and
              binding ports to signals.
 
 *****************************************************************************/

#include <systemc.h>
#include "tb.h"


int sc_main(int ac, char *av[])
{
	sc_report_handler::set_actions("/IEEE_Std_1666/deprecated", SC_DO_NOTHING);
	tb  tb("testbench");

    //sc_start(50000, SC_NS);
     sc_start();
	std::cout<<"completed for 5000NS"<<endl;
    return 0;
	
}

