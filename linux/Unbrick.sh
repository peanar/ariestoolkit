#Credit to Xiaomi
#
fastboot $* getvar soc-id 2>&1 | grep "^soc-id: *109$"
if [ $? -ne 0 ] ; then echo "Missmatching image and device"; exit 1; fi
fastboot $* flash tz `dirname $0`/images/tz.mbn
fastboot $* flash sbl1 `dirname $0`/images/sbl1.mbn
fastboot $* flash sbl2 `dirname $0`/images/sbl2.mbn
fastboot $* flash sbl3 `dirname $0`/images/sbl3.mbn
fastboot $* flash rpm `dirname $0`/images/rpm.mbn
fastboot $* flash aboot `dirname $0`/images/emmc_appsboot.mbn
fastboot $* erase boot
fastboot $* flash misc `dirname $0`/images/misc.img
fastboot $* flash modem+modem1 `dirname $0`/images/NON-HLOS.bin
fastboot $* flash system+system1 `dirname $0`/images/system.img
fastboot $* flash cache `dirname $0`/images/cache.img
fastboot $* flash userdata `dirname $0`/images/userdata.img
fastboot $* flash storage `dirname $0`/images/storage.img
fastboot $* flash recovery `dirname $0`/images/recovery.img
fastboot $* flash boot+boot1 `dirname $0`/images/boot.img
fastboot $* reboot
