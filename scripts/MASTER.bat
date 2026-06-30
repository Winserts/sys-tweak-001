@echo off
net session >nul 2>&1
if %errorLevel% neq 0 exit

call scripts\optimize.bat
call scripts\network.bat

echo [SYSTEM] CORE OPTIMIZATION COMPLETE.
pause
