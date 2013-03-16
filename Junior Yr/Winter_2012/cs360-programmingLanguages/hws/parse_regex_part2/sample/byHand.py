



import io

import sys

import string



exp = ""

current = int(0)

totalStates = int(0) # for correct labeling





def union():

	# <union> -> <concat> { OR <concat> }

	final = concat()

	ndfa = NDFA()

	ndfa.copy(final)	# This copy is created because the function returns ndfa

	while (token() is "|"):

		match("|")

		nxt = concat()



		global totalStates



		start = State()

		start.present = totalStates

		totalStates += 1



		end = State()

		end.present = totalStates

		totalStates += 1



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

			final.states[0].present, start.present = switch(

final.states[0].present, start.present )

	

		# for left associativity	

		final.copy(ndfa)		

		

	return ndfa



def switch( v1, v2 ):

	# Switch two values

	return v2,v1



def concat():

	# <concat> -> <closure> { CAT <closure> }

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





def closure():

	# <closure> -> <paren> STAR | <paren>

	final = paren()

	while (token() is "*"):

		match("*")



		num = len(final.states) - 1

		start = final.states[0]

		end = final.states[num]





		# Avoid over-writing		

		if start.nxt.has_key("EPSILON"):

			start.nxt["EPSILON"].extend([end])

		else:

			start.nxt["EPSILON"] = [end]



		if end.nxt.has_key("EPSILON"):

			end.nxt["EPSILON"].extend([start])

		else:

			end.nxt["EPSILON"] = [start]



	return final



def paren():

	# paren -> '(' <union> ')' | <transition>

	final = NDFA()

	if token() is "(":

		match("(")

		final = union()

		match(")")

	else:

		final = transition()

	return final 





def transition():

	ndfa = NDFA()

	if token() in str(string.ascii_lowercase):

		#print "Found", token()

		s1 = State()

		s2 = State()

		global totalStates



		s1.present = totalStates

		totalStates += 1

		s2.present = totalStates

		totalStates += 1

		

		s1.nxt[token()] = [s2]

		

		ndfa.states.append(s1)

		ndfa.states.append(s2)

		next()

#		ndfa.printNDFA()

		return ndfa

	elif token() is " ":

		print "End of input" 

	else:

		error()		



class NDFA:

	name = None

	number = None

	states = None



	def __init__(self):

		self.name = ""

		self.number = 0

		self.states = []



	def copy(self, ndfa):

		self.name = ndfa.name

		self.number = ndfa.number

		self.states = ndfa.states



	def Read(self):

		global exp

		global current

		self.copy(union())

		self.states.sort()

		self.number = len(self.states)



	def exportToGraph(self):



		fileName = self.name + ".dot"

		file = open(fileName,'w')

		

		file.write("digraph " + self.name + " {" + "\n")

		file.write("rankdir=\"LR\"" + "\n")

		file.write("start [shape=\"plaintext\",label=\"start\"]" + "\n")



		for i in range(self.number-1):

			file.write(str(i) + " [shape=\"circle\",label=\"S" + str(i) + "\"]" + "\n")



		file.write(str(self.number-1) + " [shape=\"doublecircle\",label=\"S" +

str(self.number-1) + "\"]" + "\n")



		file.write("start->0" + "\n")



		for i in range(self.number):

			for j in self.states[i].nxt.keys():

				for k in self.states[i].nxt[j]:

#					print i, j, k

					file.write( str(self.states[i].present) + "->" + str(k.present) + " [label=\"" + str(j) + "\"]" + "\n")



		file.write("}" + "\n")



		file.close()



		print fileName, "writen."



	

	def printNDFA(self):

		for i in range(len(self.states)):

			print self.states[i].present, self.states[i].nxt.keys()



class State:

	present = None

	nxt = None



	def __init__(self):

		self.nxt = dict()



def token():

	global exp

	global current

	if (current == len(exp)):

		return " "

	return exp[current]



def match(tok):

	if token() is tok:

#		print "matched", tok

		next()

	else:

		print "No match for", tok



def next():

	global current

	current = current + 1



def error():

	print "An error occured."

	next()



def main():



	global exp

	global current

	global totalStates

	print "\nEnter a regular expression (EOF to exit):"

	exp = sys.stdin.readline()

	counter = int(1)

	while exp:

		if str(exp) is "EOF":

			exit()

		item = NDFA()

		current = int(0)

		item.Read()

		item.name = str(counter)

		item.exportToGraph()

		totalStates = 0

		

		print "\nEnter a regular expression (EOF to exit):"

		exp = sys.stdin.readline()

		counter += 1



if __name__ == "__main__":

	main()
