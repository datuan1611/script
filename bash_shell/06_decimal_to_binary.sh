#!/bin/bash

#Input data
read -p "Input decimal number: " dec

#Convert decimal to binary
bin=""

while [ $dec -gt 0 ]; do
	mod=$(($dec%2))
	bin=$(echo "$mod$bin")
	dec=$(($dec/2))
done

#Output data
echo "Output binary number: $bin"

exit 0
