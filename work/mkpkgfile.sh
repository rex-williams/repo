#!/bin/sh
package="$(echo "$1" | sed 's_.*/__g')"
echo "name='$package'" > Pkgfile
version="$(cat $1/version | cut -d' ' -f1)"
echo "version='$version'" >> Pkgfile
sources="$(cat $1/sources | sed 1q | sed "s/$version/\${version}/g")"
echo "sources=\"$sources\"" >> Pkgfile
if [ -f "$1/depends" ]; then
    depends="$(cat $1/depends | uniq -u | tr '\n' ' ')"
    echo "depends='$depends'" >> Pkgfile
fi
echo 'build() {' >> Pkgfile
cat "$1/build" | sed 's_#!/bin/sh -e__g' | sed 's/$1/$INSTALL/g' >> Pkgfile
echo '}' >> Pkgfile
rm -rfv "$1"
mkdir "$package"
mv Pkgfile "$package"
