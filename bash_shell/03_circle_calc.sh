#03_circle_cal.sh

#calculate circumference and area of circle
#using [bc -l] for float numbers

#------------------------------------------#

#!/bin/bash

export LC_NUMERIC=C             #using [.] for floating-point number

#Input data
read -rp "Input radius of circle: " r

#If neccessary, replace [,] to [.] in radius
r=${r/,/.}

#Calculate area and circumference
pi=$(echo "scale=20; 4*a(1)"    | bc -l)        #pi = 3.14
C=$(echo "scale=20; 2*$pi*$r"   | bc -l)        #C  = 2*pi*r
S=$(echo "scale=20; $pi*$r*$r"  | bc -l)        #S  = pi*r*r

#Output result
printf "Circumference (C): %.2f\n" "$C"
printf "Area (S): %.2f\n" "$S"

exit 0
