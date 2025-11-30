:: 2nd Batch script
:: cmd: set /a/p -> variable

@echo off

echo Input: num1=
set /p num1=

echo Input: num2=
set /p num2=

set /a result= num1 + num2
echo num1 + num2 = %result%

pause