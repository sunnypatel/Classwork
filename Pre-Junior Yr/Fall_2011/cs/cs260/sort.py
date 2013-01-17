#!/usr/bin/python

import sys
from math import log


# @param list list to be printed
# prints out entire list
def print_list(list_1):
    for i in range(len(list_1)):
        print str(list_1[i]) + ' '

# @param n, number of buckets to make
# @return list of empty lists; # of lists = n
def makeBuckets(n):
    return [ [] for i in range(n) ]

# @param num number being parsed
# @param base base being sorted to
# @param digit
# extracts a particular digit from
# number
def getDigit(num, base, digit):
    return (num // base ** digit) % base

# merges lists together
def merge(list_1):
    new = []
    for sub in list_1:
        new.extend(sub)
    return new

def maximal(list_1):
    return max(abs(num) for num in list_1)


def split(list_1,base,num):
    buckets = makeBuckets(base)
    for n in list_1:
        buckets[getDigit(n,base,num)].append(n)
    return buckets

base = 256
    
new_list = []

line = sys.stdin.read
new_list = line.split()

print "Before sorting...printing list"
print_list(new_list)

for number in range(4):
    new_list = merge(split(new_list, base, number)) 

print "After sorting...printing list"
print_list(new_list)
