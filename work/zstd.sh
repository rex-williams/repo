#!/bin/sh -e
set -x
version="1.5.7"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/zstd-$version.tar.gz" -C "$TMPDIR"
cd $TMPDIR/zstd-$version
make prefix=/usr
make check
make prefix=/usr install
