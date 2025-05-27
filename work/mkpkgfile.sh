#!/bin/sh
package="$(echo "$1" | sed 's_.*/__g')"
echo "name='$package'" > $package.pkg
version="$(cat $1/version | cut -d' ' -f1)"
echo "version='$version'" >> $package.pkg
sources="$(cat $1/sources | sed 1q | sed "s/$version/\${version}/g")"
echo "sources=\"$sources\"" >> $package.pkg
if [ -f "$1/depends" ]; then
    depends="$(cat $1/depends | uniq -u | tr '\n' ' ')"
    echo "depends='$depends'" >> $package.pkg
fi
echo 'build() {' >> $package.pkg
cat "$1/build" | sed 's_#!/bin/sh -e__g' | sed 's/$1/$INSTALL/g' >> $package.pkg
echo '}' >> $package.pkg
rm -rfv "$1"
