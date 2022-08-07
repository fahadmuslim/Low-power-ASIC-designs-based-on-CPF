#include "tb.h"

void tb::reset_process()
{
	reset.write(0);
    wait(100, SC_NS);
	reset.write(1);
    wait(100, SC_NS);
}
