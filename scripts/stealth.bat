@echo off
net session >nul 2>&1
if %errorLevel% neq 0 exit

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackDocs /t REG_DWORD /d 0 /f
del /f /s /q "%AppData%\Microsoft\Windows\Recent\*"
exit
