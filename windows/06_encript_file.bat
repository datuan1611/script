:: 6th Batch script
:: encript, decript a file

@echo off

:: ==========START=============
echo encript a test file
setlocal enableDelayedExpansion

set /p code=input code:
set /p text=input text:
set chars=0123456789abcdefghijklmnopqrstuvwxyz

for /L %%N in (10 1 36) do (

	for /F %%C in ("!chars:~%%N,1!") do (		

		set /a MATH=%%N*%code%
		for /F %%F in (!%MATH%!) do (

			set "text=!text:%%C=-%%F!"
		)
	)
)

for /F %%F in ("!text!") do (
	set "text=!text:-=!"
)

set /a ret=3
echo %ret%
echo %text%
pause
:: ===========END==============