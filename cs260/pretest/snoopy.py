#!/usr/bin/python

s="snoopy"
print "input is:" + s

x = len(s);
print "String length:" + str(x)

for j in range(x):
	substr = s[:j+1]
	print substr


