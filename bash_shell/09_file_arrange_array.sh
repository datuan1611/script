#!/bin/bash

#Declare file
file_input="$1"
file_output="$2"

#Check if file_input is existing or not
if [ ! -f "$file_input" ]; then
	echo "File $file_input is not existing"
	exit
fi

#Read array from file_input
read -r -a arr_number < "$file_input"

#Count member of array
n=${#arr_number[@]}

#Arrange member of array
for ((i = 0; i < n-1; i++)); do
	for ((j = i+1; j < n; j++)); do
		if [ ${arr_number[$i]} -gt ${arr_number[$j]} ]; then
			tmp=${arr_number[$i]}
			arr_number[$i]=${arr_number[$j]}
			arr_number[$j]=$tmp
		fi
	done
done

#Write result into file_output
echo "${arr_number[@]}" > "$file_output"
