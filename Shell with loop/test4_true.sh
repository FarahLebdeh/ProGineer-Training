


#echo "farah"
temp_dir=$(mktemp -d)
#touch F_file.txt

#echo “Hello F, welcome to shell!” > F_file.txt
#------------------


for i in {A..Z} ; 
do
	mkdir $i
	cd $i
	echo 'Hello ' $i ', welcome to shell! ' > $i.txt
	cd ..

done

