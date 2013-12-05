#!/bin/bash

#   Copyright 2013 Joey Rizzoli
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.







#Install #General***************************************************************************************************************************


inst () {
printHeader
echo "-> Aries Installer"
echo " "
echo " "
echo "Choose What Do You want to Install:"
echo " "
echo " "
echo "1- Custom Rom"
echo "2- ClockWorkMod Recovery"
echo "3- Install/Update Gapps"
echo " "
echo " "
echo "x- Go Back"
echo " "
read -p "?" Choice
if [ "$Choice" = "1" ]
  then
    rms
    break
elif [ "$Choice" = "2" ]
  then
    cwm
    break
elif [ "$Choice" = "3" ]
  then
    gapps
    break
elif [ "$Choice" = "00" ]
  then
    unb
    break
elif [ "$Choice" = "x" ]
  then
    startselect
    break
else
echo "Wrong input"
fi
}



rms () {
printHeader
echo "---> Rom Selector"
echo " "
echo " "
echo "Chose which rom do you want to install"
echo " "
echo " "
echo "1- Cyanogenmod"
echo "2- A Custom Rom Downloaded From internet"
echo " "
echo "x- Go Back"
echo " "
read -p "?" Choice
if [ "$Choice" = "1" ]
  then
    cmi
    break
elif [ "$Choice" = "2" ]
  then
    crs
    break
elif [ "$Choice" = "x" ]
  then
    inst
    break
else
echo "Wrong input"
fi
}



cmi () {
printHeader
echo "----> Cyanogenmod Installer"
echo " "
echo " "
read -p "Press enter to start!" cont
echo "Let the phone reboot, and say goodbye to Miui!"
echo "waiting Your Phone"
echo "Done! Starting System..."
sudo adb reboot recovery
echo "The  Phone Will Be Rebooted on Recovery Mode"
echo " "
echo "REMEMBER: Use VOl + Key and Vol - Key to select, POWER Button to Confirm"
read -p "Press enter to continue..." cont
read -p " "
echo "Select: install zip from sideload, select system 1 and"
echo "DON'T TOUCH OR REBOOT OR SHUTDOWN OR UNPLUG YOUR DEVICE!!!! THIS WILL TAKE SOME MINUTES!!!!!!!"
read -p "ONLY whan You're ready, press enter to continue..." cont
sudo adb sideload ~/ariesTool/rom/cm.zip
echo "When the recovery will give some Options Like Reboot System Now, Install zip .... and type"
read -p "ok"
read -p "?" Choice
if [ "$Choice" = "ok" ]
  then
    finish
    break
else
echo "Wrong input"
fi
}



