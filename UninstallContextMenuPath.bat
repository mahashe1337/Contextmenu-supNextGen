@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: =========================
:: НАСТРОЙКИ ОТКАТА
:: =========================
:: 1 = попытаться вернуть 3D Edit / 3D Print через перерегистрацию UWP пакетов
set "RESTORE_3D=1"
:: basic = вернуть print/printto только для txtfile/textfile; off = не трогать
set "RESTORE_PRINT=basic"

:: Папки с тулзами (как у тебя в инсталле)
set "NSudoFolder=%~dp0Nsudo"
set "NirCmdFolder=%~dp0NirCmd"
set "SetACLFolder=%~dp0SetACL"
set "PATHMAN=%~dp0Scripts\pathman.exe"

cls

:: =========================
:: ЭСКАЛАЦИЯ ПРАВ (как у тебя)
:: Сначала проверяем, не бежим ли уже как SYSTEM (S-1-5-18)
:: =========================
%windir%\system32\whoami.exe /USER | find /i "S-1-5-18" 1>nul && (
  goto :OK
) || (
  goto START
)

:START
:: Если есть NSudoC - поднимемся до TrustedInstaller и перезапустим этот же файл
if exist "%NSudoFolder%\NSudoC.exe" (
  "%NSudoFolder%\NSudoC.exe" -U:T -P:E -Wait -UseCurrentConsole "%~dpnx0" rollback
  exit /b
) else (
  :: Иначе просто UAC-админ
  net session >nul 2>&1
  if errorlevel 1 (
    powershell -NoProfile -Command "Start-Process -Verb RunAs -FilePath '%~f0' -ArgumentList 'rollback'"
    exit /b
  )
)
goto :OK

:OK
if /i "%1"=="rollback" shift

echo =============================================
echo ============ R O L L B A C K  ===============
echo =============================================
echo.

:: ------------------------------------------------
:: 0) СНАЧАЛА ЧИСТИМ ТО, ЧТО СКРИПТ ДОБАВЛЯЛ
:: ------------------------------------------------

echo [1/9] Удаляю пункты "Restart Explorer..."
reg delete "HKCR\Directory\background\shell\01_RestartExplorerNow" /f >nul 2>&1
reg delete "HKCR\Directory\background\shell\02_RestartExplorerOnDemand" /f >nul 2>&1

echo [2/9] Удаляю Snipping/ScreenSnip пункты...
reg delete "HKCR\Directory\background\shell\03_ScreenSnip_Enhanced" /f >nul 2>&1
reg delete "HKCR\Directory\background\shell\04_SnippingTools" /f >nul 2>&1

echo [3/9] Удаляю "Install CAB Update" для .cab...
reg delete "HKCR\CABFolder\Shell\RunAs" /f >nul 2>&1
reg delete "HKCR\SystemFileAssociations\.cab\Shell\RunAs" /f >nul 2>&1

echo [4/9] Удаляю NSudo из контекстного меню .exe/.bat/.cmd...
reg delete "HKCR\exefile\shell\NSudo" /f >nul 2>&1
reg delete "HKCR\batfile\shell\NSudo" /f >nul 2>&1
reg delete "HKCR\cmdfile\shell\NSudo" /f >nul 2>&1
reg delete "HKCR\Directory\shell\VisibleControl" /f >nul 2>&1
reg delete "HKCR\Directory\shell\VisibleControl\shell\HideFolder" /f >nul 2>&1
reg delete "HKCR\Directory\shell\VisibleControl\shell\UnhideFolder" /f >nul 2>&1
reg delete "HKCR\*\shell\FileControl" /f >nul 2>&1

echo [5/9] Чищу CommandStore (NSudo.*)...
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.System" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.System.EnableAllPrivileges" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.TrustedInstaller" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.TrustedInstaller.EnableAllPrivileges" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unBlockProcess" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.RunHide" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.BlockProcess" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.VisibleControl" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.hide" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unhide" /f >nul 2>&1

