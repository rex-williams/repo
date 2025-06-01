#!/bin/sh -e
set -x
version="1.0.8"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/bzip2-$version.tar.gz" -C "$TMPDIR"
cp -fv "/sources/bzip2-$version-install_docs-1.patch" "$TMPDIR"
cd $TMPDIR/bzip2-$version || exit 1
patch -Np1 -i ../bzip2-$version-install_docs-1.patch
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
make -f Makefile-libbz2_so
make clean
make
make PREFIX=/usr install
cp -av libbz2.so.* /usr/lib
ln -sv libbz2.so.1.0.8 /usr/lib/libbz2.so
cp -v bzip2-shared /usr/bin/bzip2
for i in /usr/bin/{bzcat,bunzip2}; do
  ln -sfv bzip2 $i
done
