#!/bin/bash

print_default_message() {
	echo "Hello, wolrd!"
}

print_custom_message() {
	echo "Hello, $1!"
}

if [ "$1" == "name" ]; then
	#./08_func_message.sh name "Anh Tuan Do"
	#Hello, Anh Tuan Do
	print_custom_message "$2"
else
	#./08_func_message.sh
	#Hello, world!
	print_default_message
fi

read -p "Input your name: " name
print_custom_message $name

exit 0
