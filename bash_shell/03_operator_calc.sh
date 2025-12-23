#!/bin/bash

#Input data
read -p "Input 1st number: " num1
read -p "Input 2nd number: " num2

#Calculate
sum=$(($num1+$num2))
echo "$num1 + $num2 = $sum"

let diff=$num1-$num2
echo "$num1 - $num2 = $diff"

echo "$num1 * $num2 = `expr $num1 \* $num2`"

echo "expr : $num1 / $num2 = `expr $num1 / $num2`"
let result=$num1/$num2
echo "let  : $num1 / $num2 = $result"
echo "\$(()): $num1 / $num2 = $(($num1/$num2))"

exit 0
