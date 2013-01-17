#!/usr/bin/python
# Cell struct concat functions

import sys
import cell

# Joins two Cell objects
# @param A first cell in list
# @param B cell to be added on to cell1
def list_concat ( A, B):
    A.setNext(B)


x = cell.Cell(30)
y = cell.Cell(20)

list_concat( x,y)

x.getNext().echo();
