@echo off
setlocal EnableExtensions EnableDelayedExpansion

whoami /groups | find "S-1-16-12288"
if errorlevel 1 (
  echo Нужны права администратора.
  exit /b 5
)

if "%~1"=="" (
  echo Укажи папку параметром. Пример:
  echo   RemoveFromSystemPath.bat "C:\ProgramData"
  exit /b 2
)

for %%I in ("%~1") do set "DEL=%%~fI"

for /f "skip=2 tokens=2,*" %%A in ('
  reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path
') do set "CUR=%%B"

if not defined CUR (
  echo Системный PATH пуст.
  exit /b 0
)

rem --- Нормализуем разделители и убираем все вхождения сегмента DEL (в т.ч. с ; в начале/конце) ---
set "W=;!CUR!;"
set "W=!W:;!DEL!;=;!"
rem удалим возможные двойные ;;
:shrink
set "W=!W:;;=;!"
echo(!W!| find ";;" >con
if not errorlevel 1 goto shrink

rem --- снимаем ведущую/замыкающую ; если есть ---
if "!W:~,1!"==";" set "W=!W:~1!"
if "!W:~-1!"==";" set "W=!W:~0,-1!"

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /v Path /t REG_EXPAND_SZ /d "!W!" /f

if errorlevel 1 (
  echo Ошибка записи PATH.
  exit /b 1
) else (
  echo Удалено из системного PATH: "!DEL!"
)

rem --- Обновляем PATH в текущей сессии ---
set "PATH=!W!"
echo Для подхвата системой перезапусти проводник или выйди/войдя в систему.
exit /b 0
