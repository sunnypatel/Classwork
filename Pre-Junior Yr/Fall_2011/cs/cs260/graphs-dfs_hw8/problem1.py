#!/usr/bin/python

import fileinput
import sys


# Computes the shortest path of 
# the given adja. matrix
# @param A and adj. array of arrays
def floyd(A):
    B = []
    
    for row in A:
        B.append(row)
    for i in range(1,len(B)):
        for j in range(1, len(B)):
            for k in range (1, len(B)):
                if (B[i][k] > B[i][j] + B[j][k]):
                    B[i][k] = B[i][j] + B[j][k]
    return B

# parsing input file, and creates a adj. matrix
# @param line another data line from input
# @param N adj. matrix currently in use
def parser(N):

    num_vert = 0
    
    for line in fileinput.input():
        if len(line) > 0:
            num_vert = num_vert + 1
    
    # creates a square matrix of num_nodes x num_nodes
    for i in range(num_vert):
        temp = []
        for j in range(num_vert):
            temp.append(float('INF'))
        N.append(temp)

    line_count =0
    for line in fileinput.input():
        
        if (len(line)>0):
            edges =  line.split(' ')
            if (len(edges) > 1):
                temp = []
                for i in range(1,len(edges)):
                    temp = edges[i].split(',')
                    if(len(temp) > 1):
                        #print "Line count: " + str(line_count)
                        #print "temp[1]:    " + str(temp[1])
                        #print "temp[0]:    " + str(temp[0])
                        #print "N[line_count] = " + str(N[line_count])
                        N[line_count][int(temp[0])] = int(temp[1])
                        #print "Done. " + str(line_count)
            line_count = line_count + 1

def print_matrix(A):
    for i in range(len(A)):
        for j in range(len(A[i])):
            sys.stdout.write( '%4s' % A[i][j] )
        print ''


N = []


N_init = N
parser(N)
# print out wht the init matrix looks like
print "-- Init. matrix -- "
print_matrix(N)

N_done = floyd(N)

# print out matrix after floyd
print ""
print "-- Distance Matrix -- "
print_matrix(N)
