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
reg delete "%KEY%" /f >nul

msg * [OK] ࠧ�����஢�� �����: %FULL%
exit /b 0
