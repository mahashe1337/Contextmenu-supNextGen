@echo off
setlocal
if "%~1"=="" exit /b 87
set "HERE=%~dp0"
if exist "%HERE%MHS.exe" (
  "%HERE%MHS.exe" "%~1"
  exit /b %errorlevel%
)
for %%G in (MHS.exe) do (
  if not "%%~$PATH:G"=="" (
    "%%~$PATH:G" "%~1"
    exit /b %errorlevel%
  )
)
echo MHS.exe not found 1>&2
exit /b 2