echo [6/9] Удаляю добавленные контекст-хендлеры (PlayTo/OfflineFiles/EFS/ModernSharing/WorkFolders/Library Location/Sharing, и т.п.)...
:: Library Location
reg delete "HKCR\Folder\shellex\ContextMenuHandlers\Library Location" /f >nul 2>&1

:: CopyHook Sharing на директориях
reg delete "HKCR\Directory\shellex\CopyHookHandlers\Sharing" /f >nul 2>&1

:: Offline Files (ContextMenuHandlers)
reg delete "HKCR\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\ContextMenuHandlers\Offline Files" /f >nul 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\Offline Files" /f >nul 2>&1
reg delete "HKCR\Folder\shellex\ContextMenuHandlers\Offline Files" /f >nul 2>&1

:: Play To (стэки)
reg delete "HKCR\Stack.Audio\shellex\ContextMenuHandlers\PlayTo" /f >nul 2>&1
reg delete "HKCR\Stack.Image\shellex\ContextMenuHandlers\PlayTo" /f >nul 2>&1
reg delete "HKCR\Stack.Video\shellex\ContextMenuHandlers\PlayTo" /f >nul 2>&1

:: Play To (расширения)
for %%E in (.3g2 .3gp .3gp2 .3gpp .aac .adt .adts .dtcp-ip .flac .lpcm .m2t .m2ts .m4a .m4v .mk3d .mka .mkv .mov .mp4 .mp4v .mts .ts .tts .wtv) do (
  reg delete "HKCR\SystemFileAssociations\%%E\shellex\ContextMenuHandlers\PlayTo" /f >nul 2>&1
)
:: Play To (группы типов)
reg delete "HKCR\SystemFileAssociations\audio\shellex\ContextMenuHandlers\PlayTo" /f >nul 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Audio\shellex\ContextMenuHandlers\PlayTo" /f >nul 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Image\shellex\ContextMenuHandlers\PlayTo" /f >nul 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Video\shellex\ContextMenuHandlers\PlayTo" /f >nul 2>&1
reg delete "HKCR\SystemFileAssociations\image\shellex\ContextMenuHandlers\PlayTo" /f >nul 2>&1
reg delete "HKCR\SystemFileAssociations\video\shellex\ContextMenuHandlers\PlayTo" /f >nul 2>&1

:: Offline Files (PropertySheetHandlers)
reg delete "HKCR\Directory\shellex\PropertySheetHandlers\Offline Files" /f >nul 2>&1
reg delete "HKCR\Folder\shellex\PropertySheetHandlers\Offline Files" /f >nul 2>&1

:: EFS / ModernSharing / WorkFolders (контекст)
reg delete "HKCR\*\shellex\ContextMenuHandlers\Open With EncryptionMenu" /f >nul 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\EncryptionMenu" /f >nul 2>&1
reg delete "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /f >nul 2>&1
reg delete "HKCR\*\shellex\ContextMenuHandlers\WorkFolders" /f >nul 2>&1
reg delete "HKCR\Directory\background\shellex\ContextMenuHandlers\WorkFolders" /f >nul 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\WorkFolders" /f >nul 2>&1

:: Sharing - то, что добавлял скрипт
reg delete "HKCR\*\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
reg delete "HKCR\Directory\background\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
reg delete "HKCR\Directory\shellex\PropertySheetHandlers\Sharing" /f >nul 2>&1
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
reg delete "HKCR\Drive\shellex\PropertySheetHandlers\Sharing" /f >nul 2>&1
reg delete "HKCR\LibraryFolder\background\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
reg delete "HKCR\UserLibraryFolder\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1

:: Compatibility (добавлял)
reg delete "HKCR\batfile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
reg delete "HKCR\cmdfile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
reg delete "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
reg delete "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
reg delete "HKCR\MSILink\shellex\ContextMenuHandlers" /f >nul 2>&1

echo [7/9] Откатываю переименованные ключи (удаляю {GUID} и возвращаю {GUID})...

