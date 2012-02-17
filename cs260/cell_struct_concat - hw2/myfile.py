#!/usr/bin/python
# myfile - an example, for importing
# 
# 1/07
#

def foo( n ) :
	for i in range( 1, n ) :
		print i

def bar( number ):
	""" just testing the timer function """
	for i in ( range( 1, number )):
		i*2

def list_concat( x, y ) :
	print "list_concat:  Got these 2 lists: " + str(x) + '; ' + str(y)

