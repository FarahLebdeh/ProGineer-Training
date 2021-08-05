#cd tmp

temp_dir=$(mktemp -d)

#cd /tmp
#cd $(mktemp -d)
touch F_file.txt

echo “Hello F, welcome to shell!” > F_file.txt
