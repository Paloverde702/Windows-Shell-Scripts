@echo off
title Windows Defender Antivirus
:Scan
cls
color 0F
echo ==========WINDOWS DEFENDER ANTIVIRUS==========
echo ===Signature download and quick system scan===
echo ==============================================
echo STARTTIME: %time%
echo STARTDATE: %date%
echo Downloading latest antivirus signatures...
IF EXIST "%ProgramFiles%\Windows Defender" "C:\Program Files\Windows Defender\MpCmdRun.exe" -SignatureUpdate
echo Starting antivirus scan on system...
echo This can take some time. Lock the screen if not yet done!
IF EXIST "%ProgramFiles%\Windows Defender" "C:\Program Files\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
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
