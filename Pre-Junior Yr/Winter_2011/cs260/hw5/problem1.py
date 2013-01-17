#!/usr/bin/python

import sys
import math
import random
import timeit



# lowest number = highest priority
# @param list arry of random int objs
# @return a properly sorted heap
def make_heap(list_l):
    heap = []
    # add nodes to heap and adjust heap
    for i in range(len(list_l)-1,-1,-1):
        heap.append(list_l[i])
        heap = adjust(heap)

    return heap

# perculates to top of tree,
# checking heap property
def adjust(heap):
    # start with last added node
    last = len(heap)-1
    # parent of last node
    p_node = last/2

    # check heap property up the tree
    while (heap[last] < heap[p_node]):
        # child < p_node swap nodes
        heap = swap(last,p_node,heap)
        # continue up tree
        last = p_node
        p_node = last/2

    return heap

#swap two element's position
#@param int pos1
#@param int pos2
#@param list_obj list
#@return list_obj updated list
def swap(pos1,pos2,list_obj):
    temp = list_obj[pos1]
    list_obj[pos1] = list_obj[pos2]
    list_obj[pos2] = temp
    return list_obj

# *for testing only*
def print_h(heap):
    for i in range(0,len(heap)):
        print "["+str(i)+"]="+ str(heap[i])


print "+------------------------+"
print "| n  |        T(n)       |"
print "+------------------------+"
for x in range(20):
    # num of nodes in this tree
    n = random.randint(1,100)
    heap = []
    for i in range(n):
        heap.append(random.randint(1,n))

    mytime = timeit.Timer('make_heap('+str(heap)+')','from __main__ import make_heap')
    #heap = make_heap(heap)
    delta = mytime.timeit(1)
    
    print "| "+str(n).zfill(2)+" | "+str(delta).zfill(17)+" |"

print "+------------------------+"
