#!/bin/bash
#--------------------------------------------------------------
#For run try :
#./run.sh -f1 a.txt -f2 b.txt -c
#./run.sh -f1 a.txt -f2 b.txt -p
#./run.sh -f1 a.txt -f2 b.txt -g
#--------------------------------------------------------------
#-------------print same or diff ----------------- 

printDiff() {
	bool=$(cmp -s   "${array1[i]}" "${array2[i]}" )
	if cmp -s   "${array1[i]}" "${array2[i]}"
       	then

		echo "True"
	else
		echo "False"
fi
}
#----------------------- Go Function -----------------------
goDiff() {
	bool=$(cmp -s   "${array1[i]}" "${array2[i]}" )
	if cmp -s   "${array1[i]}" "${array2[i]}" 
	then
		echo "Go"
	else
		echo "Don't Go"
fi
}

#----------------------------------------------------------
compare(){
#loop for compare files 
echo " -----------------------------------------------------"
echo "| array1  = ${array1}                                   |"
echo "| array2  = ${array2}                                   |"
echo " -----------------------------------------------------"
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

POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"
#${array1}  ${array2}  
  case $key in
    -f1|--file1)
      	array1="$2"
     	 shift # past argument
     	 shift # past value
      	;;

    -f2|--file2)
     	array2="$2"
      	shift # past argument
      	shift # past value
      	;;

    -c|--compare)
	compare
      ;;

     -g|go) # display Go or Don't Go / call goDiff function 
         goDiff
         exit;;

     -p|print) # display true or false/ call printDiff function 
         printDiff
        exit ;;

    --default)
      DEFAULT=YES
      shift # past argument
      ;;

    *)    # unknown option
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
      ;;

  esac
done

set -- "${POSITIONAL[@]}" # restore positional parameters

	if [[ -n $1 ]]; then
    		echo "Last line of file specified as non-opt/last argument:"
    		tail -1 "$1"

	if
		
	
