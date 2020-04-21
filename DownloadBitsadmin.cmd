@echo off 
echo ***************************************************** 
echo ****This script assumes the C:\Temp folder exists**** 
echo ******Use it to download files from any website****** 
echo ***************************************************** 
set /p downloadjob= "Enter name of download job: " 
set /p url= "Enter full download URL including file: " 
set /p file= "Enter name of file or executable to download: " 
bitsadmin /transfer %downloadjob% %url% C:\Temp\%file% 
if %ERRORLEVEL% NEQ 0 ( 
echo download failed 
) 
exit /b 0
