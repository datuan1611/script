#!/bin/bash

echo "Multiplication Table:"

#Loop
for table in {1..9}; do
	for index in {1..10}; do
		echo "$table x $index = $(($table*$index))"
	done
	echo "---"
done

exit 0
