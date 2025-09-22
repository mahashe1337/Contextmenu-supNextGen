@echo off
set DefaultSaveScreenshots=%USERPROFILE%\Desktop\%ClipName%.png
set SaveScreenshots=W:\_Cloud_Storage\_mahashe_Media\Pictures\Screenshots

if exist "%SaveScreenshots%" (set NotSpace=%Random%) else (mkdir "%SaveScreenshots%")
if exist "%SaveScreenshots%" (set NotSpace=%Random%) else (set SaveScreenshots=%USERPROFILE%\Desktop)
::"C:\Program Files\System Tools\System Utilities\NirCmd\nircmdc.exe" clipboard clear
"%~dp0nircmdc.exe" clipboard clear
timeout /t 2 /nobreak >NUL 2>&1
::"C:\Program Files\System Tools\System Utilities\NirCmd\nircmdc.exe" sendkeypress alt+printscreen
"%~dp0nircmdc.exe" sendkeypress alt+printscreen
:SaveImage_loop
for /f "tokens=1, 2, 3, 4 delims=-/. " %%a in ("%DATE%") do set "ClipName=%%a-%%b-%%c"
for /f "tokens=1-3 delims=:," %%a in ("%TIME%") do set "ClipName=%ClipName%_%%ah%%bm%%cs"
::"C:\Program Files\System Tools\System Utilities\NirCmd\nircmdc.exe" clipboard saveimage "%USERPROFILE%\Desktop\%ClipName%.png"
"%~dp0nircmdc.exe" clipboard saveimage "%SaveScreenshots%\%ClipName%.png"
if exist "%SaveScreenshots%\%ClipName%.png" exit /b
goto :SaveImage_loop