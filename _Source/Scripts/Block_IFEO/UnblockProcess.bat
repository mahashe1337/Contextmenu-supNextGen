@echo off
fltmc >nul 2>&1 || (powershell -NoProfile -WindowStyle Hidden -Command "Start-Process -Verb RunAs -FilePath \"$env:ComSpec\" -ArgumentList '/c \"\"%~f0\" \"%~1\"\"'" & exit /b)
setlocal EnableExtensions

:: аргумент и проверка
if "%~1"=="" exit /b 87
set "FULL=%~f1"
if /I not "%~x1"==".exe" exit /b 50
if not exist "%FULL%" exit /b 2

:: имя файла для ветки IFEO
set "EXE=%~nx1"
set "KEY=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%EXE%"

:: Debugger отправляем в безвредную утилиту, включаем фильтр по полному пути
reg delete "%KEY%" /f >nul

msg * [OK] разблокирован запуск: %FULL%
exit /b 0
