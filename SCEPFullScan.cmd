@echo off 
set /p computername= "Enter PC Name: " 
winrs.exe -r:%computername% "C:\Program Files\Microsoft Security Client\MpCmdRun.exe" -Scan -ScanType 2 
if %ERRORLEVEL% NEQ 0 ( 
echo Full system scan failed 
) 
exit /b 0
