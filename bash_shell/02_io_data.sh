#!/bin/bash

#Input data
read -p "Input your name: " name
read -p "Input your ages: " age
read -sp "Input your password: " password

echo "Input your phone numbers: "
read -a phone


#Output data
echo "Name: $name"
echo "Age: $age"
echo "Password: $password"
echo "Phone: $phone"

