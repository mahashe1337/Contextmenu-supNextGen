@echo off
fltmc >nul 2>&1 || (powershell -NoProfile -WindowStyle Hidden -Command "Start-Process -Verb RunAs -FilePath \"$env:ComSpec\" -ArgumentList '/c \"\"%~f0\" \"%~1\"\"'" & exit /b)
cls
:Action
echo **********************************************************************************
echo 01 REMOVE "print" and "printto" for common text-based files and internet shortcuts
echo **********************************************************************************
reg delete "HKCR\Applications\photoviewer.dll\shell\print" /f >NUL 2>&1
reg delete "HKCR\batfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\cmdfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\contact_wab_auto_file\shell\print" /f >NUL 2>&1
reg delete "HKCR\docxfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\docxfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\emffile\shell\print" /f >NUL 2>&1
reg delete "HKCR\emffile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\FaxCover.Document\shell\print" /f >NUL 2>&1
reg delete "HKCR\fonfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\giffile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\group_wab_auto_file\shell\print" /f >NUL 2>&1
reg delete "HKCR\htmlfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\htmlfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\IE.AssocFile.HTM\shell\print" /f >NUL 2>&1
reg delete "HKCR\IE.AssocFile.HTM\shell\printto" /f >NUL 2>&1
reg delete "HKCR\IE.AssocFile.SVG\shell\print" /f >NUL 2>&1
reg delete "HKCR\IE.AssocFile.SVG\shell\printto" /f >NUL 2>&1
reg delete "HKCR\IE.AssocFile.URL\shell\print" /f >NUL 2>&1
reg delete "HKCR\IE.AssocFile.URL\shell\printto" /f >NUL 2>&1
reg delete "HKCR\IE.AssocFile.XHT\shell\print" /f >NUL 2>&1
reg delete "HKCR\IE.AssocFile.XHT\shell\printto" /f >NUL 2>&1
reg delete "HKCR\inffile\shell\print" /f >NUL 2>&1
reg delete "HKCR\inifile\shell\print" /f >NUL 2>&1
reg delete "HKCR\InternetShortcut\shell\print" /f >NUL 2>&1
reg delete "HKCR\InternetShortcut\shell\printto" /f >NUL 2>&1
reg delete "HKCR\jpegfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\JSEFile\shell\Print" /f >NUL 2>&1
reg delete "HKCR\JSFile\shell\Print" /f >NUL 2>&1
reg delete "HKCR\odtfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\odtfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\opensearchresult\shell\print" /f >NUL 2>&1
reg delete "HKCR\otffile\shell\print" /f >NUL 2>&1
reg delete "HKCR\Paint.Picture\shell\printto" /f >NUL 2>&1
reg delete "HKCR\PBrush\shell\print" /f >NUL 2>&1
reg delete "HKCR\PBrush\shell\printto" /f >NUL 2>&1
reg delete "HKCR\pfmfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\pjpegfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\pngfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\regfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\rlefile\shell\print" /f >NUL 2>&1
reg delete "HKCR\rlefile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\rtffile\shell\print" /f >NUL 2>&1
reg delete "HKCR\rtffile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\svgfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\svgfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\image\shell\print" /f >NUL 2>&1
reg delete "HKCR\textfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\textfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\TIFImage.Document\shell\printto" /f >NUL 2>&1
reg delete "HKCR\ttcfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\ttffile\shell\print" /f >NUL 2>&1
reg delete "HKCR\txtfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\txtfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\VBEFile\shell\Print" /f >NUL 2>&1
reg delete "HKCR\VBSFile\shell\Print" /f >NUL 2>&1
reg delete "HKCR\wdpfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\wdpfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\wmffile\shell\print" /f >NUL 2>&1
reg delete "HKCR\wmffile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\Wordpad.Document.1\shell\print" /f >NUL 2>&1
reg delete "HKCR\Wordpad.Document.1\shell\printto" /f >NUL 2>&1
reg delete "HKCR\WSFFile\shell\Print" /f >NUL 2>&1
reg delete "HKCR\xhtmlfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\xhtmlfile\shell\printto" /f >NUL 2>&1
reg delete "HKCR\zapfile\shell\print" /f >NUL 2>&1
reg delete "HKCR\zapfile\shell\printto" /f >NUL 2>&1
echo ***********************************
echo 02 REMOVE 3D Edit from Context Menu
echo ***********************************
reg delete "HKCR\SystemFileAssociations\.3mf\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.bmp\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.fbx\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.gif\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.glb\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jfif\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpe\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpeg\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpg\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.obj\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.ply\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.png\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.stl\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tif\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tiff\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.3mf\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.bmp\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.fbx\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.gif\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.glb\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.jfif\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.jpe\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.jpeg\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.jpg\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.obj\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.ply\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.png\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.stl\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.tif\shell\3D Edit" /f >NUL 2>&1
reg delete "HKCR\.tiff\shell\3D Edit" /f >NUL 2>&1
echo ************************************
echo 03 REMOVE 3D Print from Context Menu
echo ************************************
reg delete "HKCR\SystemFileAssociations\.3ds\shell\3D Print" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.3mf\shell\3D Print" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.dae\shell\3D Print" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.dxf\shell\3D Print" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.obj\shell\3D Print" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.ply\shell\3D Print" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.stl\shell\3D Print" /f >NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.wrl\shell\3D Print" /f >NUL 2>&1
REM Добавляет хендлер "Расположение библиотеки" в контекст папок (классический проводник/библиотеки)
reg add "HKCR\Folder\shellex\ContextMenuHandlers\Library Location" /ve /t REG_SZ /d "?{3dad6c5d-2167-4cae-9914-f99e41c12cfa}" /f >NUL 2>&1

