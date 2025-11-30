:: 5th Batch script
:: copy, move, rename a file

@echo off

:: create test files before executing
echo create test files: src.txt, src_other.txt
echo This is a test file 01 > src.txt
echo This is a test file 02 > src_other.txt
pause

:: copy content from src.txt to dest_copy.txt
echo ----------------------
echo copy content from src.txt to dest_copy.txt
copy C:\"Documents and Settings"\%USERNAME%\Desktop\batch\src.txt C:\"Documents and Settings"\%USERNAME%\Desktop\batch\dest_copy.txt
pause

:: move file dest_copy.txt from folder batch to Desktop
echo ----------------------
echo move file dest_copy.txt from folder batch to Desktop
move C:\"Documents and Settings"\%USERNAME%\Desktop\batch\dest_copy.txt C:\"Documents and Settings"\%USERNAME%\Desktop\
pause

:: rename file src.txt to src_new.txt
echo ----------------------
echo rename file src.txt to src_new.txt
move C:\"Documents and Settings"\%USERNAME%\Desktop\batch\src.txt C:\"Documents and Settings"\%USERNAME%\Desktop\batch\src_new.txt
pause

:: combine file src_new.txt, src_other.txt to combine.txt
echo ----------------------
echo combine file src_new.txt, src_other.txt to combine.txt
copy C:\"Documents and Settings"\%USERNAME%\Desktop\batch\src_new.txt + C:\"Documents and Settings"\%USERNAME%\Desktop\batch\src_other.txt C:\"Documents and Settings"\%USERNAME%\Desktop\batch\combine.txt
pause

:: delete all test files
echo ----------------------
echo delete all test files
del C:\"Documents and Settings"\%USERNAME%\Desktop\batch\*.txt
del C:\"Documents and Settings"\%USERNAME%\Desktop\dest_copy.txt
pause