@echo off 
title Remote Shell 
:Remote 
cls 
color 0F 
whoami 
echo ==================================================== 
echo Windows Remote Shell - to exit remote shell use exit 
echo ==================================================== 
set "computername=" 
set /p computername= "Enter PC Name: " 
( 
set computername | findstr /r /c:"[&""|()]" 
IF NOT ERRORLEVEL 1 set "computername=" 
) > NUL 
IF "%computername%"=="" goto :Remote 
CHOICE /C ab /M "A - Use HTTP | B - Use HTTPS" 
IF %ERRORLEVEL% EQU 2 goto :HTTPS 
IF %ERRORLEVEL% EQU 1 goto :HTTP 
:HTTP 
title Remote Shell %computername% 
winrs.exe /r:%computername% /d:C:\ cmd 
goto :Header 
:HTTPS 
title Remote Shell SSL %computername% 
winrs.exe /r:%computername% /usessl /d:C:\ cmd 
:Header 
title Remote Shell 
set "computername=" 
CHOICE /C cd /M "C - Target another computer | D - Exit shell" 
IF %ERRORLEVEL% EQU 2 goto :Exit 
IF %ERRORLEVEL% EQU 1 goto :Remote 
:Exit 
exit
