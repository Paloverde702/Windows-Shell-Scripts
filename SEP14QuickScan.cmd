@echo off
title Symantec Endpoint Protection 14.2
:Scan
cls
color 0F
echo ====================================SYMANTEC ENDPOINT PROTECTION 14.2====================================
echo ==Logfile location: C:\ProgramData\Symantec\Symantec Endpoint Protection\14.2.758.0000.105\Data\Logs\AV==
echo =======================Logs are sorted by date - email the file to the IT Support========================
echo =========================================================================================================
echo Pre-check if 32-Bit or 64-Bit OS...
echo STARTTIME: %time%
echo STARTDATE: %date%
echo Downloading latest antivirus signatures...
IF EXIST "%ProgramFiles%\Symantec\Symantec Endpoint Protection" "C:\Program Files\Symantec\Symantec Endpoint Protection\SepLiveUpdate.exe"
IF EXIST "%ProgramFiles(x86)%\Symantec\Symantec Endpoint Protection" "C:\Program Files (x86)\Symantec\Symantec Endpoint Protection\SepLiveUpdate.exe"
echo Starting antivirus scan on system...
echo This can take some time. Lock the screen if not yet done!
IF EXIST "%ProgramFiles%\Symantec\Symantec Endpoint Protection" "C:\Program Files\Symantec\Symantec Endpoint Protection\DoScan.exe" /C
IF EXIST "%ProgramFiles(x86)%\Symantec\Symantec Endpoint Protection" "C:\Program Files (x86)\Symantec\Symantec Endpoint Protection\DoScan.exe" /C
echo ENDTIME: %time%
echo ENDDATE: %date%
echo After scan completes, choose one of 4 options to continue. Have a nice day!
CHOICE /C abcd /M "A - Scan system | B - Exit | C - Restart | D - Shutdown"
IF %ERRORLEVEL% EQU 4 goto :Shutdown
IF %ERRORLEVEL% EQU 3 goto :Restart
IF %ERRORLEVEL% EQU 2 goto :Exit
IF %ERRORLEVEL% EQU 1 goto :Scan
:Restart
shutdown.exe /r /t 0 /f
:Shutdown
shutdown.exe /s /t 0 /f
:Exit
exit
