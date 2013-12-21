@echo off
cls
color 2
echo Welcome To The Aries Toolkit Installer
pause
echo Preparing your pc....
@mkdir C:\ariesTool
@mkdir C:\ariesTool\backup
@mkdir C:\ariesTool\Rom
@mkdir C:\ariesTool\Recovery
@mkdir C:\ariestool\Rom\Custom
@mkdir C:\ariesTool\Rom\Mod
@mkdir C:\ariesTool\PhonePhotos
@mkdir C:\ariesTool\PhoneMusic
@mkdir %APPDATA%\Roaming\Microsoft\Windows\Start Menu\Programs\ariesTool
echo Extracting Files
@copy *.exe C:\ariesTool\
@copy *.dll C:\ariesTool\
@copy recovery\recovery.img C:\ariesTool\Recovery\
@copy rom\*.zip C:\ariesTool\Rom\
@copy script C:\ariesTool\
@erase C:\ariesTool\installer.exe
echo Done! Starting AriesToolkit!
pause
C:\ariesTool\Start.exe
cls
color 42
echo If you see this message, please download again ariestoolkit, or make sure you have placed all the files in the same directory....
pause
exit
