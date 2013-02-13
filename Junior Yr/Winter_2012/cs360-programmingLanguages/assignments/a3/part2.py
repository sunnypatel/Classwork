import sys


def find(list_a,needle):
    try:
        i = list_a.index(needle)
    except ValueError:
        return 0
    return 1


input_file = str(sys.argv[1])

f = open(input_file ,'r')

numOfStates = f.readline()


numOfTransitions = f.readline()

fsm = []
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

	# create fsm edge data structure 2-d array where each ele has  ( [label] [start] [end] )			
	for endState in endStates:
		endState = endState.rstrip()
		edge = [startEdge_label,startEdge_state,endState]
		fsm.append(edge)	

for line in f:
	line = line.rstrip()
	
	startState = "0"
	currentStates = []
	currentStates.append(startState)
	acceptState = fsm[(len(fsm)-1)][2]
		
	for i in range(len(line)):
		char = line[i]
		newStates = []
		for edge in fsm:

			if (edge[0] == char or edge[0] == "EPSILON") and (find(currentStates,edge[1])):
				if not find(newStates,edge[2]):
					newStates.append(edge[2])
		currentStates = newStates
	# check if ending states contain end statu
	if find(currentStates,acceptState):
		print line + " is accepted!"
	else:
		print line + " is not accepted!"

f.close()

