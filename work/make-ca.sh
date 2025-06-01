#!/bin/sh -e
set -x
version="1.16"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/make-ca-$version.tar.gz" -C "$TMPDIR"
cd $TMPDIR/make-ca-$version
make install
install -vdm755 /etc/ssl/local
/usr/sbin/make-ca -g
cat > /etc/cron.weekly/update-pki.sh << "EOF" &&
#!/bin/bash
/usr/sbin/make-ca -g
EOF
chmod 754 /etc/cron.weekly/update-pki.sh
