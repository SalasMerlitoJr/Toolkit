::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD9xekmvGVmWL4Ev1Mz0+OSLrUwZR940YYPe3bWAKa4a6UqE
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD9xekmvGVmWL4Ev1Mz+/OGTrV0heucrb4DJ0fS6L+8f4UzwO5M10xo=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal EnableDelayedExpansion

:: ==========================================
:: Windows Network Toolkit
:: Author: Serafim
:: ==========================================

title Windows Network Toolkit - by Serafim
color 0A

:: Check for Administrator Rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo.
    echo ==========================================
    echo  ERROR: Please Run as Administrator
    echo  Windows Network Toolkit - by Serafim
    echo ==========================================
    echo.
    pause
    exit
)

:MENU
cls
echo ==================================================
echo           NETWORK TOOLKIT
echo           By Serafim
echo ==================================================
echo.
echo [1]  Show Full IP Configuration
echo [2]  Ping Google
echo [3]  Continuous Ping (8.8.8.8)
echo [4]  Flush DNS Cache
echo [5]  Release IP Address
echo [6]  Renew IP Address
echo [7]  Reset Winsock
echo [8]  Reset TCP/IP Stack
echo [9]  Display Routing Table
echo [10] Display ARP Cache
echo [11] Open Network Connections
echo [12] Open WiFi Settings
echo [13] Open Device Manager
echo [14] Open Network Troubleshooter
echo [15] Restart Windows Explorer
echo [16] View Active Network Sessions
echo [17] Run Full Network Repair
echo [18] Exit
echo.
set /p choice=Select Option:

if "%choice%"=="1"  goto IPCONFIG
if "%choice%"=="2"  goto PINGGOOGLE
if "%choice%"=="3"  goto CONTPING
if "%choice%"=="4"  goto FLUSHDNS
if "%choice%"=="5"  goto RELEASE
if "%choice%"=="6"  goto RENEW
if "%choice%"=="7"  goto WINSOCK
if "%choice%"=="8"  goto TCPRESET
if "%choice%"=="9"  goto ROUTE
if "%choice%"=="10" goto ARP
if "%choice%"=="11" goto NCPA
if "%choice%"=="12" goto WIFI
if "%choice%"=="13" goto DEVICE
if "%choice%"=="14" goto TROUBLE
if "%choice%"=="15" goto EXPLORER
if "%choice%"=="16" goto NETSTAT
if "%choice%"=="17" goto FULLREPAIR
if "%choice%"=="18" exit

echo Invalid Selection.
timeout /t 2 >nul
goto MENU

:IPCONFIG
cls
ipconfig /all
goto END

:PINGGOOGLE
cls
ping google.com -n 10
goto END

:CONTPING
cls
echo Press CTRL+C to stop.
ping 8.8.8.8 -t
goto END

:FLUSHDNS
cls
ipconfig /flushdns
goto END

:RELEASE
cls
ipconfig /release
goto END

:RENEW
cls
ipconfig /renew
goto END

:WINSOCK
cls
netsh winsock reset
echo.
echo Reboot Required.
goto END

:TCPRESET
cls
netsh int ip reset
echo.
echo Reboot Required.
goto END

:ROUTE
cls
route print
goto END

:ARP
cls
arp -a
goto END

:NCPA
start ncpa.cpl
goto END

:WIFI
start ms-settings:network-wifi
goto END

:DEVICE
start devmgmt.msc
goto END

:TROUBLE
start msdt.exe /id NetworkDiagnosticsNetworkAdapter
goto END

:EXPLORER
taskkill /f /im explorer.exe
start explorer.exe
goto END

:NETSTAT
cls
netstat -ano
goto END

:FULLREPAIR
cls
echo ====================================
echo Running Complete Network Repair
echo ====================================
echo.

ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset

echo.
echo ====================================
echo Network Repair Completed
echo Reboot Recommended
echo ====================================
goto END

:END
echo.
pause
goto MENU