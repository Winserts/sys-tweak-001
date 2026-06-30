@echo off
net session >nul 2>&1
if %errorLevel% neq 0 exit

reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v MouseKeysFlags /t REG_SZ /d 0 /f

reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f

reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /va /f

exit
