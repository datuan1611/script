#!/bin/bash

#Input array
read -p "Input array of number: " -a arr_number

#Count members of array
n=${#arr_number[@]}

#Display array
echo "${arr_number[@]}"

#Find minimum of array
min=${arr_number[0]}

for element in "${arr_number[@]}"; do
	if [ $min -gt $element ]; then
		min=$element
	fi
done

#Output minimum
echo "Minimum of array: $min"

exit 0
