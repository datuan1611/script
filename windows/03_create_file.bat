:: 3rd Batch script
:: create a file

@echo off

set /p filename= File name: 

:loop
set /a file+=1

echo datuan1611>> %filename%.txt
echo datuan1611> %file%.txt
pause

goto loop