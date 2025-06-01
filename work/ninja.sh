#!/bin/sh -e
set -x
version="1.12.1"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/ninja-$version.tar.gz" -C "$TMPDIR"
cd $TMPDIR/ninja-$version
export NINJAJOBS=$(nproc)
sed -i '/int Guess/a \
int
j = 0;\
char* jobs = getenv( "NINJAJOBS" );\
if ( jobs != NULL ) j = atoi( jobs );\
if ( j > 0 ) return j;\
' src/ninja.cc
python3 configure.py --bootstrap --verbose
install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion /usr/share/zsh/site-functions/_ninja
