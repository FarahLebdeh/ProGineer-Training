#!/bin/bash
#------------------ compare two files ---------------------
#----------------------------------------------------------
#------------------- Create Files -------------------------

#echo "Farah" > old.txt
#echo "Hello" >new.txt

#echo " a" > a.txt
#echo " a" > b.txt

#file1=old.txt
#file2=new.txt

file1=$1
file2=$2

#-------------------------------------------------
#-------------print same or diff ----------------- 

printDiff() {
bool=$(cmp -s "$file1" "$file2" )
if cmp -s "$file1" "$file2"
then
		echo "True"
	else
		echo "False"
fi
}
#-----------------------------------------------------------
#----------------------- Go Function -----------------------
goDiff() {
bool=$(cmp -s "$file1" "$file2" )
if cmp -s "$file1" "$file2"
then
		echo "Go"
	else
		echo "Don't Go"
fi
}

#----------------------------------------------------------
#----------------------- Match Function -------------------

match(){
#echo
#echo " Test if files are diff or not  : "
#echo
bool=$(cmp -s "$file1" "$file2" )
if cmp -s "$file1" "$file2"
	then
  		 echo "The files match "
	else
   		echo "The files are different"
fi
}


#----------------------- check Function ------------------

check(){
	if [ "$x" = "Print" ]; then
  		printDiff
	else
  		goDiff
	fi
}

#-----------------------------********-----------------------****-------------------
#In this file, I created two arrays. The user passes the name of the files to be compared so that each element in the first array is compared to its counterpart in the other array.

#Create Array 1:
#echo "Enter the first array of file : "
#read -a array1
#read -a array2

 #     echo "First array value is   => ${array1[*]}"
#len1= echo "First array length is  => ${#array1[*]}"
#echo
#echo "---------------------------------------------------"
#echo

#Create Array 2:
#echo "Enter the second array of file : "
#read -a array2
#      echo "Second array value is => ${array2[*]}"
#len2= echo "Second array length   => ${#array2[*]}"
#echo
#echo "---------------------------------------------------"
#echo

#--------------------------------------------------------------
#loop for compare files 
compare(){
declare -i i=0
while [ "${array1[i]}" -a "${array2[i]}" ]; do
   # printf " %s |  %s\n"  "${array1[i]}" "${array2[i]}" 
	#echo	
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

#----------------------------------------------------------

#-------------------------------------------------------------------
#------------------------------ Help  Function ---------------------                                                               
Help(){
   # Display Help
   #echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-h|-p|-g|-m|-file1|-file2 ]"
   echo "options:"
   echo "-h,      --help      Show this help message and exit."
   echo "-p,      --print     Print true or false and exit."      
   echo "-g,      --go        Print go or don't go and exit." 
   echo "-m,      --match     Print match or diff and exit." 
   echo "-file1, --file1     Print match or diff and exit."
   echo "-file2, --file2     Print match or diff and exit."  
   echo
}

# Process the input options. Add options as needed.  
# Get the options
while getopts ":h:p:g:m:file1:file2:" option; do
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

      m) #display match or diff / call match function 
         match
         exit;;
	 
	file1 "$array1" file2 "$array2" )
		read -a array1
		read -a array2

	# array1= $@
	 #a= read -a array1

	 #************************************************************************

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
	 #************************************************************************


	 	 exit;;

 #file2)
#	array2= $@	 
#	b= read -a array2
#	exit;;
	      
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
	 
     *)
        echo 'Error in command line !!!' 
        exit 1
  esac
  done


  # mandatory arguments
if [ -z "$a" ] && [ -z "$b" ]; then
       compare
fi


if [ -z "$a" ] || [ -z "$b" ]; then
        echo 'Missing -a or -b' >&2
        exit 1
fi


