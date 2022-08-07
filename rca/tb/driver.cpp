#include "driver.h"
#include <iostream>
#include <cstdlib> // for rand() and srand()

// Generate a random number between nLow and nHigh (inclusive) 
unsigned long long int GetRandomNumber(unsigned long long int nLow, unsigned long long int nHigh)
{
	return (rand() % (nHigh - nLow + 1)) + nLow;
}

void driver::prc_driver()
{
	sc_uint<32> s;
	sc_uint<32> a;
	sc_uint<32> b;
	bool c;
	sc_uint<32> num1,num2;
    srand(532300000); // set initial seed value to 5323
//	while(1){
	for (unsigned int i=0; i<1000; ++i)
    {
		bool flag = w_flag.read();
		//std::cout<<"FLAG = "<<flag<<endl;
	//	while (flag == 1)
	//		wait();
       // wait();
		num1 = GetRandomNumber(255370,4294967296);
		a = num1;
		//std::cout<<"a = "<<a<<endl;

		num2 = GetRandomNumber(0,4294967296);
		b = num2;
		//std::cout<<"b = "<<b<<endl;
		if (i%10 == 0)
		{
			a = a;
			b = b;
			pwr_sig = 0;
			clk_gate = 1;
		}
		else
		{
			a = 65535 & a;
			b = 65535 & b;
			pwr_sig = 1;
			clk_gate = 0;
			//std::cout<<"modified a = "<<a<<"and b = "<<b<<" and i = "<<i<<endl;
		}
		//wait();
		
		//pwr_sig.write(1);
		cin.write(0);
		a0.write(a[0]);
		a1.write(a[1]);
		a2.write(a[2]);
		a3.write(a[3]);
		a4.write(a[4]);
		a5.write(a[5]);
		a6.write(a[6]);
		a7.write(a[7]);
		a8.write(a[8]);
		a9.write(a[9]);
		a10.write(a[10]);
		a11.write(a[11]);
		a12.write(a[12]);
		a13.write(a[13]);
		a14.write(a[14]);
		a15.write(a[15]);
		a16.write(a[16]);
		a17.write(a[17]);
		a18.write(a[18]);
		a19.write(a[19]);
		a20.write(a[20]);
		a21.write(a[21]);
		a22.write(a[22]);
		a23.write(a[23]);
		a24.write(a[24]);
		a25.write(a[25]);
		a26.write(a[26]);
		a27.write(a[27]);
		a28.write(a[28]);
		a29.write(a[29]);
		a30.write(a[30]);
		a31.write(a[31]);
		b0.write(b[0]);
		b1.write(b[1]);
		b2.write(b[2]);
		b3.write(b[3]);
		b4.write(b[4]);
		b5.write(b[5]);
		b6.write(b[6]);
		b7.write(b[7]);
		b8.write(b[8]);
		b9.write(b[9]);
		b10.write(b[10]);
		b11.write(b[11]);
		b12.write(b[12]);
		b13.write(b[13]);
		b14.write(b[14]);
		b15.write(b[15]);
		b16.write(b[16]);
		b17.write(b[17]);
		b18.write(b[18]);
		b19.write(b[19]);
		b20.write(b[20]);
		b21.write(b[21]);
		b22.write(b[22]);
		b23.write(b[23]);
		b24.write(b[24]);
		b25.write(b[25]);
		b26.write(b[26]);
		b27.write(b[27]);
		b28.write(b[28]);
		b29.write(b[29]);
		b30.write(b[30]);
		b31.write(b[31]);

		wait(300, SC_NS);
		
		s[0]=s0.read();
		s[1]=s1.read();
		s[2]=s2.read();
		s[3]=s3.read();
		s[4]=s4.read();
		s[5]=s5.read();
		s[6]=s6.read();
		s[7]=s7.read();
		s[8]=s8.read();
		s[9]=s9.read();
		s[10]=s10.read();
		s[11]=s11.read();
		s[12]=s12.read();
		s[13]=s13.read();
		s[14]=s14.read();
		s[15]=s15.read();
		s[16]=s16.read();
		s[17]=s17.read();
		s[18]=s18.read();
		s[19]=s19.read();
		s[20]=s20.read();
		s[21]=s21.read();
		s[22]=s22.read();
		s[23]=s23.read();
		s[24]=s24.read();
		s[25]=s25.read();
		s[26]=s26.read();
		s[27]=s27.read();
		s[28]=s28.read();
		s[29]=s29.read();
		s[30]=s30.read();
		s[31]=s31.read();
		c=cout.read();
		std::cout<<"Result"<<i<<": a = "<<a<<", b = "<<b<<", sum = "<<s<<endl<<"carry = "<<c<<endl;
		
	}

	/*	a   = "0b00000000000000000000000000000001";
		b   = "0b00000000000000000001000000000000";
	*/
	std::cout<<"completed"<<endl;
	//sc_stop();
//}
sc_stop();
}
