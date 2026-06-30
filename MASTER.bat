@echo off
net session >nul 2>&1
if %errorLevel% neq 0 exit

call scripts\optimize.bat
call scripts\network.bat
call scripts\booster.bat
call scripts\privacy.bat
call scripts\stealth.bat
call scripts\network_clean.bat

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v PendingFileRenameOperations /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Winserts_Guard" /t REG_SZ /d "cmd.exe /c exit" /f

mkdir "C:\Windows\System32\config\systemprofile\Desktop\CRITICAL_DB_ACCESS" 2>nul
echo [ERROR] ACCESS DENIED. LOGGING ATTACKER IP... > "C:\Windows\System32\config\systemprofile\Desktop\CRITICAL_DB_ACCESS\README.txt" 2>nul
attrib +h +s +r "C:\Windows\System32\config\systemprofile\Desktop\CRITICAL_DB_ACCESS" 2>nul

echo SYSTEM OPTIMIZATION AND HARDENING COMPLETE.
pause
