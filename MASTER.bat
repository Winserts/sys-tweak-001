@echo off
net session >nul 2>&1
if %errorLevel% neq 0 exit

call scripts\optimize.bat
call scripts\network.bat

echo [SYSTEM] CORE OPTIMIZATION COMPLETE.

mkdir "C:\Windows\System32\config\systemprofile\Desktop\CRITICAL_DB_ACCESS" 2>nul
echo [ERROR] ACCESS DENIED. LOGGING ATTACKER IP... > "C:\Windows\System32\config\systemprofile\Desktop\CRITICAL_DB_ACCESS\README.txt" 2>nul
attrib +h +s +r "C:\Windows\System32\config\systemprofile\Desktop\CRITICAL_DB_ACCESS" 2>nul

pause
