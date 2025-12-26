#!/bin/bash

counter=1

while [ $counter -le 5 ]; do
	echo "Loop WHILE: counter[$counter]"
	if [ $counter -eq 3 ]; then
		echo ">> breat at counter[$counter]"
		break
	fi
	counter=$(($counter+1))
done

exit 0
