@echo off
color 2
cls
color F2
mode con cols=81
mode con lines=45
echo.
echo    ###########################################################################
echo    ##                                                                       ## 
echo    ##                         iN                iZ                          ## 
echo    ##                          Uo               B                           ## 
echo    ##                           vLioOBBBBBBMqviq                            ##
echo    ##                          vMBBBBBBBBBBBBBBBVi                          ## 
echo    ##                        FBBBBBMOOOOOOOOMBBBBBMi                        ## 
echo    ##                      iBBBB  iBOGGGGGGGBP  oBBBI                       ## 
echo    ##                     iBBMMM  iBOGGGGGGGBk  uBMBBN                      ##
echo    ##                     BBMOOBBBBMOOOOOOOOMBBBBMOMBBv                     ##
echo    ##                    IBBBBBBBBBBBBBBBBBBBBBBBBBBBBB                     ## 
echo    ##                    YNUAAAAAAAAAAAAAAAAAAAAAAAAAVG                     ##
echo    ##              VZPi                                   uZqr              ## 
echo    ##            iBBBBBF qBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  BBBBBM             ## 
echo    ##            XBMOMBM uBMMMMMMMMMMMMMMMMMMMMMMMMMMBB iBBOMBB             ## 
echo    ##            UBOGOBZ JBOGGGGGGGGGGGGGGGGGGGGGGGGOMB iBMGOBB             ## 
echo    ##            uBOGOBE JBOGGGGGGGGGGGGGGGGGGGGGGGGGMB iBMGOBB             ## 
echo    ##            UBOGOBE JBOGGGGGGGGGGGGGGGGGGGGGGGGOMB iBMGOBB             ## 
echo    ##            UBOGOBE JBOGGGGGGGGGGGGGGGGGGGGGGGGOMB iBMGOBB             ## 
echo    ##            uBOGOBE JBOGGGGGGGGGGGGGGGGGGGGGGGGOMB iBMGOBB             ## 
echo    ##            UBOGOBE JBOGGGGGGGGGGGGGGGGGGGGGGGGOMB iBMGOBB             ## 
echo    ##            FBMOOBG JBOGGGGGGGGGGGGGGGGGGGGGGGGOMB iBMOOBB             ## 
echo    ##            uBBBBBM uBOGGGGGGGGGGGGGGGGGGGGGGGGGMB iBBBBBB             ## 
echo    ##             FBBBM  VBOGGGGGGGGGGGGGGGGGGGGGGGGGMB  jBBBBi             ## 
echo    ##                    PBMGGGGGGGGGGGGGGGGGGGGGGGGOBB                     ## 
echo    ##                    XBBBMMOOGGGGOMMMMOOGGGGOMMMBBB                     ##  
echo    ##                     PBBBBBMOGGOBBBBBBMOGGOMBBBBBi                     ## 
echo    ##                          uBOGOBG    rBMGGMB                           ## 
echo    ##                          vBOGOBG    iBMGGBB                           ## 
echo    ##                          uBOGOBM    iBMGGBB                           ## 
echo    ##                          oBMGOBB    iBMGOBB                           ## 
echo    ##                          XBBMBBB    rBBMMBB                           ## 
echo    ##                           BBBBBi     MBBBBj                           ## 
echo    ##                             ii         ii                             ## 
echo    ##                                                                       ## 
echo    ##                                                                       ##
echo    ##                       Aries Toolkit    by linuxx                      ##
echo    ##                                                                       ##
echo    ###########################################################################
ECHO.
pause
color 2
goto :start

#StartUP Page***************************************************************************************************************************


----------------------------------------------------------------------------------------
:start
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo.
echo.
echo ***********************************************
echo.
echo.
echo.
goto :Start2

