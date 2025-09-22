@echo off
set DefaultSaveScreenshots=%USERPROFILE%\Desktop\%ClipName%.png
set SaveScreenshots=W:\_Cloud_Storage\_mahashe_Media\Pictures\Screenshots
if exist "%SaveScreenshots%" (set NotSpace=%Random%) else (mkdir "%SaveScreenshots%")
if exist "%SaveScreenshots%" (set NotSpace=%Random%) else (set SaveScreenshots=%USERPROFILE%\Desktop)

for /f "tokens=1, 2, 3, 4 delims=-/. " %%a in ("%DATE%") do set "ClipName=%%a-%%b-%%c"
for /f "tokens=1-3 delims=:," %%a in ("%TIME%") do set "ClipName=%ClipName%_%%ah%%bm%%cs"
::"C:\Program Files\System Tools\System Utilities\NirCmd\nircmdc.exe" savescreenshot "%USERPROFILE%\Desktop\%ClipName%.png"
"%~dp0\nircmdc.exe" savescreenshot "%SaveScreenshots%\%ClipName%.png"
exit /b