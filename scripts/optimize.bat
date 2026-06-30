@echo off
:: ==========================================
:: WINSERTS PERFORMANCE OPTIMIZER - ROOT MODE
:: ==========================================

:: Cek Hak Akses Administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :Eksekusi
) else (
    echo [ERROR] AKSES DITOLAK! 
    echo Skrip Winserts ini bukan mainan. Klik kanan dan pilih "Run as administrator".
    pause
    exit
)

:Eksekusi
setlocal enableextensions
setlocal enabledelayedexpansion

:: Mematikan layanan pemakan resource
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

:: Mematikan Hibernasi (Menghemat Space Disk)
powercfg -h off

:: Optimasi Respon Sistem dan Memori via Registry
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 26 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f

:: Pembersihan Log Sistem (Menghapus jejak sampah)
for /f "tokens=*" %%a in ('wevtutil.exe el') do wevtutil.exe cl "%%a"

echo.
echo [STATUS] OPTIMASI SELESAI. SISTEM TELAH DIBERSIHKAN.
pause
exit