:Start2
echo Choose What Do you Want to Do
echo.
echo.
echo.
echo 1-Install something
echo 2-Sync
echo 3-Test
echo 4-Backup and Restore
echo.
echo 5-Advanced
echo.
echo.
echo 0-Exit
echo.
set /p S= PLEASE SELECT AN OPTION NOW :
if %S%==1 goto menu1
if %S%==2 goto sync
if %S%==3 goto testnm
if %S%==5 goto advanced
if %S%==4 goto backupc
if %S%==0 goto exit
echo.
echo Invalid Input? Try again!...
pause goto start


#Install***************************************************************************************************************************

:menu1
cls
echo.
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo ************
echo Install Menu
echo ************
echo.
echo.
echo Choose What Do You want to Install
echo.
echo.
echo 1- ClockWork Mod Recovery
echo 2- Custom Rom
echo 3- Gapps/Mod
echo.
echo x- Go Back
echo.
set /p S= PLEASE SELECT AN OPTION NOW :
if %S%==1 goto rec
if %S%==2 goto rmmn
if %S%==3 goto gapps
if %S%==X goto start
echo.
echo Invalid, try again...
pause
goto
menu1

#Install/Rom***************************************************************************************************************************

:rmmn
cls
echo.
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo Chose which rom do you want to install
echo.
echo.
echo 1- Cyanogenmod
echo 3- A Custom Rom Downloaded From internet (Aokp, Aosp, Mokee, WIUI ecc)
echo.
echo X- Back
echo.
set /p S= PLEASE SELECT AN OPTION NOW :
if %S%==1 goto cm
if %S%==2 goto pa
if %S%==3 goto cust
if %S%==X goto menu1
echo.
echo Invalid, try again...
pause
goto
rmmn


