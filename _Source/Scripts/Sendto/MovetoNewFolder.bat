@echo off

cd /d "%~dp1"
set "NF=New folder"
set "Dest=%~dp1%NF%"

if not exist "%Dest%" mkdir "%Dest%" & goto :MoveTask

	for /f "usebackq tokens=1 delims=." %%# in (`"WMIC path Win32_Directory WHERE name='%Dest:\=\\%' get creationdate"`) do (
		for /f %%@ in ("%%#") do set "FolderDate=%%@"
	)

	for /f "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set LDT=%%j
	set LDT=%LDT:~0,4%%LDT:~4,2%%LDT:~6,2%%LDT:~8,2%:%LDT:~10,2%:%LDT:~12,2%
	set LDT=%LDT::=%

if "%FolderDate%" == "%LDT%" goto :MoveTask

	setlocal enableDelayedExpansion
	set "baseName=New folder ("
	set "n=1"
	for /f "delims=" %%F in (
	  '2^>nul dir /b /ad "%baseName%*)"^|findstr /xri /c:"%baseName%[0-9]*)"'
	) do (
	  set "name=%%F"
	  set "name=!name:*%baseName%=!"
	  set "name=!name:)=!"
	  echo !name!
	  if !name! gtr !n! set "n=!name!"
	)
	set /a n+=1
	set "NF=%baseName%%n%"
	set "Dest=%~dp1%NF%)"

	for /f "usebackq tokens=1 delims=." %%# in (`"WMIC path Win32_Directory WHERE name='%Dest:\=\\%' get creationdate"`) do (
		for /f %%@ in ("%%#") do set "FolderDate=%%@"
	)

if "%FolderDate%" == "%LDT%" goto :MoveTask
if not exist "%Dest%" mkdir "%Dest%" & goto :MoveTask

:MoveTask
	for %%A in (%*) do (
		move %%A  "%Dest%"
	) >NUL 2>&1
exit /b