#!/bin/python 

""" 
    count occurrence of list element entered by user
"""

from collections import Counter 

n = int(raw_input().strip())
c = map(int,raw_input().strip().split(' '))
count = Counter(c)   # return tuple ({"key" : "value" })

print sum([ x / 2 for x in count.values()])

