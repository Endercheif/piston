#!/bin/bash

source ../../haskell/9.0.1/build.sh

curl -L https://downloads.haskell.org/~cabal/cabal-install-3.10.1.0/cabal-install-3.10.1.0-x86_64-linux-deb10.tar.xz -c cabal.tar.xz
tar xvf cabal.tar.xz -C cabal

./cabal/cabal install alex
./cabal/cabal install happy

source ../../emacs/27.1.0/build.sh

./cabal/cabal get Agda-2.6.3

cd Agda-2.6.3
stack --stack-yaml stack-9.0.1.yaml install
