@echo off
title batch password manager

:home
cls
echo   =======================  
echo -- Batch Password Manager --
echo   =======================
echo.
echo 1. Save Password
echo 2. View Passwords
echo 3. Find Password
echo 4. Exit
echo.

echo Batch Password Manager saves data locally, meaning the system will create a file with your passwords!
set /p choice="Choose: "

if "%choice%"=="1" goto save
if "%choice%"=="2" goto view
if "%choice%"=="3" goto find
if "%choice%"=="4" exit
if "%choice%"=="info" goto info

echo Invalid choice!
pause >nul
cls

goto home

:save
cls
set /p site=Website: 
set /p pass=Password: 

echo %site% ^| %pass% >> Passwords.txt

echo.
echo Saved!
pause
goto home

:view
cls

if not exist Passwords.txt (
    echo No passwords saved yet!
) else (
    type Passwords.txt
)

pause
goto home

:find
cls

set /p search="Enter website to search for: "

echo.
find /i "%search%" Passwords.txt

echo.
pause
goto home

:info
cls
echo This is a password manager made in Batch!
echo I hope you like it!
echo.
echo.
echo If you delete `Passwords.txt`, it will delete your saved passwords and will automatically make one the next time you use BPM!
pause >nul
goto home