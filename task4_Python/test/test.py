#!/usr/bin/python

import sys, getopt

def main(argv):
   array1 = ''
   array2 = ''

   try:
       opts, args = getopt.getopt(argv,"h:f1:f2:",["file1=","file2="])
   except getopt.GetoptError:
      print ('test.py -f1 <array1> -f2 <array2>')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print ('test.py -f1 <array1> -f2 <array2>')
         sys.exit()
      elif opt in ("-f1", "--file1"):
         array1 = arg
      elif opt in ("-f2", "--file2"):
         array2 = arg
   print ('array1 file is ', array1)
   print ('array2 file is ', array2)

if __name__ == "__main__":
   main(sys.argv[1:])
