#!/usr/bin/env python

expression = ''
operators = '*/+-()'	# valid operators
digits = '0123456789'	# valid operands
ws = ' \t'				# whitespace

# get the next character from the expression
def extract():
	global expression

	t = expression[0]
	if len(expression) < 2:
			expression = ''
			return t

	# 'pop' the first element of the string
	expression = expression[1:]
	return t

# useful when expression has no ws
def peek():
	global expression

	if len(expression) > 0:
		return expression[0]
	return False

# get the next input string
def get_expression():
	global expression

	try:
		expression = raw_input()
	except: 
		return False	

	if len(expression) == 0:
		return False
	return True

def get_next_token():
	global expression

	if len(expression) == 0:
		return False

	# now get the next token from the string, ignoring ws
	token = extract()
	while token in ws:
		token = extract()

	# an operator
	if token in operators:
		return token

	# an operand
	if token in digits:
		x = peek()
		while x and (x in digits):
			token += extract()
			x = peek()
		return token

	# any other characters are illegal, so we bail
	return False

