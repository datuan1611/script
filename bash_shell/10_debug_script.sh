#!/bin/bash
file_input=$1
file_output=$2

#Enable debug
set -xv

read -r -a arr_in < "$file_input"
echo "input: ${arr_in[@]}"

read -r -a arr_out < "$file_output"
echo "output: ${arr_out[@]}"

#Disable debug
set +xv

exit 0
