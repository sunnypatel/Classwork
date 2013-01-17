#!/usr/bin/python

import sys
import string

# A simple fibonacci function
# 
# @param x int number of fib squence to be calculated. x must be > 0.
# @return f final result after calc. -1 if invalid is entered
def simple_fib(x):
    c=1
    n=1
    if(x<=0):
        # invalid input, return -1
        f=-1
        return f
    elif(x<=2):
        # input is 1 or 2, ans = 1
        f=1
        return f
    else:
        for i in (range(x-2) ):
            f = c + n
            c = n
            n = f

    return f

n = input("Please enter a n value to calculate Fibonacci seqence: ")
print "Calculating Fib. sequence for n= " + str(n)
f = simple_fib(int(n))

if(f==-1):
    print "Hmm, seems like you entered a invalid input.\n"
    print "Please enter a value greater than 0. You entered: " + str(n)+" ..."
else:
    print "Fib. number is "+str(f)
