#! /bin/sh

tmp_pwd=`pwd`
cd /Applications/Momentics.app && source bbndk-env_10_3_1_995.sh && cd $tmp_pwd

QNX_BINS="${QNX_HOST}/usr/bin"

MAKEFLAGS="-I$QNX_TARGET/usr/include"
PATH="$QNX_HOST/usr/bin:$QNX_CONFIGURATION/bin:$BASE_DIR/features/$LATEST_MAC_JRE/jre/Contents/Home/bin:$QNX_HOST/usr/python32/bin:$PATH"
LDFLAGS="-Vgcc_ntoarmv7le -L${QNX_TARGET}/armle-v7/usr/lib -L${QNX_TARGET}/armle-v7/lib -shared"
AR="ntoarmv7-ar"
CPPFLAGS="-D__QNXNTO__ "
CFLAGS="-Vgcc_ntoarmv7le -I${QNX_TARGET}/usr/include -lm"
CC="qcc"
CXX="qcc"
export PATH MAKEFLAGS LDFLAGS AR CC CXX CFLAGS
./configure RANLIB="ntoarmv7-ranlib" AR="ntoarmv7-ar" \
            OS=qnx6 --host=armv7 --enable-shared=no

# change HAVE_EVENTFD to 0 on ./config.h
make
