#!/usr/bin/python
#
# format.py - a quick example of formatting output, columns, for a table of
#		integers
#
# Kurt Schmidt
# 3/09
#
# EDITOR:  tabstop=2, cols=80
#

# You can use some simple formatting, since we're dealing with integers, and
# remember that Python strings have a formatted version, like printf

# To display a multiplication table, for example, you can recall that numbers
# are right-justified, by default: </p>

for i in range(12) :
  for j in range(12) :
    print '%3d' % (i*j),
      # please note the preceding comma
  print

print
print

# If you want to be slightly slicker, you can pull out the repr
# module: 

for i in range(12) :
  for j in range(12) :
    print repr( i*j ).rjust(3),
      # please note the preceding comma
  print

print
print

# Finally, for total control, where you don't worry about print's
# automatic linebreak and field separator, use write: </p>

import sys

for i in range(12) :
  for j in range(12) :
    sys.stdout.write( '%4d' % (i*j) )
      # please note the *lack* of preceding comma
  sys.stdout.write( '\n' )

