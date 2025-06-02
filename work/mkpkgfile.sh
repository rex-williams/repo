#!/bin/sh
package="$(echo "$1" | sed 's_.*/__g')"
mkdir $package
echo "name='$package'" > $package/Pkgfile
version="$(cat $1/version | cut -d' ' -f1)"
echo "version='$version'" >> $package/Pkgfile
sources="$(cat $1/sources | sed 1q | sed "s/$version/\${version}/g")"
echo "sources=\"$sources\"" >> $package/Pkgfile
if [ -f "$1/depends" ]; then
    depends="$(cat $1/depends | uniq -u | tr '\n' ' ')"
    echo "depends='$depends'" >> $package/Pkgfile
fi
echo 'build() {' >> $package/Pkgfile
cat "$1/build" | sed 's_#!/bin/sh -e__g' | sed 's/$1/$INSTALL/g' >> $package/Pkgfile
echo '}' >> $package/Pkgfile
rm -rfv "$1"
