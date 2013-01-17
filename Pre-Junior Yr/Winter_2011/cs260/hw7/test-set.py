#!/usr/bin/python

import set

"""
 Importing set.py should provide the following functions:

    set.Initialize(Values)       -- return a new set system with one element
                                    per set.

                                    Values is a list of values for the
                                    sets

    set.Find(set, value)         -- Return the name of the set in which value lives.
                                    Do path compression.

                                    Exactly what you return isn't
                                    important, as long as Find(set,
                                    val1) and Find(set, val2) are
                                    equal if and only if val1 and val2
                                    are in the same set.

    set.Merge(set, value1, value2)  -- Merge operation.  Make sure you parent
                                       the smaller set to the larger.

"""

import random
import time


random.seed(time.time())
A = []                                  

# First make a list of stuff for the set system
for i in range(1000):
    val = random.randrange(-1000,1000)
    if(val not in A):
        A.append(val)
MyA = A

my_set = set.Initialize(A)

# Now randomly do finds and unions until everything is in the same set.
print "Doing lots of finds and unions..."
while(A.count(A[0]) != len(A)):
    length = len(A)
    index_1 = random.randrange(0, length)
    val_1 = A[index_1]
    index_2 = random.randrange(0, length)
    val_2 = A[index_2]
    if(random.randrange(1,6) < 3):
        # With probability 2/5, do a find
        set_says = (set.Find(my_set, val_1) == set.Find(my_set, val_2))
        A_says = (MyA[index_1] == MyA[index_2])
        if(set_says != A_says):
            print "Oops: I said Find(", val_1, ") == Find(", val_2, ") and got ", set_says
    else:
        # Otherwise (with probability 3/5), do a union
        for i in range(len(MyA)):
            if(MyA[i] == val_1):
                MyA[i] = val_2
        set.Merge(my_set, val_1, val_2)

# Now verify that everything is in the same set.  Start with set.py.
print "Checking that everything is in one set now..."
val = set.Find(my_set, A[0])
for i in range(len(A)):
    val2 = set.Find(my_set, A[i])
    if(val != val2):
        print "Oops, ", val, " and ", val2, " should be in the same set, but aren't."

print "Verifying the test harness..."
val = MyA[0]
for i in range(len(MyA)):
    if(MyA[i] != val):
        print "Uh, oh, it looks like the test harness itself has a bug."

