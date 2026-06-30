@echo off
net session >nul 2>&1
if %errorLevel% neq 0 exit

ipconfig /flushdns
ipconfig /release
ipconfig /renew
exit
