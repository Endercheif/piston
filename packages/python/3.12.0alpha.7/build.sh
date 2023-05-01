#!/bin/bash

PREFIX=$(realpath $(dirname $0))

mkdir -p build

cd build

curl -o python.zip -L https://github.com/JelleZijlstra/cpython/archive/refs/heads/tvobject.zip
unzip python.zip
rm python.zip
cd cpython-tvobject

./configure --prefix "$PREFIX" --with-ensurepip=install
make -j$(nproc)
make install -j$(nproc)

cd ../..

rm -rf build

# bin/pip3 install numpy scipy pandas pycrypto whoosh bcrypt passlib sympy
