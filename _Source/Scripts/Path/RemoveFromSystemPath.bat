@echo off
fltmc >nul 2>&1 || (powershell -NoProfile -WindowStyle Hidden -Command "Start-Process -Verb RunAs -FilePath \"$env:ComSpec\" -ArgumentList '/c \"\"%~f0\" \"%~1\"\"'" & exit /b)
set Argument=%1
if "%Argument%"=="" (goto Help) else (if "%Argument%"=="help" (goto Help) else (if "%Argument%"=="?" (goto Help) else (if "%Argument%"=="/?" (goto Help) else (if "%Argument%"=="/help" (goto Help) else (set NotSpace=%Random%)))))
if "%Argument%"=="RemoveSetx" (call :Remove) else (call :AddedPath)
goto MainExit
goto MainExit
goto MainExit

:AddedPath
set PowerShellPath=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
set Path=
echo Argument = [%Argument%]
%PowerShellPath% -NoProfile -ExecutionPolicy Bypass -File "%~dp0Pather.ps1" -PathToRemove "%Argument%"
goto :eof

:Remove
cls
set /p Setxname="������ ��� ��६����� :> "
reg delete "HKEY_CURRENT_USER\Environment" /f /v "%Setxname%"
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" /f /v "%Setxname%"
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f /v "%Setxname%"
reg delete "HKEY_USERS\S-1-5-21-478477701-2328128587-2174127371-1001\Environment" /f /v "%Setxname%"
reg delete "HKEY_USERS\S-1-5-21-478477701-2328128587-2174127371-1001\Environment" /f /v "%Setxname%"
echo ��६����� %Setxname% �뫠 㤠����.
goto :eof

:Help
cls
echo �� ������� ��������/㤠��� ���� � ��⥬��� � ���짮��⥫���� ��६���� path
echo �������� � path ����:
echo ���⠪��: %0 "����"
Echo �ਬ��: %0 "C:\Users\%Mahashe%"
echo ������� ��६�����:
echo ���⠪��: %0 RemoveSetx
:MainExit