#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

//Definition of types IntVector and IntVectorIt
typedef vector<int> IntVector;
typedef IntVector::iterator IntVectorIt;

bool is_sorted(IntVector&a,int s,int r)
{
	for(int i=s;i<r;i++)
		if(a[i]>a[i+1])
			return false;

	return true;
}

void stl_merge(IntVector& a,IntVector& b,int s,int m,int r)
{
	//Function stl_merge merges segments a[s..m] and a[m+1..r],
	//stores the result in b[s..r] and then copies the result 
	//back to a[s..r]
	IntVectorIt ita=a.begin();
	IntVectorIt itb=b.begin();
	merge(ita+s,ita+m+1,ita+m+1,ita+r+1,itb+s);
	for(int i=s;i<=r;i++)
		a[i]=b[i];

}

void mergesort(IntVector& a,IntVector& b,int s,int r)
{
	//Function mergesort is a recursive version of Merge-Sort
	//algorithm. We need vector b to store the results of merging
	//Both vectors a and b are passed by reference. The algorithm 
	//needs memory which is twice the size of the array to be sorted
	if(r<=s) return;
	int m=(r+s)/2;
	mergesort(a,b,s,m);
	mergesort(a,b,m+1,r);
	stl_merge(a,b,s,m,r);
}

int main()
{
	int i,n;
	cout << "Enter the size of the array to be sorted: ";
	cin >> n;

	//Allocate memory for two vectors of size a
	IntVector a(n);
	IntVector b(n);
	
	//Insert random integers into vector a
	for(i=0;i<n;i++)
		a[i]=rand()%n;
	
	//Call function mergesort
	mergesort(a,b,0,n-1);

	//Verify if the output is sorted
	if(is_sorted(a,0,n-1))
		cout << "The output array is sorted" << endl;
	else
		cout << "The output is not sorted" << endl;

	return 0;
}
