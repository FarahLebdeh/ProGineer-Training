#!/usr/bin/python
import sys, getopt
import difflib
import filecmp
from optparse import OptionParser

#******************************************************************

parser = OptionParser()
  

x=parser.add_option('-1', '--file1',type='string', 
        help='first file. Could be one file or multi files')

parser.add_option('-2', '--file2',type='string',
        help='2nd file. Could be one file or multi files')

parser.add_option('-g', '--go', type='string',
        help='print go/no go instead of true/false')

#parser.add_option("-q", "--quiet",
 #                 action="store_false", default=True,
  #                help="don't print status messages to stdout")

#(args) = parser.parse_args()
(options, args) = parser.parse_args()
x=options.file1
print(x)
y=options.file2
print(y)



#******************************************************************

if x is not None and y is not None :
            firstString= x.split(" ")
            secondString= y.split(" ")
for i in range(len(firstString)) :
            ans = filecmp.cmp(firstString[i], secondString[i])

if ans == True :
                print ("--------------- Go ---------------\n")

else :
                print ("--------------- NO Go !!! ---------------\n")
   

