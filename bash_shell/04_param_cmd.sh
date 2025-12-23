#!/bin/bash
#./04_param_cmd.sh 10 20 30

#Display 1st param of script
echo "1st param of script: $1"		#10

#Display 2nd param of script
echo "2nd param of script: $2"		#20

#Display 3rd param of script
echo "4rd param of script: $3"		#30

#Display all param of script
echo "all param of script: $@"		#10 20 30

#Calculate sum of all param
echo "Sum of all param is: $(expr $1 + $2 + $3)"	#60

exit 0
