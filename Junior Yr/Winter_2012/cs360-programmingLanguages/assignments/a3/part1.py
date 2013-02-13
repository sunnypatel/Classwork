input_dir = "inputs/"
f = open(input_dir + "sample1.input",'r')

numOfStates = f.readline()
print "Number of states = " + numOfStates

f_dot = open("out.dot","w");
# write defaults
f_dot.write("digraph fsm {\nrankdir=\"LR\"\nstart [shape=\"plaintext\" ,label=\"start\"]\n")

# write the states dot code
for i in range(int(numOfStates)-1):
	f_dot.write(str(i) + " [shape=\"circle\",label=\"S" + str(i) + "\"]\n")
lastState = str(int(numOfStates)-1)
# write the last end state which uses 'doublecircle'
f_dot.write(lastState + " [shape=\"doublecircle\",label=\"S" + lastState + "\"]\n")


# *** BEGIN WRITTING TRANSITIONS ***
# move f line pointer nxt line, ignoring 2nd line
numOfTransitions = f.readline()

# write which is the start state
f_dot.write("start->1\n")


inputs = []
for i in range(int(numOfTransitions)):
	inputs.append(f.readline())
print "Number of elements as inputs[]=" + str(len(inputs))

# split each element of input by token ','
for state in inputs:
	state_data = state.split(',')
	
f.close()
