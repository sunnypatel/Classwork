#!/usr/bin/python
# Cell struct concat function 
# by also making a new copy cell

import sys
import cell

# Concats two Cell Objects 
# makes a copy cell object
def list_concat_copy( A, B ):
    temp_data = A.__str__() + B.__str__()
    
    #create a new cell with concat'd data
    c = cell.Cell ( temp_data )
    return c
    
x = cell.Cell( 10 )
y = cell.Cell( 20 )

z = list_concat_copy(x , y)

z.echo()
