#include <iostream>
using namespace std;

int search(int a[], int v, int l, int r)
{
		while(r>=l)
		{
			int m=(l+r)/2;
			if(v == a[m])
				return m;
			if(v<a[m])
				r=m-1;
			else 
				l=m+1;
		}
		return -1;
}

int main()
{
	int N,T,J;
	cout << "Enter the number of elements of X ";
	cin >> N;
	cout << "Enter the elements of X" << endl; 
	int* X;
	X=new int[N];
	for(int K=0; K<N;K++)
		cin >> X[K];
	cout << "Enter the number to be searched ";
	cin >> T;

	J=search(X,T,0,N-1);
	if(J==-1)
		cout << "Number " << T << " does not appear in the list" << endl;
	else
		cout << "Number " << T << " was found at position " << J+1 << endl;
	
	return 0;
}

