#!/bin/sh -e
set -x
version="0.21.5"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/libpsl-$version.tar.gz" -C "$TMPDIR"
cd $TMPDIR/libpsl-$version
mkdir build
cd    build

meson setup --prefix=/usr --buildtype=release &&

ninja
ninja install
