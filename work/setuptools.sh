#!/bin/sh -e
set -x
version="75.8.1"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/setuptools-$version.tar.gz" -C "$TMPDIR"
cd $TMPDIR/setuptools-$version
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist setuptools
