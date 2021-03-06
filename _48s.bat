@echo off
rem *** This is based on OnePlus original script to restore Android 4.4.4 version 48s
rem *** irregardless the state the phone is in.  A full wipe and restore
rem ***
echo #########  This patch is Created by ONEPLUS Technical Support.  #######
echo ###### This patch should only be used for ONEPLUS ONE 64GB Global Version. ######
@echo off
rem *** Set location of files
set "loc=d:\_48s\"
dir %loc%file.txt

rem fastboot oem unlock

fastboot erase persist

fastboot flash persist %loc%persist.img

rem ****enabled reserve4 to revert from cm12.1
fastboot erase reserve4
fastboot flash reserve4 %loc%reserve4.img

fastboot flash boot %loc%boot.img

rem *** This is double disabled to prevent accidental delete of data
rem *** remove REM and space in ". img" to activate this line.
rem fastboot flash userdata %loc%userdata_64g. img


fastboot flash system %loc%system.img

rem *** keep using third party recovery
rem fastboot flash recovery %loc%recovery.img
 

fastboot flash cache %loc%cache.img
 

fastboot flash modem %loc%NON-HLOS.bin
 

fastboot flash sbl1 %loc%sbl1.mbn
 

fastboot flash dbi %loc%sdi.mbn


fastboot flash aboot %loc%emmc_appsboot.mbn
 

fastboot flash rpm %loc%rpm.mbn

 
fastboot flash tz %loc%tz.mbn
 

fastboot flash LOGO %loc%logo.bin


rem fastboot oem lock


fastboot reboot 
 
echo It is done Now :) 
 pause
