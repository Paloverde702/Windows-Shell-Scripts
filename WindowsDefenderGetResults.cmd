@ echo off 
set /p computername= "Enter PC Name: " 
set /p user= "Enter user running scan: " 
winrs.exe -r:%computername% TYPE "C:\Users\%user%\AppData\Local\Temp\MpCmdRun.log" 
if %ERRORLEVEL% NEQ 0 ( 
echo Antimalware scan results could not be retrieved 
) 
exit /b 0
