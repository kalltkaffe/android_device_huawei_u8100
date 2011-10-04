#!/bin/sh
# Extract prebuilt libraries (from a working device) needed for the U8100

mkdir -p ../../../vendor/huawei/u8100/proprietary

FILES="
bin/akmd2
bin/modempre
bin/oem_rpc_svc
bin/qmuxd
bin/rild
bin/hci_qcomm_init

lib/hw/gralloc.msm7k.so
lib/hw/sensors.default.so

lib/libaudioeq.so
lib/libcamera.so
lib/libcm.so
lib/libdiag.so
lib/libdll.so
lib/libdsm.so
lib/libdss.so
lib/libgsdi_exp.so
lib/libgstk_exp.so
lib/libhwrpc.so
lib/libmm-adspsvc.so
lib/libmmgsdilib.so
lib/libmmipl.so
lib/libmmjpeg.so
lib/libmm-omxcore.so
lib/libmmprocess.so
lib/libnv.so
lib/liboem_rapi.so
lib/libomx_aacdec_sharedlibrary.so
lib/libomx_amrdec_sharedlibrary.so
lib/libomx_amrenc_sharedlibrary.so
lib/libomx_avcdec_sharedlibrary.so
lib/libomx_m4vdec_sharedlibrary.so
lib/libomx_mp3dec_sharedlibrary.so
lib/libomx_sharedlibrary.so
lib/libomx_sharedlibrary_qc.so
lib/libOmxH264Dec.so
lib/libOmxMpeg4Dec.so
lib/libOmxVidEnc.so
lib/libOmxWmvDec.so
lib/liboncrpc.so
lib/libpbmlib.so
lib/libqcamera.so
lib/libqmi.so
lib/libqueue.so
lib/libril.so
lib/libril-qc-1.so
lib/libril-qcril-hook-oem.so
lib/libwms.so
lib/libwmsts.so

etc/init.qcom.bt.sh
"

for FILE in $FILES; do
    adb pull system/$FILE ../../../vendor/huawei/u8100/proprietary/
done

chmod 755 ../../../vendor/huawei/u8100/proprietary/akmd2
chmod 755 ../../../vendor/huawei/u8100/proprietary/modempre
chmod 755 ../../../vendor/huawei/u8100/proprietary/oem_rpc_svc
chmod 755 ../../../vendor/huawei/u8100/proprietary/qmuxd
chmod 755 ../../../vendor/huawei/u8100/proprietary/rild
chmod 755 ../../../vendor/huawei/u8100/proprietary/hci_qcomm_init
