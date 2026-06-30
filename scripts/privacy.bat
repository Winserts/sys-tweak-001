@echo off
net session >nul 2>&1
if %errorLevel% neq 0 exit

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
sc stop WerSvc
sc config WerSvc start= disabled
exit
