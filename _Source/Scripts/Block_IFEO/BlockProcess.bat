@echo off
fltmc >nul 2>&1 || (powershell -NoProfile -WindowStyle Hidden -Command "Start-Process -Verb RunAs -FilePath \"$env:ComSpec\" -ArgumentList '/c \"\"%~f0\" \"%~1\"\"'" & exit /b)
setlocal EnableExtensions

:: ��㬥�� � �஢�ઠ
if "%~1"=="" exit /b 87
set "FULL=%~f1"
if /I not "%~x1"==".exe" exit /b 50
if not exist "%FULL%" exit /b 2

:: ��� 䠩�� ��� ��⪨ IFEO
set "EXE=%~nx1"
set "KEY=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%EXE%"

:: Debugger ��ࠢ�塞 � ����।��� �⨫���, ����砥� 䨫��� �� ������� ���
reg add "%KEY%" /v Debugger /t REG_SZ /d "%SystemRoot%\System32\systray.exe" /f >nul
reg add "%KEY%" /v UseFilter /t REG_DWORD /d 1 /f >nul
reg add "%KEY%" /v FilterFullPath /t REG_SZ /d "%FULL%" /f >nul

msg * [OK] �����஢�� �����: %FULL%
exit /b 0
