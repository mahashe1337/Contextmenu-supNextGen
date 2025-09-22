@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem --- Требуются права администратора (HKLM) ---
whoami /groups | find "S-1-16-12288"
if errorlevel 1 (
  echo Нужны права администратора.
  exit /b 5
)

if "%~1"=="" (
  echo Укажи папку параметром. Пример:
  echo   AddToSystemPath.bat "C:\ProgramData"
  exit /b 2
)

for %%I in ("%~1") do set "ADD=%%~fI"
if not exist "%ADD%" (
  echo Папка не найдена: "%ADD%"
  exit /b 3
)

rem --- Читаем текущий системный PATH из реестра ---
for /f "skip=2 tokens=2,*" %%A in ('
  reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path
') do set "CUR=%%B"

if not defined CUR set "CUR="

rem --- Проверка: уже есть ли ADD в PATH (по точному сегменту с ;) ---
set "CHK=;!CUR!;"
set "CHK=!CHK:%ADD%=#MARK#!"
if not "!CHK!"=="!CHK:#MARK#=!" (
  echo Уже в PATH: "%ADD%"
  goto :_apply_session
)

rem --- Собираем новый PATH, аккуратно ставим разделители ---
if defined CUR (
  set "NEW=!CUR!"
  rem если нет завершающей точки с запятой - добавим
  if not "!NEW:~-1!"==";" set "NEW=!NEW!;"
  set "NEW=!NEW!!ADD!"
) else (
  set "NEW=!ADD!"
)

rem --- Пишем в HKLM (тип REG_EXPAND_SZ), кавычки обязательны: & и прочие символы не порвут команду ---
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /v Path /t REG_EXPAND_SZ /d "!NEW!" /f

if errorlevel 1 (
  echo Ошибка записи PATH.
  exit /b 1
) else (
  echo Добавлено в системный PATH: "!ADD!"
)

:_apply_session
rem --- Обновляем PATH в текущей сессии cmd (для этого окна) ---
if defined CUR (
  set "PATH=%PATH%;%ADD%"
) else (
  set "PATH=%ADD%"
)

echo Для подхвата системой перезапусти проводник или выйди/войдя в систему.
exit /b
