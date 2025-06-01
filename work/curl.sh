#!/bin/sh -e
set -x
version="8.13.0"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/curl-$version.tar.xz" -C "$TMPDIR"
cd $TMPDIR/curl-$version
./configure --prefix=/usr    \
            --disable-static \
            --with-openssl   \
            --with-ca-path=/etc/ssl/certs
make
make install
rm -rf docs/examples/.deps
find docs \( -name Makefile\* -o  \
             -name \*.1       -o  \
             -name \*.3       -o  \
             -name CMakeLists.txt \) -delete
cp -v -R docs -T /usr/share/doc/curl-8.14.0
