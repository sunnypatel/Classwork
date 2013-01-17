// Iterative Euclidean Algorithm
// Date: 11 Oct 2004
// Author: Anatole Ruslanov
#include <iostream>

using namespace std;

int gcd_iterative(int a, int b);

void main()
{
    int a, b;
	
	cout << "Please enter two positive integers:\n";
	cin >> a >> b;
	cout << "\nYou entered a = " << a << " b = " << b << endl;
	
	cout << "\nIterative GCD is " << gcd_iterative(a, b) << endl << endl;
}

// Iterative Euclidean Algorithm
// Greatest Common Divisor
// Input: Positive integers a and b, not both zero
// Output: d = gcd(a, b)
int gcd_iterative(int a, int b)
{
	int c;
	
	if ( b == 0 ) 
		return a;
	
	else
		while ( b != 0 )
		{
			c = b;
			b = a % b;
			a = c;
		}

		return a;
}

