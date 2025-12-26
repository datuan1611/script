#!/bin/bash

export LC_NUMERIC=C	#using [.] for floating-point number

#Input data
echo "Quadratic equation: a*x*x + b*x + c = 0"
read -p "Input param a b c: " a b c

#Calculate delta
delta=$(echo "scale=10; $b^2-4*$a*$c" | bc -l)
printf "delta = %.2f\n" "$delta"

#Check delta
echo "Solve quadratic equation:"
if [ $delta -lt 0 ]; then
	echo "The equation has no solution."
elif [ $delta -eq 0 ]; then
	x=$(echo "scale=10; (-$b)/(2*$a)" | bc -l)
	printf "The equation has a unique solution: %.2f\n" "$x"
else 
	x1=$(echo "scale=10; (-$b+sqrt($delta))/(2*$a)" | bc -l)
	x2=$(echo "scale=10; (-$b-sqrt($delta))/(2*$a)" | bc -l)
	printf "The equation has two solutions: x1=%.2f and x2=%.2f\n" "$x1" "$x2"
fi

exit 0
