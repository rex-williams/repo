#!/bin/sh -e
set -x
version="3.4.1"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/openssl-$version.tar.gz" -C "$TMPDIR"
cd $TMPDIR/openssl-$version
./config --prefix=/usr \
    --openssldir=/etc/ssl \
    --libdir=lib \
    shared \
    zlib-dynamic
make
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install
cp -vfr doc/* /usr/share/doc/openssl-3.4.1
