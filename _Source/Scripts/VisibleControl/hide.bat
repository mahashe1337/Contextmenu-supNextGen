@echo off
setlocal
if "%~1"=="" exit /b 87
attrib +s +h "%~1"
exit /b %errorlevel%
