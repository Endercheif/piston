#!/bin/bash

source ../../haskell/9.0.1/build.sh

export PATH=~/.cabal/bin:$PATH

cabal install alex
cabal install happy

source ../../emacs/27.1.0/build.sh

cabal get Agda-2.6.3
cd Agda-2.6.3
stack --stack-yaml stack-9.0.1.yaml install