:: Снос <?{GUID}>
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\?{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f >nul 2>&1
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\?{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg delete "HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\?{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg delete "HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\?{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f >nul 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\?{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg delete "HKCR\Directory\shellex\PropertySheetHandlers\?{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\?{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\?{D6791A63-E7E2-4fee-BF52-5DED8E86E9B8}" /f >nul 2>&1
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\?{fbeb8a05-beee-4442-804e-409d6c4515e9}" /f >nul 2>&1
reg delete "HKCR\MSILink\shellex\ContextMenuHandlers\?{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul 2>&1

:: Возвращаем удалённые ранее <оригинальные> GUID-ключи (без данных - как было у тебя)
reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f >nul 2>&1
reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg add "HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg add "HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f >nul 2>&1
reg add "HKCR\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg add "HKCR\Directory\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg add "HKCR\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
reg add "HKCR\Drive\shellex\ContextMenuHandlers\{D6791A63-E7E2-4fee-BF52-5DED8E86E9B8}" /f >nul 2>&1
reg add "HKCR\Drive\shellex\ContextMenuHandlers\{fbeb8a05-beee-4442-804e-409d6c4515e9}" /f >nul 2>&1
reg add "HKCR\MSILink\shellex\ContextMenuHandlers\{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul 2>&1
echo [8/9] Чищу PATH от добавленных путей (если есть pathman)...
if exist "%PATHMAN%" (
  "%PATHMAN%" /ds "%NSudoFolder%"
  "%PATHMAN%" /ds "%NirCmdFolder%"
  "%PATHMAN%" /ds "%SetACLFolder%"
) else (
  echo  - pathman.exe не найден: %PATHMAN%
)
echo [9/9] Откат удаления print/printto и 3D-пунктов (по настройкам)...
:: ====== ВОЗВРАТ PRINT ДЛЯ TXT (безопасный минимум) ======
if /i "%RESTORE_PRINT%"=="basic" (
  echo   * Возвращаю print/printto для txtfile/textfile
  :: txtfile
  reg add "HKCR\txtfile\shell\print" /ve /t REG_SZ /d "Print" /f >nul 2>&1
  reg add "HKCR\txtfile\shell\print\command" /ve /t REG_EXPAND_SZ /d "\"%SystemRoot%\System32\NOTEPAD.EXE\" /p \"%1\"" /f >nul 2>&1
  reg add "HKCR\txtfile\shell\printto" /ve /t REG_SZ /d "Print To" /f >nul 2>&1
  reg add "HKCR\txtfile\shell\printto\command" /ve /t REG_EXPAND_SZ /d "\"%SystemRoot%\System32\NOTEPAD.EXE\" /pt \"%1\" \"%2\" \"%3\" \"%4\"" /f >nul 2>&1

  :: textfile (иногда используется как общий псевдоним)
  reg add "HKCR\textfile\shell\print" /ve /t REG_SZ /d "Print" /f >nul 2>&1
  reg add "HKCR\textfile\shell\print\command" /ve /t REG_EXPAND_SZ /d "\"%SystemRoot%\System32\NOTEPAD.EXE\" /p \"%1\"" /f >nul 2>&1
  reg add "HKCR\textfile\shell\printto" /ve /t REG_SZ /d "Print To" /f >nul 2>&1
  reg add "HKCR\textfile\shell\printto\command" /ve /t REG_EXPAND_SZ /d "\"%SystemRoot%\System32\NOTEPAD.EXE\" /pt \"%1\" \"%2\" \"%3\" \"%4\"" /f >nul 2>&1
)
echo.
echo === Откат завершён. ===
echo Если контекстное меню не обновилось, перезапусти проводник.
choice /C YN /M "Перезапустить explorer.exe сейчас?"
if errorlevel 2 goto :END
  taskkill /f /im explorer.exe >nul 2>&1
  timeout /t 2 >nul
  start explorer.exe
:END
endlocal
reg delete "HKCR\Directory\shell\AddToSystemPath" /f
reg delete "HKCR\Directory\shell\RemoveFromSystemPath" /f
reg delete "HKEY_CLASSES_ROOT\*\shell\TakeOwnership" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shell\TakeOwnership" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\runas" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shell\VisibleControl\Shell\01TakeOwnership" /f
timeout /t 4 >nul
exit /b 0
