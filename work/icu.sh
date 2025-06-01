#!/bin/sh -e
set -x
version="76.1"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/icu4c-$(echo "$version" | sed 's/\./_/g')-src.tgz" -C "$TMPDIR"
cd $TMPDIR/icu
case $(uname -m) in
  i?86) sed -e "s/U_PLATFORM_IS_LINUX_BASED/__X86_64__ \&\& &/" \
            -i source/test/intltest/ustrtest.cpp ;;
esac
cd source                 &&
./configure --prefix=/usr &&
make
make install
