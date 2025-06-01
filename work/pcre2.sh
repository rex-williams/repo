#!/bin/sh -e
set -x
version="10.45"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf /sources/pcre2-$version.tar.bz2 -C "$TMPDIR"
cd $TMPDIR/pcre2-$version
./configure --prefix=/usr                       \
            --docdir=/usr/share/doc/pcre2-10.45 \
            --enable-unicode                    \
            --enable-jit                        \
            --enable-pcre2-16                   \
            --enable-pcre2-32                   \
            --enable-pcre2grep-libz             \
            --enable-pcre2grep-libbz2           \
            --enable-pcre2test-libreadline      &&
make
make install