crs () {
printHeader
echo "----> Custom Rom Installer"
echo " "
echo " "
echo "FOLLLOW THIS GUIDE CAREFULLY"
echo " "
rm ~/ariesTool/rom/custom/*
echo "open File, Finder or another Filemanager"
echo " "
echo "move yourself into ~/ariesTool/rom/custom/"
echo " "
echo "paste here your rom"
read -p "Press Enter To start"
echo " "
sudo mv ~/ariesTool/rom/custom/*.zip ~/ariesTool/rom/custom/rom.zip
read -p "Press enter to start!" cont
echo "Let the phone reboot, and say goodbye to Miui!"
echo "waiting Your Phone"
echo "Done! Starting System..."
sudo adb reboot recovery
echo "The  Phone Will Be Rebooted on Recovery Mode"
echo " "
echo "REMEMBER: Use VOl + Key and Vol - Key to select, POWER Button to Confirm"
read -p "Press enter to continue..." cont
read -p " "
read -p "Select: install zip from sideload, select system 1 and Press ENTER ONLY WHEN YOU'RE READY"
echo "DON'T TOUCH OR REBOOT OR SHUTDOWN OR UNPLUG YOUR DEVICE!!!! THIS WILL TAKE SOME MINUTES!!!!!!!"
sudo adb sideload ~/ariesTool/rom/custom/rom.zip
echo "When the recovery will give some Options Like Reboot System Now, Install zip .... and type"
echo "ok"
read -p "?" Choice
if [ "$Choice" = "ok" ]
  then
    finish
    break
else
echo "Wrong input"
fi
}



cwm () {
printHeader
echo "----> ClockWorkMod Installer"
echo " "
echo " "
sudo adb reboot bootloader
echo "Installing The CWM Recovery"
sudo fastboot flash recovery ~/ariesTool/recovery/recovery.img
read -p "Rebooting......."
sudo fastboot reboot
read -p"Done"
startselect
}


gapps () {
printHeader
echo "----> Mod Installer"
echo " "
echo " "
rm ~/ariesTool/rom/mod/*.zip
echo "Copy Your zip file into ~/ariesTool/Rom/Mod/ "
read -p "Press enter When You're ready"
mv ~/ariesTool/rom/mod/*.zip ~/ariesTool/rom/mod/mod.zip
sudo adb reboot recovery
echo "Go to INSTALL ZIP FROM SIDELOAD and select the system partition do you want (if you don't know wich, select system1)"
read -p "Press ENTER ONLY when you're ready"
sudo adb sideload ~/ariesTool/rom/mod/mod.zip
read -p "Press Enter ONLY the phone say DONE or it shows menus like reboot, install ecc"
sudo adb reboot
read -p "Done! If you have Bootloop isuues, go to advanced options and reboot recovery and wipe /data of the sysem partition you're trying to boot"
startselect
}


#Test***************************************************************************************************************************

testmn () {
printHeader
echo "-> Test Menu"
echo " "
echo " "
echo "Choose:"
echo "1- Test Adb connection"
echo "2- Test Fastboot Connection"
echo "3- Test Root"
echo " "
echo "x- Go Back"
echo " "
read -p "?" Choice
if [ "$Choice" = "1" ]
  then
    adbt
    break
elif [ "$Choice" = "2" ]
  then
    fbt
    break
elif [ "$Choice" = "3" ]
  then
    roott
    break
elif [ "$Choice" = "x" ]
  then
    startselect
    break
else
echo "Wrong input"
fi
}

adbt () {
printHeader
echo "---> Test Adb"
echo " "
echo " "
read -p "Press enter to continue..." cont
sudo adb devices
read -p "If you see a device listed Adb is running well. Press Enter to end test."
startselect
}

fbt () {
printHeader
echo "---> Test Fastboot"
echo " "
echo " "
read -p "Press enter to continue..." cont
sudo adb reboot bootloader
sudo fastboot devices
sudo fastboot reboot
read -p "Done! Press ENTER to end test."
startselect
}

roott () {
printHeader
echo "--->Root Test"
echo " "
echo " "
echo "please Confirm ROOT acces When The phone Ask it."
read -p "Press enter to continue..." cont
adb shell su
adb shell exit
adb shell exit
read -p "Done! Press enter to end test"
startselect
}






#Exit***************************************************************************************************************************

finish () {
printHeader
echo "Now The Phone Will Reboot, For The First Time it will take about 2 minutes."
read -p "Done, press enter. I hope You Will Enjoy Your New Amazing Phone!!!"
sudo adb reboot
wait 5
startselect
}



Exit () {
printHeader
read -p "press Enter"
exit
clear
}




#Unbrick***************************************************************************************************************************


unb () {
printHeader
echo "-Unbrick"
echo " "
echo " "
echo " "
echo " "
echo "Shutdown Your Phone if it's not power off yet"
echo " "
echo " "
echo " "
echo "Ok, Now let's unbrick phone..."
sudo sh ~/ariesTool/Script/unbrick/flash_all_wipe.sh
}






# /***Sync***/***************************************************************************************************************************

syncmenu () {
printHeader
echo "Sync Menu"
echo " "
echo " "
echo "1- Sync Photos"
echo "2- Sync Music"
echo " "
echo "x- Go Back"
echo " "
read -p "?" Choice
if [ "$Choice" = "2" ]
  then
    music
    break
elif [ "$Choice" = "1" ]
  then
    photos
    break
elif [ "$Choice" = "x" ]
  then
    startselect
    break
else
echo "Wrong input"
fi
}

photos () {
printHeader
echo "Sync Photos"
echo " "
echo " "
echo "Syncing Photos From Your Phone"
read -p "press Enter"
mkdir ~/PhonePhotos
adb pull /sdcard/DCIM/Camera/ ~/PhonePhotos/
read -p "press Enter"
startselect
}

music () {
printHeader
echo "Music Sync"
echo " "
echo " "
echo "Syncing Photos From Your Phone"
read -p "press Enter"
mkdir ~/PhoneMusic
adb pull /sdcard/music/ ~/PhoneMusic
read -p "press Enter"
startselect
}








# /*** Setup ***/#***************************************************************************************************************************

conr () {
printHeader
echo "Phone Setup"
echo " "
echo " "
echo "Downloading AriesToolkit on your phone...."
echo "if you get any error above, copy the file called file.apk wich is ini your home directory on your phone and install it"
echo "Open Aries Toolkit Setup App and Follows the instructions"
read -p "After thet press Enter"
sudo adb reboot recovery
echo "Rebooting recovery"
echo " "
echo "REMEMBER: Use VOl + Key and Vol - Key to select, POWER Button to Confirm"
echo " "
echo "Now Follow This Guide"
echo " "
echo " "
echo "move and Select advanced"
echo "move and Select ENABLE TRUEDUALBOOT"
echo "confirm everything"
echo "wait"
echo "done"
echo " "
echo "press BACK key"
echo " "
echo "Select reboot system"
echo " "
echo "Now Your Phone is factory reset..."
echo " "
read -p "Press enter to reboot into system ONLY you've done all!!"
read -p " "
sudo adb reboot
echo "GO TO settings>developer Settings> ENABLE Usb debugging"
echo " "
echo "Now You're Ready for a Custom ROM!!!"
read -p "press Enter"
read -p " "
echo " "
echo " "
startselect
}
#ADVANCED MENU**************************************************************************************************************************

advanced () {
clear
printHeader
echo "Advanced Menu For Aries Tookit"
echo " "
echo " "
echo "Choose What Do you Want to Do"
echo " "
echo " "
echo "1- Run Adb Shell"
echo "2- Reboot into...."
echo "3- UnBrick Your Phone (Use this ONLY if the phone doesn't boot up)"
echo "4- Edit Partitions"
echo " "
echo "x- Go Back"
echo " "
read -p "?" Choice
if [ "$Choice" = "2" ]
  then
    reboot
    break
elif [ "$Choice" = "1" ]
  then
    shell
    break
elif [ "$Choice" = "3" ]
  then
    unb
    break
elif [ "$Choice" = "4" ]
  then
    partitionsM
    break
elif [ "$Choice" = "x" ]
  then
    startselect
    break
else
echo "Wrong input"
fi
} 

reboot () {
clear
printHeader
echo "Reboot options"
echo " "
echo " "
echo "1- Reboot system"
echo "2- Reboot recovery"
echo "3- Reboot bootloader"
echo " "
echo "x- Go Back"
echo " "
read -p "?" Choice
if [ "$Choice" = "2" ]
  then
    sudo adb reboot recovery
    startselect
    break
elif [ "$Choice" = "1" ]
  then
    sudo adb reboot
    startselect
    break
elif [ "$Choice" = "3" ]
  then
    sudo adb reboot bootloader
    startselect
    break
elif [ "$Choice" = "x" ]
  then
    advanced
    break
else
echo "Wrong input"
fi
}

shell () {
clear
printHeader
echo " "
echo "Starting Adb shell as root..."
echo "...."
sudo adb start-server
sudo adb root
sudo adb remount
sudo adb shell
}

partitionsM () {
clear
printHeader
echo "Patitions Editor"
echo " "
echo " "
echo "WARNING! THIS MAY ERASE YOUR DATA AND MEDIA, USE THE BACKUP OPTION BEFORE PROCEED AND SAVE YOUR SDCARD CONTENT ON YOUR PC"
read -p "Are you sure to continue? (y/n)" Choice
if [ "$Choice" = "y" ]
  then
    partitions1
    break
else
echo "Going back..."
wait 3
fi
}

partitions1 () {
clear
printHeader
echo "Patitions Editor"
echo " "
echo " "
echo "1- Expand Systems Partitions, this will decrase your Sd card Size"
echo "THIS WILL DISABLE TDB, And ERASE ALL YOUR DATA AND SYSTEM PARTITIONS!!! YOU WILL NEED TO FLASH A ROM AFTER THIS BECAUSE THE PHONE WON'T BOOT UP!!!!!!!"
echo " "
echo "x -Go back"
read -p "?" Choice
if [ "$Choice" = "1" ]
  then
    partition2
    break
elif [ "$Choice" = "x" ]
  then
    advanced
    break
else
echo "Wrong input"
fi
}


partition2 () {
echo "I disclaim every damage caused using this!"
echo "Thanks to @M1cha for this"
read -p "Press Enter to continue...."
read -p "ARE YOU SURE?"
read -p "Press ENTER ONLY if you have the backup on your PC!!"
read -p "Sure??? The only way to reverse this is using the unbrick tool!!!"
read -p "Ok last time, you have to be SURE. Press any Key...."
echo "Let's start"
sudo adb push ~/ariesTool/Script/repartition.sh /tmp
sudo adb shell chmod 0777 /tmp/repartition.sh
sudo adb shell /tmp/repartition.sh
echo "Please Wait Until it Works...."
echo "Press ANY key ONLY IT SAID DONE!!!!!"
echo "When it say Done, enable TDB and then Type: continue , I'll take you to Cyanogenmod Setup"
 read -p "?" Choice
if [ "$Choice" = "continue" ]
  then
    cmi
    break
else
echo "Wrong input, type: continue"
fi
}


#backup
bacres () {
printHeader
echo "Backup and Restore Center:"
echo " "
echo " "
echo "1- Backup"
echo "2- Restore"
if [ "$Choice" = "2" ]
  then
    backup
    break
elif [ "$Choice" = "1" ]
  then
    restore
    break
else
echo "Wrong input"
fi
}

#backup
backup () {
printHeader
echo "Backup:"
echo " "
echo " "
echo "Enter a Number (0->9) for your backup"
echo " "
echo "x- Go Back"
read -p "?" Choice
if [ "$Choice" = "2" ]
  then
    adb backup -apk -all -system -f ~/ariesTool/backup/2.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "1" ]
  then
    adb backup -apk -all -system -f ~/ariesTool/backup/1.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "3" ]
  then
    adb backup -apk -all -system -f ~/ariesTool/backup/3.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "4" ]
  then
    adb backup -apk -all -system -f ~/ariesTool/backup/4.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "5" ]
  then
    adb backup -apk -all -system -f ~/ariesTool/backup/5.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "6" ]
  then
    adb backup -apk -all -system -f ~/ariesTool/backup/6.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "7" ]
  then
    adb backup -apk -all -system -f ~/ariesTool/backup/7.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "8" ]
  then
    adb backup -apk -all -system -f ~/ariesTool/backup/8.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "0" ]
  then
    adb backup -apk -all -system -f ~/ariesTool/backup/0.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "9" ]
  then
    adb backup -apk -all -system -f ~/ariesTool/backup/9.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "x" ]
  then
    bacres
    break
