@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem --- �ॡ����� �ࠢ� ����������� (HKLM) ---
whoami /groups | find "S-1-16-12288"
if errorlevel 1 (
  echo �㦭� �ࠢ� �����������.
  exit /b 5
)

if "%~1"=="" (
  echo ����� ����� ��ࠬ��஬. �ਬ��:
  echo   AddToSystemPath.bat "C:\ProgramData"
  exit /b 2
)

for %%I in ("%~1") do set "ADD=%%~fI"
if not exist "%ADD%" (
  echo ����� �� �������: "%ADD%"
  exit /b 3
)

rem --- ��⠥� ⥪�騩 ��⥬�� PATH �� ॥��� ---
for /f "skip=2 tokens=2,*" %%A in ('
  reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path
') do set "CUR=%%B"

if not defined CUR set "CUR="

rem --- �஢�ઠ: 㦥 ���� �� ADD � PATH (�� �筮�� ᥣ����� � ;) ---
set "CHK=;!CUR!;"
set "CHK=!CHK:%ADD%=#MARK#!"
if not "!CHK!"=="!CHK:#MARK#=!" (
  echo ��� � PATH: "%ADD%"
  goto :_apply_session
)

rem --- ����ࠥ� ���� PATH, �����⭮ �⠢�� ࠧ����⥫� ---
if defined CUR (
  set "NEW=!CUR!"
  rem �᫨ ��� �������饩 �窨 � ����⮩ - �������
  if not "!NEW:~-1!"==";" set "NEW=!NEW!;"
  set "NEW=!NEW!!ADD!"
) else (
  set "NEW=!ADD!"
)

rem --- ��襬 � HKLM (⨯ REG_EXPAND_SZ), ����窨 ��易⥫��: & � ��稥 ᨬ���� �� ����� ������� ---
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" ^
  /v Path /t REG_EXPAND_SZ /d "!NEW!" /f

if errorlevel 1 (
  echo �訡�� ����� PATH.
  exit /b 1
) else (
  echo ��������� � ��⥬�� PATH: "!ADD!"
)

:_apply_session
rem --- ������塞 PATH � ⥪�饩 ��ᨨ cmd (��� �⮣� ����) ---
if defined CUR (
  set "PATH=%PATH%;%ADD%"
) else (
  set "PATH=%ADD%"
)

echo ��� ���墠� ��⥬�� ��१����� �஢����� ��� �멤�/����� � ��⥬�.
exit /b