:cm
cls
echo.
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo *********************
echo Cyanogenmod Installer
echo *********************
echo.
echo.
pause
echo Let the phone reboot, and say goodbye to Miui!
echo waiting Your Phone...
@adb reboot recovery
echo The  Phone Will Be Rebooted on Recovery Mode
echo.
echo REMEMBER: Use VOl + Key and Vol - Key to select, POWER Button to Confirm
echo Press enter to continue...
pause
echo.
echo Select:Wipe Data / Factory Reset (ONLY if you're changing rom, not an update) , then Install zip from sideload, select system 1 and
echo DON'T TOUCH OR REBOOT OR SHUTDOWN OR UNPLUG YOUR DEVICE!!!! THIS WILL TAKE SOME MINUTES!!!!!!!
echo ONLY whan You're ready, press enter to continue...
pause
adb sideload C:\ariesTool\rom\cm.zip
echo When the recovery will give some Options Like Reboot System Now, Install zip, press enter
pause
echo Enjoy your new Cyaogenmod 10.2 stable on your Mi2(s)
@adb reboot
pause
goto :start

:cust
cls
echo.
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo *********************
echo Custom rom Installer
echo *********************
echo.
echo.
pause
echo Please, Before starting place your rom into C:\ariesTool\Rom\Custom
pause
echo Let the phone reboot, and say goodbye to Miui!
echo waiting Your Phone...
@adb reboot recovery
echo The  Phone Will Be Rebooted on Recovery Mode
echo.
echo REMEMBER: Use VOl + Key and Vol - Key to select, POWER Button to Confirm
echo Press enter to continue...
pause
echo.
echo Select:Wipe Data / Factory Reset (ONLY if you're changing rom, not an update) , then Install zip from sideload, select system 1 and
echo DON'T TOUCH OR REBOOT OR SHUTDOWN OR UNPLUG YOUR DEVICE!!!! THIS WILL TAKE SOME MINUTES!!!!!!!
echo ONLY whan You're ready, press enter to continue...
pause
adb sideload C:\ariesTool\rom\custom\rom.zip
echo ONLY When the recovery will give some Options Like Reboot System Now, Install zip,
pause
echo Enjoy your new custom rom on your Mi2(s)
@adb reboot
pause
goto :start

:rec
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo **********************
echo ClockWorkMod Installer
echo **********************
echo.
echo.
echo Waiting to Device
@adb reboot bootloader
echo Installing The CWM Recovery
@fastboot flash recovery C:\ariesTool\recovery\recovery.img
echo Done!
@fastboot reboot
echo Rebooting...
pause
goto :start

#Test***************************************************************************************************************************

:testmn
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo *********
echo Test Menu
echo *********
echo.
echo.
echo Choose:
echo 1- Test Adb connection
echo 2- Test Fastboot Connection
echo 3- Test Root
echo.
echo X- Go back
echo.
set /p S= PLEASE SELECT AN OPTION NOW :
if %S%==1 goto adbt
if %S%==2 goto fbt
if %S%==3 goto roott
if %S%==X goto start
echo.
echo Invalid, try again...
pause
goto
testmn


:adbt
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo Testing Adb, make sure you have enabled usb debugging and set up drivers.
echo Press ENTER to continue
pause
adb devices
echo if your device appears in the list, adb is working well, so you can use this toolkit
echo if not, google about set up Adb
pause
goto :start

:fbt
cls
goto :start
echo Testing Fastboot, make sure you have set up drivers well.
echo Press ENTER to continue
pause
@adb reboot bootloader
echo Your phone will be rebooted on Fastboot mode
fastboot devices
echo if your device appears in the list, adb is working well, so you can use this toolkit
echo if not, google about set up Fastboot
@fastboot reboot
pause
goto :start

#advanced***************************************************************************************************************************

:advanced
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo.
echo **************
echo Advanced Menu
echo **************
echo.
echo.
echo 1- Run ADB Shell
echo 2- Reboot into...
echo 3- Set Up phone
echo 4- Unbrick (ONLY IF THE PHONE DOESN'T BOOT UP)
echo 5- Edit Partitions
echo.
echo x- Go Back
echo.
set /p S= PLEASE SELECT AN OPTION NOW :
if %S%==1 cls
	  echo ##############################################################
	  echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
	  echo ##############################################################
	  echo.
	  echo.
	  echo.
	  adb shell su
if %S%==2 goto reboot
if %S%==3 goto conr
if %S%==4 goto unbrick
if %S%==5 goto partitions
if %S%==X goto start
echo.
echo Invalid, try again...
pause
goto
advanced


:conr
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo.
echo **********************************
echo Set Up recovery and Phone tutorial
echo **********************************
echo.
echo.
@adb reboot recovery
echo Rebooting recovery
echo.
echo REMEMBER: Use VOl + Key and Vol - Key to select, POWER Button to Confirm
echo.
echo Now Follow This Guide
echo.
echo.
echo move and Select advanced
echo move and Select ENABLE TRUEDUALBOOT
echo confirm everything (you will lose the apps that you have installed)
echo wait
echo done
echo.
echo press BACK key
echo.
echo reboot system
echo.
echo Now Your Phone is factory reset...
echo.
echo GO TO settings>developer Settings> ENABLE Usb debugging
echo.
echo Now You're Ready for a Custom ROM!!!
echo.
echo.
echo Click ENTER ONLY WHEN YOU HAVE DONE ALL THE STEPS!!
pause
goto :start


:reboot
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo.
echo ***************
echo Reboot Options
echo ***************
echo.
echo.
echo 1- Reboot System
echo 2- Reboot Recovery
echo 3- Reboot Bootloader
echo.
set /p S= PLEASE SELECT AN OPTION NOW :
if %S%==1 adb reboot
if %S%==2 adb reboot recovery
if %S%==3 adb reboot bootloader
echo.
echo Invalid, try again...
pause
goto reboot


:partitions
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo.
echo ************************
echo System Partitions Editor
echo ************************
echo.
echo BE CAREFUL
pause
echo 1- Expand systems Partition, decrase Sdcard
echo X- Go back
echo.
set /p S= PLEASE SELECT AN OPTION NOW :
if %S%==1 goto:partitions2
echo.
echo Invalid, try again...
pause
goto partitions


:partitions2
color 42
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo.
echo ************************
echo System Partitions Editor
echo ************************
echo.
echo I disclaim every damage caused using this!
echo Thanks to @M1cha for this
echo Press Enter to continue....
pause
echo ARE YOU SURE?
pause
echo Press ENTER ONLY if you have the backup on your PC!!
pause
echo Sure??? The only way to reverse this is using the unbrick tool!!!
pause
echo Ok last time, you have to be SURE. Press any Key....
pause
echo Let's start.....
adb reboot recovery
echo Press ENTER Ony when phone is in recovery mode
adb push C:\ariesTool\Script\repartition.sh /tmp
adb shell chmod 0777 /tmp/repartition.sh
adb shell /tmp/repartition.sh
echo Done
pause
echo Enable TDB (under advanced) and then Type: continue , I'll take you to Cyanogenmod Setup and install two roms on both system partitions!!!
pause
color 2
goto:cm



:unbrick
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo.
echo *******
echo Unbrick
echo *******
echo.
echo.
echo Shutdown Your Phone if it's not power off yet
echo.
echo Press The VOl - Key and Power keys until The Phone Boot Into Bootloader
echo Ok let's start
pause
C:\ariesTool\script\unb\flash_all_wipe.bat
pause
goto:start

#Sync***************************************************************************************************************************

:sync
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo.
echo ****
echo Sync
echo ****
echo.
echo.
echo 1- Sync Photos
echo 2- Sync Music
echo.
echo X- Go back
echo.
set /p S= PLEASE SELECT AN OPTION NOW :
if %S%==1 goto adb pull /sdcard/DCIM/Camera/* C:\ariesTool\PhonePhotos
if %S%==2 goto adb pull /sdcard/*.mp4 C:\ariesTool\PhoneMusic
if %S%==X goto start
echo.
echo Invalid, try again...
pause
goto
sync

#Backup

:backupc
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo.
echo.
echo.
echo **************
echo Backup Restore
echo **************
echo.
echo.
echo 1- Create Backup
echo 2- Restore Backup
echo.
echo X- Go back
echo.
set /p S= PLEASE SELECT AN OPTION NOW :
if %S%==1 goto backup
if %S%==2 goto restore
if %S%==X goto start
echo.
echo Invalid, try again...
pause
goto
sync



:backup
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
ECHO.
ECHO.
SET /P BUN= NAME OF YOUR BACKUP (WITHOUT ANY SPACE) :
PAUSE
adb backup -apk -all -system -f C:\ariesTool\backup\%BUN%.ab
ECHO.
echo set your password (on phone) and remeber it!!
echo Then wait until it work
pause
goto start

:restore
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
ECHO.
ECHO.
SET /P BUN= NAME OF YOUR BACKUP (WITHOUT ANY SPACE) :
PAUSE
adb restore C:\ariesTool\backup\%BUN%.ab
echo restoring backup, this will take some time.... Wait please
pause
goto start

#Other********************************************************************************************************************
:record
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
ECHO.
ECHO.
adb wait-for-device
@adb root
@adb remount
echo To stop the video press CTRL+C
adb shell screenrecord --bit-rate 8000000 /tmp/adb.mp4
@adb pull /sdcard/adb.mp4 C:\Adbtool\
SET /P BUN= NAME FOR YOUR VIDEO (WITHOUT ANY SPACE) :
@rename C:\ariesTool\adb.mp4 C:\ariesTool\%BUN%.mp4
@adb shell rm /sdcard/adb.mp4
pause
exit






#Exit***************************************************************************************************************************


:exit
cls
echo ##############################################################
echo #ARIES ToolKit --- Running on: Windows --- By Linuxx         #
echo ##############################################################
echo Click Enter
pause
exit
