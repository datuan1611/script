#!/bin/bash

export LC_NUMERIC=C	#using [.] for floating-point number

#Input data
echo "Linear equation: a*x + b = 0"
read -p "Input param a: " a
read -p "Input param b: " b

#Calculate and output data
echo "Solve linear equation:"
if [ $a -eq 0 ]; then
	if [ $b -eq 0 ]; then
		echo "The equation has infinitely many solution."
	else
		echo "The equation has no solution."
	fi
else
	x=$(echo "scale=10; -$b/$a"| bc -l)
	printf "The equation has a unique solution: %.5f\n" "$x"
fi

exit 0
