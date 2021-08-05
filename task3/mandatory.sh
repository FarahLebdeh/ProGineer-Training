#!/bin/bash

#In this file, I created two arrays. The user passes the name of the files to be compared so that each element in the first array is compared to its counterpart in the other array.
#mandatory
#./mandatory.sh -file1 "a.txt" -file2 "b.txt"
#You didn’t add the mandatory options: -file_1  and -file_2
#Create Array 1:
#echo "Enter the first array of file : "
# read -a array1
     # echo "First array value is   => ${array1[*]}"
#len1= echo "First array length is  => ${#array1[*]}"
#echo
#echo "---------------------------------------------------"
#echo

#Create Array 2:
#echo "Enter the second array of file : "
#read -a array2
 #     echo "Second array value is => ${array2[*]}"
#len2= echo "Second array length   => ${#array2[*]}"
#echo
#echo "---------------------------------------------------"
#echo
#args=( --file1 "$*" --file2 "$*" )

#-------------------------------------------------------------------
#------------------------------ Help  Function ---------------------                                                               
Help(){
   # Display Help
   #echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-h|-p|-g|-m|-file1|-file2 ]"
   echo "options:"
   echo ""
   echo "Usage: $0 -file1 array1 -file2 array2"
   echo "-h, --help      Show this help message and exit."
   echo "-p, --print     Print true or false and exit."      
   echo "-g, --go        Print go or don't go and exit." 
   echo "-m, --match     Print match or diff and exit." 
   echo "-f1, --file1    pass first array of files. "
   echo "-f2, --file2    pass second array of files."
   echo "-c, --file2     Compare files."
   echo
}

	#echo "$1 , $2 , $3 , $4 ,$5"
   	echo "First array value is => ${array1[*]}"
      	echo "Second array value is => ${array2[*]}"

#loop for compare files 
compare(){
      echo "First array value is => ${array1[*]}"
      echo "Second array value is => ${array2[*]}"
      
	
declare -i i=0
while [ "${array1[i]}" -a "${array2[i]}" ]; do
  	bool=$(cmp -s   "${array1[i]}" "${array2[i]}" )
	if cmp -s   "${array1[i]}" "${array2[i]}" 
		then

			echo "----- TRUE : The same Files  -----  "  "${array1[i]}" " with " "${array2[i]}" 
		else
			echo "----- False : The different files ----- "  "${array1[i]}" " with " "${array2[i]}" 
	fi
    	((i++))
    
	done
	exit 0
}

#---------------------------------

# Process the input options. Add options as needed.  
# Get the options
#args=("$@")
while getopts ":h:p:g:m:a:b:file1:file2:c:" option; do
   case $option in
      h) # display Help/ call help function 
         Help
         exit;;

      p) # display true or false/ call printDiff function 
         printDiff
         exit;;

      g) # display Go or Don't Go / call goDiff function 
         goDiff
         exit;;

      c) #display compare
     	 compare
         exit;;
	 
      m) #display match or diff / call match function 
         match
         exit;;

      file1) #file 1
           	   declare -a array1
		  # read -a  array1

		 #   array1=( $@ )
	    exit;;


      file2)#file 2
	      	declare -a array2 
         #	read -a  array1      
	     # array2=( $@ )	      
	      exit;;

  esac
done


#if [ -z "${array1[*]}" ] || [ -z "${array2[*]}" ] 
#then
#   echo "Some or all of the parameters are empty";
#   Help
 #  fi

#--------------------------------------------------------------


