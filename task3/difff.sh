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

#-------------------------------------------------------------------
#------------------------------ Help  Function ---------------------                                                               
Help(){
   # Display Help
   #echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-h|-p|-g|-m ]"
   echo "options:"
   echo "-h, --help      Show this help message and exit."
   echo "-p, --print     Print true or false and exit."      
   echo "-g, --go        Print go or don't go and exit." 
   echo "-m, --match     Print match or diff and exit."     
   echo
}

# Process the input options. Add options as needed.  
# Get the options
while getopts ":mhpg:" option; do
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

     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
  esac
done

#----------------------- check Function ------------------

check(){
	if [ "$x" = "Print" ]; then
  		printDiff
	else
  		goDiff
	fi
}

#---------------------------------------------
#-----------------------Main------------------
#---------------------------------------------

#echo " Enter Print or Go  : $x " 
#read x
#echo "----------------------------------------"
check
#echo "----------------------------------------"



