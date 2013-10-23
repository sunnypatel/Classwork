/*
 * File : insertion_sort.cpp
 * Author: MyCodingLab
 * Code : Insertion Sort Algorithm
 */
 
#include <iostream>
#include <stdlib.h>
using namespace std;
 
void print_array(int array[], int size)
{
 cout<< "insertion sort steps: ";
 int j;
 for (j=0; j<size;j++)
 cout <<" "<< array[j];
 cout << endl;
}//end of print_array
 
void insertion_sort(int arr[], int length)
{
 int i, j ,tmp;
 for (i = 1; i < length; i++)  {  j = i;  while (j > 0 && arr[j - 1] > arr[j])
 {
 tmp = arr[j];
 arr[j] = arr[j - 1];
 arr[j - 1] = tmp;
 j--;
 }//end of while loop
 print_array(arr,5);
 }//end of for loop
}//end of insertion_sort.
 
int main() {
 
int array[5]= {4,5,1,2,1};
 insertion_sort(array,5);
 return 0;
}//end of main
