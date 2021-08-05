#!/usr/bin/python

import sys, getopt

def main(argv):
   inputfile1 = ''
   inputfile2 = ''
   go=''
   try:
       opts, args = getopt.getopt(argv,":h:f1:f2:",["ifile1=","ifile2="])
   except getopt.GetoptError:
      print ('a.py -f1 <inputfile1> -f2 <inputfile2>')
      #print(err)
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print( '  a.py -f1 <inputfile1> -f2 <inputfile2>')
         print( ' -h, --help           show this help message and exit')
         print( ' -f1,--file_1         first file. Could be one file or multi files')
         print( ' -f2,--file_2         2nd file. Could be one file or multi files')
         print( ' -g, --go             show this help message and exit')     
         sys.exit()
      elif opt in ("-f1", "--ifile1"):
        # print ('Input file 1 is "', inputfile1)          
         inputfile1 = arg
      elif opt in ("-f2", "--ifile2"):
           # print ('Input file 2 is "', inputfile2)   
         inputfile2 = arg
      elif opt in ("-go", "--GO"):
         go = arg

   print ('Input file 1 is ', inputfile1)
   print ('Input file 2 is ', inputfile2)


if __name__ == "__main__":
   main(sys.argv[1:])
