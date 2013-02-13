import os
import sys
from subprocess import call

input_file = str(sys.argv[1])

f = open(input_file ,'r')

numOfStates = f.readline()
# create a .dot file
file_name = input_file.split(".")[0]
dot_file = file_name + ".dot"

f_dot = open(dot_file,"w");
# write defaults
f_dot.write("digraph fsm {\nrankdir=\"LR\"\nstart [shape=\"plaintext\" ,label=\"start\"]\n")

# write the states dot code
for i in range(int(numOfStates)-1):
	f_dot.write(str(i) + " [shape=\"circle\",label=\"S" + str(i) + "\"]\n")
lastState = str(int(numOfStates)-1)
# write the last end state which uses 'doublecircle'
f_dot.write(lastState + " [shape=\"doublecircle\",label=\"S" + lastState + "\"]\n")


# *** BEGIN WRITTING TRANSITIONS ***
# get the number of edges
numOfTransitions = f.readline()

# write which is the start state
f_dot.write("start->0\n")


inputs = []
for i in range(int(numOfTransitions)):
	inputs.append(f.readline())

# split each element of input by token ','
for state in inputs:
	# separate the state data 
	state_sep = state.split('(')
	# remove empty string created by first (
	state_sep.remove("")
	
	# get start state of this edge as well as label for this edge
	startEdge_data = state_sep.pop(0).split(",")
	startEdge_state = startEdge_data.pop(0)
	startEdge_label = startEdge_data.pop(0)
	
	# get the end starts this edge will be connecting to, 
	# remove extra crap, and split by ,
	endStates = state_sep.pop(0).replace(')','').split(',')
	# write the dot code
	for endState in endStates:
		f_dot.write(startEdge_state + "->" + endState.rstrip() + " [label=\"" + startEdge_label + "\"]\n")	
			

f_dot.write("}")	

args = "-Tpng "+ dot_file + " > " + file_name + ".png"
cmd =  "dot " + args
os.system(cmd)

f_dot.close()
f.close()
