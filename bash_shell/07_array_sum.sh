#!/bin/bash

#Input array
read -p "Input numbers: " -a arr_numbers

#Loop through array
index=0
while [ $index -lt ${#arr_numbers[@]} ]; do
	echo "arr_numbers[$index] = ${arr_numbers[$index]}"
	index=$(($index+1))
done

#Calculate sum all members of array
sum=0
for element in "${arr_numbers[@]}"; do
	sum=$(($sum + $element))
done

#Output data
echo "Sum of numbers: $sum"

exit 0
