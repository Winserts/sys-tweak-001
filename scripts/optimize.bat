@echo off
setlocal enableextensions
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorLevel% == 0 (
    goto :Eksekusi
) else (
    exit
)

:Eksekusi
sc stop SysMain
sc config SysMain start= disabled

sc stop WSearch
sc config WSearch start= disabled

sc stop DiagTrack
sc config DiagTrack start= disabled

sc stop dmwappushservice
sc config dmwappushservice start= disabled

sc stop WbioSrvc
sc config WbioSrvc start= disabled

powercfg -h off

reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 26 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f

for /f "tokens=*" %%a in ('wevtutil.exe el') do wevtutil.exe cl "%%a"

del /s /f /q %temp%\*.*
for /d %%i in (%temp%\*) do rd /s /q "%%i"
del /s /f /q C:\Windows\Temp\*.*
for /d %%i in (C:\Windows\Temp\*) do rd /s /q "%%i"
del /s /f /q C:\Windows\Prefetch\*.*
for /d %%i in (C:\Windows\Prefetch\*) do rd /s /q "%%i"

exit
