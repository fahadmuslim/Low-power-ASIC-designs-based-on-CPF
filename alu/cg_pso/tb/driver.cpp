#define VERBOSE
#include "driver.h"
#include <iostream>
#include <cstdlib> // for rand() and srand()
#include <vector>

// Generate a random number between nLow and nHigh (inclusive) 
unsigned long long int GetRandomNumber(unsigned long long int nLow, unsigned long long int nHigh)
{
	return (rand() % (nHigh - nLow + 1)) + nLow;
}

void driver::prc_driver()
{
	CLK_GATE_MULT.write(1);
	CLK_GATE_DIV.write(1);
	sc_uint<32> outs;
	sc_uint<32> a,b,sel;
	std::vector<unsigned long long int> array_mult;
	std::vector<unsigned long long int> array_div;
	unsigned int array_a[COUNT];
	unsigned int array_b[COUNT];
	unsigned int array_sel[COUNT];
	unsigned int count = COUNT;
	unsigned int num1=0,num2=0,num3=0;
    	srand(532300000); // set initial seed value to 5323
//while(1){
	for (unsigned int i=0; i<count; i++)
    {
        wait();
		a = GetRandomNumber(0,10000);
		array_a[i] = a;

		b = GetRandomNumber(100,5000);
		array_b[i] = b;

		sel = GetRandomNumber(1,8);
		array_sel[i] = sel;
		
		switch (sel) 
		{
			case ALU_MULT:
						num1++;
						array_mult.push_back(i);
						break;
			case ALU_DIV:
						num2++;
						array_div.push_back(i);
						break;
		}
	} 
	/////////////////// Check for MULTIPLY and DIVIDE operations /////////////////
	#ifdef VERBOSE
	std::cout<<endl<<"Occurance of digit "<<ALU_MULT<<" = "<<num1<<endl;
	std::cout<<endl<<"Occurance of digit "<<ALU_DIV<<" = "<<num2<<endl;
	#endif
	unsigned int tmp_mult1 = array_mult.size();
	unsigned int tmp_div1 = array_div.size();
	#ifdef VERBOSE
	std::cout<<"Size of array_mult = "<<tmp_mult1<<endl;
	std::cout<<"Size of array_div = "<<tmp_div1<<endl;
	#endif
	unsigned int tmp_mult2 = (10*count)/100;
	unsigned int tmp_div2 = (1*count)/100;
	#ifdef VERBOSE
	cout<<"Required range of MULTIPLY op = "<<tmp_mult2<<endl;
	cout<<"Required range of DIVIDE op = "<<tmp_div2<<endl;
	#endif
	int diff_mult = tmp_mult2 - tmp_mult1;
	int diff_div = tmp_div2 - tmp_div1;
	#ifdef VERBOSE
	std::cout<< "MULTIPLY: Required Range - Present Range = "<<diff_mult<<endl;
	std::cout<< "DIVIDE: Required Range - Present Range = "<<diff_div<<endl;
	#endif
	////////////////  Masking MULTIPLY enable if it occurs more or less than the desired percentage  ////////////////
	if (diff_mult<0)
	{
		diff_mult=(-diff_mult);
		for(unsigned int i=0; i<diff_mult; i++)
		{
			unsigned int tmp_i = array_mult[i]; 
			array_sel[tmp_i] = GetRandomNumber(ALU_AND,ALU_SHIFT_R);
		}
		//Check for final count of Multiply operation
		#ifdef VERBOSE
		num3 = 0;
		for (unsigned int i=0; i < count; i++)
		{
			if(array_sel[i] == ALU_MULT) 
				num3++;		
		}
		std::cout<<"total MULTIPLY operation: "<<num3<<endl;
		#endif
	}
	else if (diff_mult>0)
	{
		for(unsigned int i=0; i<diff_mult; i++)
		{
			unsigned int tmp_i = GetRandomNumber(0,count); 
			array_sel[tmp_i] = ALU_MULT;
		}
		//Check for final count of Multiply operation
		#ifdef VERBOSE
		num3=0;
		for (unsigned int i=0; i < count; i++)
		{
			if(array_sel[i] == ALU_MULT) 
				num3++;		
		}
		std::cout<<"total MULTIPLY operation: "<<num3<<endl;
		#endif
	}
	/////////////////////// End of MULTIPLY operation masking /////////////////////////
	
	////////////////  Masking DIVIDE enable if it occurs more or less than the desired percentage  ////////////////
	if (diff_div<0)
	{
		diff_div=(-diff_div);
		for(unsigned int i=0; i<diff_div; i++)
		{
			unsigned int tmp_i = array_div[i]; 
			array_sel[tmp_i] = GetRandomNumber(ALU_AND,ALU_SHIFT_R);
		}
		//Check for final count of DIVIDE operation
		#ifdef VERBOSE
		num3 = 0;
		for (unsigned int i=0; i < count; i++)
		{
			if(array_sel[i] == ALU_DIV) 
				num3++;		
		}
		std::cout<<"total DIVIDE operation: "<<num3<<endl;
		#endif
	}
	else if (diff_div>0)
	{
		for(unsigned int i=0; i<diff_div; i++)
		{
			unsigned int tmp_i = GetRandomNumber(0,count); 
			array_sel[tmp_i] = ALU_DIV;
		}
		//Check for final count of Multiply operation
		#ifdef VERBOSE
		num3=0;
		for (unsigned int i=0; i < count; i++)
		{
			if(array_sel[i] == ALU_DIV) 
				num3++;		
		}
		std::cout<<"total DIVIDE operation: "<<num3<<endl;
		#endif
	}
	/////////////////////// End of DIVIDE operation masking /////////////////////////
	for (unsigned int i=0; i<count; i++)
    {
		A.write(array_a[i]);
		B.write(array_b[i]);
		SEL.write(array_sel[i]);
		if (array_sel[i]==ALU_MULT)
		{
			PWR_MULT.write(0);
			CLK_GATE_MULT.write(1);
		}
		else
		{
			PWR_MULT.write(1);
			CLK_GATE_MULT.write(0);
		}
		if (array_sel[i]==ALU_DIV)
		{
			PWR_DIV.write(0);
			CLK_GATE_DIV.write(1);
		}
		else
		{
			PWR_DIV.write(1);
			CLK_GATE_DIV.write(0);
		}		
		wait(300, SC_NS);
		
		outs=OUTS.read();
		#ifdef VERBOSE
		switch (array_sel[i]) {
			case ALU_AND:
						std::cout<<"Selected function = AND"<<endl;
						break;
        
			case ALU_OR:
						std::cout<<"Selected function = OR"<<endl;
						break;
        
			case ALU_ADD:
						std::cout<<"Selected function = ADD"<<endl;
						break;
        
			case ALU_SUB:
						std::cout<<"Selected function = SUB"<<endl;
						break;

			case ALU_SHIFT_L:
						std::cout<<"Selected function = SHIFT-LEFT"<<endl;
						break;
        
			case ALU_SHIFT_R:
						std::cout<<"Selected function = SHIFT-RIGHT"<<endl;
						break;

			case ALU_MULT:
						std::cout<<"Selected function = MULTIPLY"<<endl;
						break;
        
			case ALU_DIV:
						std::cout<<"Selected function = DIVIDE"<<endl;
						break;
		}
		std::cout<<"Result"<<i<<": A= "<<array_a[i]<<", B = "<<array_b[i]<<" and output = "<<outs<<endl;
		#endif	
	}
	std::cout<<"completed"<<endl;
//}
	sc_stop();
}
