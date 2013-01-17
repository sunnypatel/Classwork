#!/usr/bin/python

import sys

# define a node object
class node:
    def __init__(self,data):
        self.parent = self
        self.rank = 0
        self.data = data

def Initialize(A):
    set = []
  
    for i in range(1,len(A)):
        x = node(A[i])
        
    set.append(x)
    return set

def Find(set, x):
    for s in range(len(set)):
        if x != set[s].parent:
            set[s].parent = Find(set[s:],set[s].parent)
    return set[s]
def Find2(sets,v):
    if(v.parent == null):
        return v
    else:
        return Find2(sets,v.parent)

def Merge(set,x,y):
    # find roots of x and y
    xRoot = Find(set, x)
    yRoot = Find(set, y)

    # if x&y not in the same set then do merge operation
    if xRoot.rank < yRoot.rank:
        xRoot.parent = yRoot
    elif xRoot.rank > yRoot.rank:
        yRoot.parent = xRoot
    else:
        yRoot.parent = xRoot
        xRoot.rank = xRoot.rank + 1



