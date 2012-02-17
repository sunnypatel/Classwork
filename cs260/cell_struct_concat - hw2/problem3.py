#!/usr/bin/python
# Timing functions for cell concat

import sys
import cell
import random
import timeit


# Joins two Cell objects
# @param A first cell in list
# @param B cell to be added on to cell1
def list_concat ( A, B):
    A.setNext(B)


# Concats two Cell Objects
# makes a copy cell object
def list_concat_copy( A, B ):
    temp_data = A.__str__() + B.__str__()
    
    #create a new cell with concat'd data
    c = cell.Cell ( temp_data )
    return c


def test_prob1(length):
    start = cell.Cell(20)
    next_c = start
    # creates a cell list of size length
    for i in ( range(1,length)):
        new_c = cell.Cell(random.randint(1,length))
        # add new_cell to list
        list_concat(next_c,new_c)
        # move to next cell
        next_c = new_c

def test_prob2(length):
    x=cell.Cell(random.randint(1,length))
    for i in ( range(1,length)):
       
        y=cell.Cell(random.randint(1,length))
        x = list_concat_copy(x,y)


for x in (range(1000,16000,1000)):
    mytime = timeit.Timer('test_prob1('+str(x)+')','from __main__ import test_prob1' )
    delta = mytime.timeit(1)
    mytime2 = timeit.Timer('test_prob2('+str(x)+')','from __main__ import test_prob2')
    delta2 = mytime2.timeit(1)

    print str(x)+" "+str(delta)+" "+str(delta2)
