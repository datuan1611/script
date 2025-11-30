:: 4th Batch script\
:: create a password file

@echo off

:head
cls
color 7
echo What do you want?
echo -create (add new account)
echo -check  (check password)
echo -exit	 (exit script)

set /p choose=You choose:
::should use CALL instead of GOTO
call :%choose%
echo Wrong option!
pause
goto head

:create
cls
set /p password="Create password:"
echo %password%;>>password.txt
pause
goto head

:check
cls
set /p pass_tmp="Password needed to check:"
set /a b_checkPass=0
for /f "tokens=1,2,3,4,5 delims=;" %%a in (password.txt) do (
	if %pass_tmp%==%%a (
		set /a b_checkPass=1
	)
)
if %b_checkPass%==1 (
	echo Password is correct!
	color 2
	pause
	goto head
) else (
	echo Password is wrong!
	color 4
	pause
	goto check
)

:exit