#!/bin/sh -e
set -x
version="0.25.5"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/p11-kit-$version.tar.xz" -C "$TMPDIR"
cd $TMPDIR/p11-kit-$version
sed '20,$ d' -i trust/trust-extract-compat &&

cat >> trust/trust-extract-compat << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF
mkdir p11-build &&
cd    p11-build &&

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D trust_paths=/etc/pki/anchors &&
ninja
ninja install &&
ln -sfv /usr/libexec/p11-kit/trust-extract-compat \
        /usr/bin/update-ca-certificates
