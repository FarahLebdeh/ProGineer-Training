#In this file, I created two arrays. The user passes the name of the files to be compared so that each element in the first array is compared to its counterpart in the other array.
#mandatory
#You didn’t add the mandatory options: -file_1  and -file_2
#Create Array 1:
#echo "Enter the first array of file : "
#a= read -a array1
      echo "First array value is   => ${array1[*]}"
len1= echo "First array length is  => ${#array1[*]}"
echo
echo "---------------------------------------------------"
echo

#Create Array 2:
#echo "Enter the second array of file : "
#b= read -a array3
      echo "Second array value is => ${array2[*]}"
len2= echo "Second array length   => ${#array2[*]}"
echo
echo "---------------------------------------------------"
echo
args=( --file1 "$*" --file2 "$*" )
#--------------------------------------------------------------
#loop for compare files 

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

