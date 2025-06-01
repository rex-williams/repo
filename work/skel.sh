#!/bin/sh -e
set -x
version="##########"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/###########-$version.tar.##########" -C "$TMPDIR"
cd $TMPDIR/##########-$version
