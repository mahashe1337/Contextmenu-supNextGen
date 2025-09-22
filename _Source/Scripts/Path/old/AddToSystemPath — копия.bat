@echo off
setlocal enableextensions
set "folder=%~1"
if "%folder%"=="" exit /b 1
if not exist "%folder%" exit /b 2
for /f "tokens=2,*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path ^| findstr /i "Path"') do set "cur=%%B"
set "cur=%cur:"=%"
set "test=%cur%;"
echo %test%| find /I "%folder%;" && goto :done
echo %test%| find /I "%folder%" && (
  set "tmp=%cur%;"
  echo %tmp%| find /I "%folder%;" && goto :done
)
if "%cur%"=="" set "new=%folder%"
if not "%cur%"=="" set "new=%cur%;%folder%"

::reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "%new%" /f
::setx /M Path "%new%"
%~dp0Pather.bat %folder%
:done
echo Added to system PATH: "%folder%"
pause
exit /b 0
