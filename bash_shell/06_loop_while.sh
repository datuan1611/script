#!/bin/bash

counter=1

while [ $counter -le 5 ]; do
	echo "Loop WHILE: counter[$counter]"
	#counter=$(expr $counter + 1)
	counter=$(($counter+1))
done

exit 0