else
echo "Wrong input"
fi
}

restore () {
printHeader
echo "Restore:"
echo " "
echo " "
echo "Enter a Number (0->9) for your backup"
echo " "
echo "x- Go Back"
read -p "?" Choice
if [ "$Choice" = "2" ]
  then
    adb restore ~/ariesTool/backup/2.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "1" ]
  then
    adb restore ~/ariesTool/backup/1.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "3" ]
  then
    adb restore ~/ariesTool/backup/3.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "4" ]
  then
    adb restore ~/ariesTool/backup/4.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "5" ]
  then
    adb restore ~/ariesTool/backup/5.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "6" ]
  then
    adb restore ~/ariesTool/backup/6.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "7" ]
  then
    adb restore ~/ariesTool/backup/7.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "8" ]
  then
    adb restore ~/ariesTool/backup/8.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "0" ]
  then
    adb restore ~/ariesTool/backup/0.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "9" ]
  then
    adb restore ~/ariesTool/backup/9.ab
    echo "select your Password, remeber it and wait..."
    break
elif [ "$Choice" = "x" ]
  then
    backres
    break
else
echo "Wrong input"
fi
backup
}

# /*** Home ***/ #***************************************************************************************************************************

printHeader () {
  clear
  echo "********************************************************************************"
  echo "*    Aries Toolkit --- Build 8.1 --- OpenSource Pc Manager for Xiaomi mi2(s)   *"
  echo "********************************************************************************"
}

startselect () {
printHeader
echo "Choose What Do you Want to Do:"
echo " "
echo " "
echo "1- Installer"
echo "2- Sync"
echo "3- Test"
echo "4- Backup and Restore"
echo "5- Advanced"
echo " "
echo " "
echo "0- Exit"
read -p "?" Choice
if [ "$Choice" = "2" ]
  then
    syncmenu
    break
elif [ "$Choice" = "1" ]
  then
    inst
    break
elif [ "$Choice" = "3" ]
  then
    testmn
    break
elif [ "$Choice" = "4" ]
  then
    bacres
    break
elif [ "$Choice" = "5" ]
  then
    advanced
    break
elif [ "$Choice" = "0" ]
  then
    Exit
    break
elif [ "$Choice" = "make me a sandwich" ]
  then
    read -p "Do it yourself:" Choice
    if [ "$Choice" = "sudo make me a sandwich" ]
      then
       read -p "Ok, you will find one @ bar.."
       printheader
    break
    else
    echo "Wrong input"
    fi
else
echo "Wrong input"
fi
startselect
}

# /*** home ***/

printHeader
startselect

