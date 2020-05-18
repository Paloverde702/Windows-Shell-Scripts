@echo off 
title Windows Remote Shell (WinRS)
:Remote 
cls 
color 0F 
whoami
time /t
date /t
echo ==================================================== 
echo Windows Remote Shell (WinRS) - end remote with: exit
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
title Windows Remote Shell (WinRS) %computername% 
winrs.exe /r:%computername% /d:C:\ cmd 
goto :Header 
:HTTPS 
title Windows Remote Shell (WinRS) SSL %computername% 
winrs.exe /r:%computername% /usessl /d:C:\ cmd 
:Header 
title Windows Remote Shell (WinRS)
set "computername=" 
CHOICE /C cd /M "C - Target another computer | D - Exit shell" 
IF %ERRORLEVEL% EQU 2 goto :Exit 
IF %ERRORLEVEL% EQU 1 goto :Remote 
:Exit 
exit
