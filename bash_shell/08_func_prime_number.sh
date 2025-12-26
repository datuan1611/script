#!/bin/bash

is_prime() {
	num=$1

	#Check num <=1
	if [ $num -le 1 ]; then
		echo "$num is not prime!"
		exit
	fi

	#Check
	i=2
	while [ $(($i*$i)) -le $num ]; do
		#Check num is divisible by i or not
		if [ $(($num%$i)) -eq 0 ]; then
			echo "$num is not prime, diviable by $i!"
			exit
		fi
		i=$(($i+1))
	done

	echo "$num is prime!"
	exit
}

#Input number that need to be checked
read -p "Input number: " number

#Check if number is prime or not
is_prime $number

exit 0