REM ВКЛЮЧЕНИЕ хука копирования (CopyHook) для <Общий доступ/Sharing> на директориях (нужно для корректной интеграции диалогов)
REM ВАЖНО: это не удаление! Это подключение системного хэндлера, не трогаем вкладку <Доступ>
reg add "HKCR\Directory\shellex\CopyHookHandlers\Sharing" /ve /t REG_SZ /d "?{40dd6e20-7c17-11ce-a804-00aa003ca9f6}" /f >NUL 2>&1

REM Подключение <Offline Files> (Автономные файлы) к меню и свойствам для CLSID <Мои документы>/директорий/папок
reg add "HKCR\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "?{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f >NUL 2>&1
reg add "HKCR\Directory\shellex\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "?{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f >NUL 2>&1
reg add "HKCR\Folder\shellex\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "?{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f >NUL 2>&1

REM <Play To> (DLNA/проигрывание на устройства) для стэков и множества типов файлов (аудио/видео/изображения)
reg add "HKCR\Stack.Audio\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\Stack.Image\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\Stack.Video\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1


reg add "HKCR\SystemFileAssociations\.3g2\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.3gp\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.3gp2\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.3gpp\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.aac\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.adt\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.adts\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.dtcp-ip\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.flac\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.lpcm\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.m2t\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.m2ts\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.m4a\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.m4v\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.mk3d\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.mka\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.mkv\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.mov\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.mp4\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.mp4v\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.mts\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.ts\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.tts\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1
reg add "HKCR\SystemFileAssociations\.wtv\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >NUL 2>&1

reg add "HKCR\SystemFileAssociations\audio\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f
reg add "HKCR\SystemFileAssociations\Directory.Audio\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f
reg add "HKCR\SystemFileAssociations\Directory.Image\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f
reg add "HKCR\SystemFileAssociations\Directory.Video\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f
reg add "HKCR\SystemFileAssociations\image\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f
reg add "HKCR\SystemFileAssociations\video\shellex\ContextMenuHandlers\PlayTo" /ve /t REG_SZ /d "?{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f
REM Вкладка свойств <Offline Files> (PropertySheetHandlers) для директорий/папок
reg add "HKCR\Directory\shellex\PropertySheetHandlers\Offline Files" /ve /t REG_SZ /d "?{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f >NUL 2>&1
reg add "HKCR\Folder\shellex\PropertySheetHandlers\Offline Files" /ve /t REG_SZ /d "?{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f >NUL 2>&1

REM Пункты <Open With EncryptionMenu> (EFS), <ModernSharing>, <WorkFolders> - системные расширения
reg add "HKCR\*\shellex\ContextMenuHandlers\Open With EncryptionMenu" /ve /t REG_SZ /d "?{A470F8CF-A1E8-4f65-8335-227475AA5C46}" /f >NUL 2>&1
reg add "HKCR\Directory\shellex\ContextMenuHandlers\EncryptionMenu" /ve /t REG_SZ /d "?{A470F8CF-A1E8-4f65-8335-227475AA5C46}" /f >NUL 2>&1
reg add "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /ve /t REG_SZ /d "?{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /f >NUL 2>&1
reg add "HKCR\*\shellex\ContextMenuHandlers\WorkFolders" /ve /t REG_SZ /d "?{E61BF828-5E63-4287-BEF1-60B1A4FDE0E3}" /f >NUL 2>&1
reg add "HKCR\Directory\background\shellex\ContextMenuHandlers\WorkFolders" /ve /t REG_SZ /d "?{E61BF828-5E63-4287-BEF1-60B1A4FDE0E3}" /f >NUL 2>&1
reg add "HKCR\Directory\shellex\ContextMenuHandlers\WorkFolders" /ve /t REG_SZ /d "?{E61BF828-5E63-4287-BEF1-60B1A4FDE0E3}" /f >NUL 2>&1

reg add "HKCR\*\shellex\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "?{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >NUL 2>&1
reg add "HKCR\Directory\background\shellex\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "?{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >NUL 2>&1
reg add "HKCR\Directory\shellex\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "?{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >NUL 2>&1
reg add "HKCR\Directory\shellex\PropertySheetHandlers\Sharing" /ve /t REG_SZ /d "?{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >NUL 2>&1
reg add "HKCR\Drive\shellex\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "?{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >NUL 2>&1
reg add "HKCR\Drive\shellex\PropertySheetHandlers\Sharing" /ve /t REG_SZ /d "?{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >NUL 2>&1
reg add "HKCR\LibraryFolder\background\shellex\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "?{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >NUL 2>&1
reg add "HKCR\UserLibraryFolder\shellex\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "?{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >NUL 2>&1

REM Совместимость: пункт <Средство устранения проблем совместимости> для bat/cmd/exe/msi/msilink
reg add "HKCR\batfile\shellex\ContextMenuHandlers\Compatibility" /ve /t REG_SZ /d "?{1d27f844-3a1f-4410-85ac-14651078412d}" /f >NUL 2>&1
reg add "HKCR\cmdfile\shellex\ContextMenuHandlers\Compatibility" /ve /t REG_SZ /d "?{1d27f844-3a1f-4410-85ac-14651078412d}" /f >NUL 2>&1
reg add "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" /ve /t REG_SZ /d "?{1d27f844-3a1f-4410-85ac-14651078412d}" /f >NUL 2>&1
reg add "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" /ve /t REG_SZ /d "?{1d27f844-3a1f-4410-85ac-14651078412d}" /f >NUL 2>&1
reg add "HKCR\MSILink\shellex\ContextMenuHandlers" /ve /t REG_SZ /d "?{1d27f844-3a1f-4410-85ac-14651078412d}" /f >NUL 2>&1
echo 04b Rename keys
REM ===========================
REM Очистка/переименование некоторых старых/лишних хендлеров (НЕ Sharing!)
REM Удаляются offline files/сетевые и прочие GUID, НЕТ GUID {f81e9010-...}
REM ===========================
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f >NUL 2>&1
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >NUL 2>&1
reg delete "HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >NUL 2>&1
reg delete "HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f >NUL 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >NUL 2>&1
reg delete "HKCR\Directory\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >NUL 2>&1
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >NUL 2>&1
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\{D6791A63-E7E2-4fee-BF52-5DED8E86E9B8}" /f >NUL 2>&1
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\{fbeb8a05-beee-4442-804e-409d6c4515e9}" /f >NUL 2>&1
reg delete "HKCR\MSILink\shellex\ContextMenuHandlers\{1d27f844-3a1f-4410-85ac-14651078412d}" /f >NUL 2>&1

echo Rename shell (создаёт <заглушки> с префиксом ? - трюки для приоритетов/сокрытия дублей; Sharing не затрагиваем)
reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\?{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f >NUL 2>&1
reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\?{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >NUL 2>&1
reg add "HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\?{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >NUL 2>&1
reg add "HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\?{7EFA68C6-086B-43e1-A2D2-55A113531240}" /f >NUL 2>&1
reg add "HKCR\Directory\shellex\ContextMenuHandlers\?{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >NUL 2>&1
reg add "HKCR\Directory\shellex\PropertySheetHandlers\?{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >NUL 2>&1
reg add "HKCR\Drive\shellex\ContextMenuHandlers\?{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >NUL 2>&1
reg add "HKCR\Drive\shellex\ContextMenuHandlers\?{D6791A63-E7E2-4fee-BF52-5DED8E86E9B8}" /f >NUL 2>&1
reg add "HKCR\Drive\shellex\ContextMenuHandlers\?{fbeb8a05-beee-4442-804e-409d6c4515e9}" /f >NUL 2>&1
reg add "HKCR\MSILink\shellex\ContextMenuHandlers\?{1d27f844-3a1f-4410-85ac-14651078412d}" /f >NUL 2>&1

REM ===========================
REM ИТОГ:
REM - Sharing (вкладка <Доступ>) НЕ удаляется и остаётся активной.
REM - Подключены Play To, Offline Files, WorkFolders, EFS, ModernSharing.
REM - <Очистка> не трогает GUID Sharing {f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}.
REM ===========================

echo ***************************************
echo 07 ADD Restart Explorer to Context Menu
echo ***************************************

	reg delete "HKCR\Directory\background\shell\01_RestartExplorerNow" /f >NUL 2>&1
	reg delete "HKCR\Directory\background\shell\02_RestartExplorerOnDemand" /f >NUL 2>&1
	
		reg add "HKCR\Directory\background\shell\RestartExplorer" /v "Icon" /t REG_SZ /d "%SystemRoot%\explorer.exe,0" /f >NUL 2>&1
	    reg add "HKCR\Directory\background\shell\RestartExplorer" /v "MUIVerb" /t REG_SZ /d "Проводник" /f >NUL 2>&1
	    reg add "HKCR\Directory\background\shell\RestartExplorer" /v "Position" /t REG_SZ /d "Bottom" /f >NUL 2>&1
	    reg add "HKCR\Directory\background\shell\RestartExplorer" /v "SeparatorAfter" /t REG_DWORD /d "1" /f >NUL 2>&1
	    reg add "HKCR\Directory\background\shell\RestartExplorer" /v "SubCommands" /t REG_SZ /d "" /f >NUL 2>&1
	
		reg add "HKCR\Directory\background\shell\RestartExplorer\shell\01_RestartExplorerNow" /v "icon" /t REG_SZ /d "imageres.dll,147" /f >NUL 2>&1
		reg add "HKCR\Directory\background\shell\RestartExplorer\shell\01_RestartExplorerNow" /v "MUIVerb" /t REG_SZ /d "Перезапуск проводника Сейчас" /f >NUL 2>&1
		::reg add "HKCR\Directory\background\shell\RestartExplorer\shell\01_RestartExplorerNow" /v "Position" /t REG_SZ /d "Bottom" /f >NUL 2>&1
		reg add "HKCR\Directory\background\shell\RestartExplorer\shell\01_RestartExplorerNow" /v "SeparatorBefore" /t REG_DWORD /d "1" /f >NUL 2>&1
		reg add "HKCR\Directory\background\shell\RestartExplorer\shell\01_RestartExplorerNow\command" /ve /t REG_EXPAND_SZ /d "cmd.exe /c taskkill /f /im explorer.exe  & start explorer.exe" /f >NUL 2>&1
		
		reg add "HKCR\Directory\background\shell\RestartExplorer\shell\02_RestartExplorerOnDemand" /v "CommandFlags" /t REG_DWORD /d "32" /f >NUL 2>&1
		reg add "HKCR\Directory\background\shell\RestartExplorer\shell\02_RestartExplorerOnDemand" /v "icon" /t REG_SZ /d "timedate.cpl,0" /f >NUL 2>&1
		reg add "HKCR\Directory\background\shell\RestartExplorer\shell\02_RestartExplorerOnDemand" /v "MUIVerb" /t REG_SZ /d "Перезапуск проводника по требованию" /f >NUL 2>&1
		::reg add "HKCR\Directory\background\shell\RestartExplorer\shell\02_RestartExplorerOnDemand" /v "Position" /t REG_SZ /d "Bottom" /f >NUL 2>&1
		reg add "HKCR\Directory\background\shell\RestartExplorer\shell\02_RestartExplorerOnDemand" /v "SeparatorAfter" /t REG_DWORD /d "1" /f >NUL 2>&1
		reg add "HKCR\Directory\background\shell\RestartExplorer\shell\02_RestartExplorerOnDemand\command" /ve /t REG_EXPAND_SZ /d "cmd.exe /c @echo off & taskkill /f /im explorer.exe & echo: & echo Press any key to restart explorer.exe process...& pause >NUL && start explorer.exe && exit/b" /f >NUL 2>&1
		
	::reg delete "HKCR\Directory\background\shell\01_RestartExplorerNow" /f >NUL 2>&1
	::reg delete "HKCR\Directory\background\shell\02_RestartExplorerOnDemand" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\01_RestartExplorerNow" /v "icon" /t REG_SZ /d "imageres.dll,84" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\01_RestartExplorerNow" /v "MUIVerb" /t REG_SZ /d "Перезапуск проводника Сейчас" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\01_RestartExplorerNow" /v "Position" /t REG_SZ /d "Bottom" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\01_RestartExplorerNow" /v "SeparatorBefore" /t REG_DWORD /d "1" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\01_RestartExplorerNow\command" /ve /t REG_EXPAND_SZ /d "cmd.exe /c taskkill /f /im explorer.exe  & start explorer.exe" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\02_RestartExplorerOnDemand" /v "CommandFlags" /t REG_DWORD /d "32" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\02_RestartExplorerOnDemand" /v "icon" /t REG_SZ /d "imageres.dll,84" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\02_RestartExplorerOnDemand" /v "MUIVerb" /t REG_SZ /d "Перезапуск проводника по требованию" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\02_RestartExplorerOnDemand" /v "Position" /t REG_SZ /d "Bottom" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\02_RestartExplorerOnDemand" /v "SeparatorAfter" /t REG_DWORD /d "1" /f >NUL 2>&1
	::	reg add "HKCR\Directory\background\shell\02_RestartExplorerOnDemand\command" /ve /t REG_EXPAND_SZ /d "cmd.exe /c @echo off & taskkill /f /im explorer.exe & echo: & echo Press any key to restart explorer.exe process...& pause >NUL && start explorer.exe && exit/b" /f >NUL 2>&1

:Task_08
echo **************************************************
echo 08 ADD SnippingTool and ScreenSnip to Context Menu
echo **************************************************
:Silent_Task_08
	set NirCmdFolder=%~dp0_Source\NirCmd
	reg delete "HKCR\Directory\background\shell\SnippingTools" /f >NUL 2>&1
	
	
	reg add "HKCR\Directory\background\shell\SnippingTools" /v "Icon" /t REG_SZ /d "SnippingTool.exe" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools" /v "MUIVerb" /t REG_SZ /d "Snipping Tools" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools" /v "Position" /t REG_SZ /d "Bottom" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools" /v "SeparatorAfter" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools" /v "SubCommands" /t REG_SZ /d "" /f >NUL 2>&1
	
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\01_ScreenSnip_Enhanced" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\shell32.dll,259" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\01_ScreenSnip_Enhanced" /v "MUIVerb" /t REG_SZ /d "ScreenSnip" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\SnippingTools\shell\01_ScreenSnip_Enhanced" /v "Position" /t REG_SZ /d "Bottom" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\01_ScreenSnip_Enhanced\command" /ve /t REG_SZ /d "\"%NirCmdFolder%\nircmd.exe\" exec hide \"%~dp0_Source\Scripts\ScreenSnip\ScreenSnipEnhanced.bat\"" /f >NUL 2>&1
	
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\02_ScreenSnip_ActiveWindow" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\shell32.dll,259" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\02_ScreenSnip_ActiveWindow" /ve /t REG_SZ /d "ScreenSnip - активное окно (задержка 2 с)" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\02_ScreenSnip_ActiveWindow\command" /ve /t REG_SZ /d "\"%NirCmdFolder%\nircmd.exe\" exec hide \"%~dp0_Source\Scripts\ScreenSnip\ScreenSnipActiveWindow.bat\"" /f >NUL 2>&1
	
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\03_SnippingTool" /v "MUIVerb" /t REG_SZ /d "@SnippingTool.exe,-101" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\03_SnippingTool" /v "Icon" /t REG_SZ /d "SnippingTool.exe" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\03_SnippingTool" /v "CommandFlags" /t REG_DWORD /d "32" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\03_SnippingTool\Command" /ve /t REG_SZ /d "SnippingTool.exe" /f >NUL 2>&1
	
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\04_ScreenSnip_Fullscreen" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\shell32.dll,259" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\04_ScreenSnip_Fullscreen" /ve /t REG_SZ /d "ScreenSnip - Экран" /f >NUL 2>&1
	reg add "HKCR\Directory\background\shell\SnippingTools\shell\04_ScreenSnip_Fullscreen\command" /ve /t REG_SZ /d "\"%NirCmdFolder%\nircmd.exe\" exec hide \"%~dp0_Source\Scripts\ScreenSnip\ScreenSnipFullScreen.bat\"" /f >NUL 2>&1
	
	
	::reg delete "HKCR\Directory\background\shell\03_ScreenSnip_Enhanced" /f >NUL 2>&1
	::reg delete "HKCR\Directory\background\shell\04_SnippingTools" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\03_ScreenSnip_Enhanced" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\shell32.dll,259" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\03_ScreenSnip_Enhanced" /v "MUIVerb" /t REG_SZ /d "ScreenSnip" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\03_ScreenSnip_Enhanced" /v "Position" /t REG_SZ /d "Bottom" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\03_ScreenSnip_Enhanced\command" /ve /t REG_SZ /d "\"%NirCmdFolder%\nircmd.exe\" exec hide \"%~dp0Scripts\ScreenSnip\ScreenSnipEnhanced.bat\"" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools" /v "Icon" /t REG_SZ /d "SnippingTool.exe" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools" /v "MUIVerb" /t REG_SZ /d "Snipping Tools" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools" /v "Position" /t REG_SZ /d "Bottom" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools" /v "SeparatorAfter" /t REG_DWORD /d "1" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools" /v "SubCommands" /t REG_SZ /d "" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools\shell\01_ScreenSnip_ActiveWindow" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\shell32.dll,259" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools\shell\01_ScreenSnip_ActiveWindow" /ve /t REG_SZ /d "ScreenSnip - активное окно (задержка 2 с)" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools\shell\01_ScreenSnip_ActiveWindow\command" /ve /t REG_SZ /d "\"%NirCmdFolder%\nircmd.exe\" exec hide \"%~dp0Scripts\ScreenSnip\ScreenSnipActiveWindow.bat\"" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools\shell\02_ScreenSnip_Fullscreen" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\shell32.dll,259" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools\shell\02_ScreenSnip_Fullscreen" /ve /t REG_SZ /d "ScreenSnip - Экран" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools\shell\02_ScreenSnip_Fullscreen\command" /ve /t REG_SZ /d "\"%NirCmdFolder%\nircmd.exe\" exec hide \"%~dp0Scripts\ScreenSnip\ScreenSnipFullScreen.bat\"" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools\shell\03_SnippingTool" /v "MUIVerb" /t REG_SZ /d "@SnippingTool.exe,-101" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools\shell\03_SnippingTool" /v "Icon" /t REG_SZ /d "SnippingTool.exe" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools\shell\03_SnippingTool" /v "CommandFlags" /t REG_DWORD /d "32" /f >NUL 2>&1
	::reg add "HKCR\Directory\background\shell\04_SnippingTools\shell\03_SnippingTool\Command" /ve /t REG_SZ /d "SnippingTool.exe" /f >NUL 2>&1

echo *****************************************************
echo 10 ADD Install CAB Update Context Menu for .cab files
echo *****************************************************
	reg delete "HKCR\CABFolder" /f >NUL 2>&1
	reg delete "HKCR\SystemFileAssociations\.cab" /f >NUL 2>&1
	reg add "HKCR\CABFolder\Shell\RunAs" /ve /t REG_SZ /d "Установить CAB обновление" /f >NUL 2>&1
	reg add "HKCR\CABFolder\Shell\RunAs" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
	reg add "HKCR\CABFolder\Shell\RunAs\Command" /ve /t REG_SZ /d "cmd /k dism /online /add-package /packagepath:\"%%1\"" /f >NUL 2>&1
	reg add "HKCR\SystemFileAssociations\.cab\Shell\RunAs" /ve /t REG_SZ /d "Установить CAB обновление" /f >NUL 2>&1
	reg add "HKCR\SystemFileAssociations\.cab\Shell\RunAs" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
	reg add "HKCR\SystemFileAssociations\.cab\Shell\RunAs\Command" /ve /t REG_SZ /d "cmd /k dism /online /add-package /packagepath:\"%%1\"" /f >NUL 2>&1

:Install_Settings
setlocal
set "NSudoFolder=%~dp0_Source\Nsudo"
set "NirCmdFolder=%~dp0_Source\NirCmd"
set "SetACLFolder=%~dp0_Source\SetACL"
set "PATHTOOLS_DIR=%~dp0_Source\Scripts\Path"
set "BASE=%~dp0_Source\"
set "VisibleControlBASE=%~dp0_Source\Scripts\VisibleControl\"
set "pathman=%~dp0_Source\Scripts\pathman.exe"

if not exist "%PATHTOOLS_DIR%" md "%PATHTOOLS_DIR%"
	attrib +h "%NSudoFolder%\Images" >NUL 2>&1
	attrib +h "%NSudoFolder%\NSudo.visualelementsmanifest.xml" >NUL 2>&1
	echo Setting Start Menu tiles and shortcuts
	
:CONTEXTMENU
	<nul set /p dummyName=Setting Context Menu and CommandStore...
:: Better command for "Open Commmand window here (administrator)" (with NSudoG)
	set "target=%NSudoFolder%"
	set "target=%target:\=\\%\\NSudoG.exe"
:: ADD NSudo to .exe file shell
	reg add "HKCR\exefile\shell\NSudo" /v "SubCommands" /t REG_SZ /d "NSudo.RunAs.TrustedInstaller;NSudo.RunAs.TrustedInstaller.EnableAllPrivileges;NSudo.RunAs.System;NSudo.RunAs.System.EnableAllPrivileges;" /f >NUL 2>&1
	reg add "HKCR\exefile\shell\NSudo" /v "MUIVerb" /t REG_SZ /d "NSudo" /f >NUL 2>&1
	reg add "HKCR\exefile\shell\NSudo" /v "Icon" /t REG_SZ /d "\"%NSudoFolder%\NSudo.exe\"" /f >NUL 2>&1
	reg add "HKCR\exefile\shell\NSudo" /v "Position" /t REG_SZ /d "1" /f >NUL 2>&1
	reg add "HKCR\batfile\shell\NSudo" /v "SubCommands" /t REG_SZ /d "NSudo.RunAs.TrustedInstaller;NSudo.RunAs.TrustedInstaller.EnableAllPrivileges;NSudo.RunAs.System;NSudo.RunAs.System.EnableAllPrivileges;" /f >NUL 2>&1
	reg add "HKCR\batfile\shell\NSudo" /v "MUIVerb" /t REG_SZ /d "NSudo" /f >NUL 2>&1
	reg add "HKCR\batfile\shell\NSudo" /v "Icon" /t REG_SZ /d "\"%NSudoFolder%\NSudo.exe\"" /f >NUL 2>&1
	reg add "HKCR\batfile\shell\NSudo" /v "Position" /t REG_SZ /d "1" /f >NUL 2>&1
	reg add "HKCR\cmdfile\shell\NSudo" /v "SubCommands" /t REG_SZ /d "NSudo.RunAs.TrustedInstaller;NSudo.RunAs.TrustedInstaller.EnableAllPrivileges;NSudo.RunAs.System;NSudo.RunAs.System.EnableAllPrivileges;" /f >NUL 2>&1
	reg add "HKCR\cmdfile\shell\NSudo" /v "MUIVerb" /t REG_SZ /d "NSudo" /f >NUL 2>&1
	reg add "HKCR\cmdfile\shell\NSudo" /v "Icon" /t REG_SZ /d "\"%NSudoFolder%\NSudo.exe\"" /f >NUL 2>&1
	reg add "HKCR\cmdfile\shell\NSudo" /v "Position" /t REG_SZ /d "1" /f >NUL 2>&1
:: CommandStore
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.System" /ve /t REG_SZ /d "Запуск от системы" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.System" /ve /t REG_SZ /d "Запуск от системы" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.System" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.System\command" /ve /t REG_SZ /d "\"%NSudoFolder%\NSudo.exe\" -U:S -ShowWindowMode=Hide cmd /c start \"NSudo.ContextMenu.Launcher\" \"%%1\"" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.System.EnableAllPrivileges" /ve /t REG_SZ /d "Запустить от системы (Включить Все привелегии)" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.System.EnableAllPrivileges" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.System.EnableAllPrivileges\command" /ve /t REG_SZ /d "\"%NSudoFolder%\NSudo.exe\" -U:S -P:E -ShowWindowMode=Hide cmd /c start \"NSudo.ContextMenu.Launcher\" \"%%1\"" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.TrustedInstaller" /ve /t REG_SZ /d "Запустить от TrustedInstaller" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.TrustedInstaller" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.TrustedInstaller\command" /ve /t REG_SZ /d "\"%NSudoFolder%\NSudo.exe\" -U:T -ShowWindowMode=Hide cmd /c start \"NSudo.ContextMenu.Launcher\" \"%%1\"" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.TrustedInstaller.EnableAllPrivileges" /ve /t REG_SZ /d "Запустить от TrustedInstaller (Включить Все привелегии)" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.TrustedInstaller.EnableAllPrivileges" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\NSudo.RunAs.TrustedInstaller.EnableAllPrivileges\command" /ve /t REG_SZ /d "\"%NSudoFolder%\NSudo.exe\" -U:T -P:E -ShowWindowMode=Hide cmd /c start \"NSudo.ContextMenu.Launcher\" \"%%1\"" /f >NUL 2>&1
:PATHMAN_TASK
:: Finally, add Nsudo SetACL and NirCmd to Environment Variables PATH
	<nul set /p dummyName=Adding Nsudo SetACL and NirCmd to Environment Variables Path...
	set PowerShellPath=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
	%PowerShellPath% -NoProfile -ExecutionPolicy Bypass -File "%PATHTOOLS_DIR%\Pather.ps1" -newPath "%NSudoFolder%"
	%PowerShellPath% -NoProfile -ExecutionPolicy Bypass -File "%PATHTOOLS_DIR%\Pather.ps1" -newPath "%NirCmdFolder%"
	%PowerShellPath% -NoProfile -ExecutionPolicy Bypass -File "%PATHTOOLS_DIR%\Pather.ps1" -newPath "%SetACLFolder%"
	:: Оригинальный код
	::"%pathman%" /as "%NSudoFolder%"
	::"%pathman%" /as "%NirCmdFolder%"
	::"%pathman%" /as "%SetACLFolder%"
	echo Done.
	timeout /t 2 >nul
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::

reg add "HKCR\*\shell\FileControl" /v "SubCommands" /t REG_SZ /d "mahashe.context.VisibleControl;mahashe.context.TakeOwnerShip;mahashe.context.RunHide;mahashe.context.BlockProcess;mahashe.context.unBlockProcess;" /f >NUL 2>&1
reg add "HKCR\*\shell\FileControl" /v "MUIVerb" /t REG_SZ /d "Управление файлами" /f >NUL 2>&1
reg add "HKCR\*\shell\FileControl" /v "Icon" /t REG_SZ /d "\"%NSudoFolder%\images\NSudo.ico\"" /f >NUL 2>&1
reg add "HKCR\*\shell\FileControl" /v "Position" /t REG_SZ /d "1" /f >NUL 2>&1

:: === ФАЙЛЫ ===
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.VisibleControl" /v "SubCommands" /t REG_SZ /d "mahashe.context.unhide;mahashe.context.hide;" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.VisibleControl" /v "MUIVerb" /t REG_SZ /d "Контроль отображения" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.VisibleControl" /v "Icon" /t REG_SZ /d "\"%NSudoFolder%\images\visible.ico\"" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.VisibleControl" /v "Position" /t REG_SZ /d "1" /f >NUL 2>&1

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.hide" /ve /t REG_SZ /d "Сделать неотображаемым" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.hide" /ve /t REG_SZ /d "Сделать неотображаемым" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.hide" /v "Icon" /t REG_SZ /d "\"%NSudoFolder%\images\not_visible.ico\"" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.hide" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.hide\command" /ve /t REG_SZ /d "\"%VisibleControlBASE%hide.bat\" \"%%1\"" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unhide" /ve /t REG_SZ /d "Сделать отображаемым" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unhide" /ve /t REG_SZ /d "Сделать отображаемым" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unhide" /v "Icon" /t REG_SZ /d "\"%NSudoFolder%\images\visible.ico\"" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unhide" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unhide\command" /ve /t REG_SZ /d "\"%VisibleControlBASE%unhide.bat\" \"%%1\"" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.RunHide" /ve /t REG_SZ /d "Запустить скрыто" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.RunHide" /ve /t REG_SZ /d "Запустить скрыто" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.RunHide" /v Icon /t REG_SZ /d "%BASE%MHS.exe,0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.RunHide" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.RunHide\command" /ve /t REG_SZ /d "\"%BASE%run_mhs.bat\" \"%%1\"" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.BlockProcess" /ve /t REG_SZ /d "Заблокировать запуск" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.BlockProcess" /ve /t REG_SZ /d "Заблокировать запуск" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.BlockProcess" /v Icon /t REG_SZ /d "shell32.dll,311" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.BlockProcess" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.BlockProcess\command" /ve /t REG_SZ /d "\"%BASE%Scripts\Block_IFEO\BlockProcess.bat\" \"%%1\"" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unBlockProcess" /ve /t REG_SZ /d "Разблокировать запуск" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unBlockProcess" /ve /t REG_SZ /d "Разблокировать запуск" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unBlockProcess" /v Icon /t REG_SZ /d "shell32.dll,302" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unBlockProcess" /v "HasLUAShield" /t REG_SZ /d "" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.unBlockProcess\command" /ve /t REG_SZ /d "\"%BASE%Scripts\Block_IFEO\UnblockProcess.bat\" \"%%1\"" /f

:: === ПАПКИ ===
REM ===== PATH Tools: пункты контекстного меню папок =====
reg add "HKCR\Directory\shell\VisibleControl" /v MUIVerb /t REG_SZ /d "Управление папками" /f
reg add "HKCR\Directory\shell\VisibleControl" /v Icon /t REG_SZ /d "%SystemRoot%\system32\imageres.dll,-5302" /f
reg add "HKCR\Directory\shell\VisibleControl" /v SubCommands /t REG_SZ /d "" /f

reg add "HKCR\Directory\shell\VisibleControl\Shell\02SysPath" /v MUIVerb /t REG_SZ /d "Path Функции" /f
reg add "HKCR\Directory\shell\VisibleControl\Shell\02SysPath" /v Icon /t REG_SZ /d "%SystemRoot%\system32\imageres.dll,298" /f
reg add "HKCR\Directory\shell\VisibleControl\Shell\02SysPath" /v SubCommands /t REG_SZ /d "" /f

reg add "HKCR\Directory\shell\VisibleControl\Shell\02SysPath\Shell\01AddToSystemPath" /ve /t REG_SZ /d "Добавить в PATH" /f
reg add "HKCR\Directory\shell\VisibleControl\Shell\02SysPath\Shell\01AddToSystemPath" /v "Icon" /t REG_SZ /d "shell32.dll,262" /f
reg add "HKCR\Directory\shell\VisibleControl\Shell\02SysPath\Shell\01AddToSystemPath\command" /ve /t REG_SZ /d "\"%PATHTOOLS_DIR%\AddToSystemPath.bat\" \"%%1\"" /f

reg add "HKCR\Directory\shell\VisibleControl\Shell\02SysPath\Shell\02RemoveFromSystemPath" /ve /t REG_SZ /d "Удалить из PATH" /f
reg add "HKCR\Directory\shell\VisibleControl\Shell\02SysPath\Shell\02RemoveFromSystemPath" /v "Icon" /t REG_SZ /d "shell32.dll,131" /f
reg add "HKCR\Directory\shell\VisibleControl\Shell\02SysPath\Shell\02RemoveFromSystemPath\command" /ve /t REG_SZ /d "\"%PATHTOOLS_DIR%\RemoveFromSystemPath.bat\" \"%%1\"" /f


reg add "HKCR\Directory\shell\VisibleControl\shell\03UnhideFolder" /v MUIVerb /t REG_SZ /d "Показать папку" /f
reg add "HKCR\Directory\shell\VisibleControl\shell\03UnhideFolder" /v Icon /t REG_SZ /d "%SystemRoot%\system32\imageres.dll,-5303" /f
reg add "HKCR\Directory\shell\VisibleControl\shell\03UnhideFolder\command" /ve /t REG_SZ /d "\"%VisibleControlBASE%unhide.bat\" \"%%1\"" /f

reg add "HKCR\Directory\shell\VisibleControl\shell\04HideFolder" /v MUIVerb /t REG_SZ /d "Скрыть папку" /f
reg add "HKCR\Directory\shell\VisibleControl\shell\04HideFolder" /v Icon /t REG_SZ /d "%SystemRoot%\system32\imageres.dll,-5302" /f
reg add "HKCR\Directory\shell\VisibleControl\shell\04HideFolder\command" /ve /t REG_SZ /d "\"%VisibleControlBASE%hide.bat\" \"%%1\"" /f

regedit -s "%~dp0Take_Ownership_to_context_menu.reg"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\mahashe.context.TakeOwnerShip" /f /ve /t REG_SZ /d "Получить доступ"
reg add "HKEY_CLASSES_ROOT\Directory\shell\VisibleControl\Shell\01TakeOwnership" /f /ve /t REG_SZ /d "Получить доступ"
reg add "HKEY_CLASSES_ROOT\Drive\shell\runas" /f /ve /t REG_SZ /d "Сменить права"

:End
echo Готово.
msg * Done. Перезапусти explorer, если что-то не появилось сразу.
timeout /t 3 >nul