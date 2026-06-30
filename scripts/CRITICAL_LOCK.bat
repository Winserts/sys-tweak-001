@echo off
net session >nul 2>&1
if %errorLevel% neq 0 exit

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v PendingFileRenameOperations /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Winserts_Guard" /t REG_SZ /d "cmd.exe /c exit" /f

exit
