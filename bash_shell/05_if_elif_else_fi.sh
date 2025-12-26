#!/bin/bash

#Input data
read -p "Input your age: " age

#Check condition
if [ $age -gt 19 ]; then
	echo "You are a dult."
elif [ $age -lt 13 ]; then
	echo "You are a child."
else
	echo "You are a teenager."
fi

exit 0
