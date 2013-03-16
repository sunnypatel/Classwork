import io, sys, traceback, string

# initialize globals
CURR_POS = int(0)
TOTAL_STATES = int(0)
EXP = ""

# NDFA class;	provides methods for handling
# 	 	ndfas, copying, reading expression from stdin
class NDFA:
	name = None
	number = None
	states = None

	def __init__(self):
		self.name = ""
		self.number = 0
		self.states = []

	def read(self):
		global EXP
		global CURR_POS
		self.importInfo(union())
		self.states.sort()
		self.number = len(self.states)
	
	def importInfo(self, ndfa):
		self.name = ndfa.name
		self.number = ndfa.number
		self.states = ndfa.states

	def exportToGraph(self):
		fileName = self.name + ".dot"
		file = open(fileName,'w')
		# insert the standard .dot file works
		file.write("digraph " + self.name + " {" + "\n")
		file.write("rankdir=\"LR\"" + "\n")
		file.write("start [shape=\"plaintext\",label=\"start\"]" + "\n")

		for i in range(self.number-1):
			file.write(str(i) + " [shape=\"circle\",label=\"S" + str(i) + "\"]" + "\n")

		file.write(str(self.number-1) + " [shape=\"doublecircle\",label=\"S" + str(self.number-1) + "\"]" + "\n")
		file.write("start->0" + "\n")

		for i in range(self.number):
			for j in self.states[i].nxt.keys():
				for k in self.states[i].nxt[j]:
					file.write( str(self.states[i].present) + "->" + str(k.present) + " [label=\"" + str(j) + "\"]" + "\n")

		file.write("}" + "\n")
		file.close()

		print fileName, "written."

	
	def printNDFA(self):
		for i in range(len(self.states)):
			print self.states[i].present, self.states[i].nxt.keys()


# <union> -> <concat> { | <concat> }
def union():
	
	final = concat()
	ndfa = NDFA()
	ndfa.importInfo(final)	
	while (token() is "|"):
		match("|")
		nxt = concat()

		global TOTAL_STATES

		start = State()
		start.present = TOTAL_STATES
		TOTAL_STATES += 1

		end = State()
		end.present = TOTAL_STATES
		TOTAL_STATES += 1

		start.nxt["EPSILON"] = [final.states[0],nxt.states[0]]

		# Avoid over-writing any existing transitions
		numF = len( final.states ) - 1
		if final.states[ numF ].nxt.has_key("EPSILON"):
			final.states[ numF ].nxt["EPSILON"].extend([end])
		else:
			final.states[ numF ].nxt["EPSILON"] = [end]

		numE = len( nxt.states ) - 1
		if nxt.states[ numE ].nxt.has_key("EPSILON"):
			nxt.states[ numE ].nxt["EPSILON"].extend([end])
		else:
			nxt.states[ numE ].nxt["EPSILON"] = [end]

		# creating the NDFA to be returned or further use
		ndfa = NDFA()
		ndfa.states.append(start)
		ndfa.states.extend(final.states)
		ndfa.states.extend(nxt.states)
		ndfa.states.append(end)

		# adjusting the start
		if final.states[0].present is int(0):
			final.states[0].present, start.present = swap(final.states[0].present, start.present)
	
		# left associativity	
		final.importInfo(ndfa)		
		
	return ndfa

# <concat> -> <closure> {  <closure> }
def concat():

	final = closure()
	while (token() in str(string.ascii_lowercase + "(")):
		nxt = NDFA()
		nxt = closure()

		num = len(final.states) - 1
		final.states.extend(nxt.states)

		# avoid over-writing
		if final.states[num].nxt.has_key("EPSILON"):
			final.states[num].nxt["EPSILON"].extend( [nxt.states[0]] )
		else:
			final.states[num].nxt["EPSILON"] = [nxt.states[0]]

	return final

# <closure> -> <paren> * | <paren>
def closure():
	final = paren()
	while (token() is "*"):
		match("*")

		num = len(final.states) - 1
		start = final.states[0]
		end = final.states[num]

		if start.nxt.has_key("EPSILON"):
			start.nxt["EPSILON"].extend([end])
		else:
			start.nxt["EPSILON"] = [end]

		if end.nxt.has_key("EPSILON"):
			end.nxt["EPSILON"].extend([start])
		else:
			end.nxt["EPSILON"] = [start]

	return final

# paren -> '(' <union> ')' | <transition>
def paren():
	final = NDFA()
	if token() is "(":
		match("(")
		final = union()
		match(")")
	else:
		final = transition()
	return final 

# create a "transition" between two states
def transition():
	ndfa = NDFA()
	if token() in str(string.ascii_lowercase):
		
		start_state = State()
		end_state = State()
		global TOTAL_STATES

		start_state.present = TOTAL_STATES
		TOTAL_STATES += 1
		end_state.present = TOTAL_STATES
		TOTAL_STATES += 1
		
		start_state.nxt[token()] = [end_state]
		
		ndfa.states.append(start_state)
		ndfa.states.append(end_state)
		next()

		return ndfa
	elif token() is " ":
		print "End of expression" 
	else:
		error()		



class State:
	present = None
	nxt = None

	def __init__(self):
		self.nxt = dict()

# return the token in the current position
# 
def token():
	global EXP
	global CURR_POS
	# chk if end of expression
	if (CURR_POS == len(EXP)):
		return " "
	return EXP[CURR_POS]

# check if tok matches current token
# if it does then move the curr_pos forward
def match(tok):
	if token() is tok:
		next()
	else:
		print "No match for", tok

# swap two values
def swap( v1, v2 ):
	return v2,v1;

# move the CURR_POS global forward 
# one 'token'
def next():
	global CURR_POS
	CURR_POS = CURR_POS + 1

# simple error reporting
def error():
#	print "An unexpected error has occured."
	next()

def main():

	global EXP
	global CURR_POS
	global TOTAL_STATES
	print "\nRegular expression to parse (EOF to exit):"
	EXP = sys.stdin.readline()
	counter = 1
	try:
		while EXP != "EOF":
			item = NDFA()
			CURR_POS = 0
			item.read()
			item.name = str(counter)
			item.exportToGraph()
			TOTAL_STATES = 0
		
			print "\nRegular expression to parse (EOF to exit):"
			EXP = sys.stdin.readline()
			counter += 1
	except KeyboardInterrupt:
		print "\n->\tCaught signal(2). Killing process."
	except Exception:
		print "->\tReceived EOF, exiting."
	sys.exit(0)

if __name__ == "__main__":
	main()
