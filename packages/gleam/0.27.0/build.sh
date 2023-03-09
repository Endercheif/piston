#!/usr/bin/env bash

# Install Erlang
source ../../erlang/23.0.0/build.sh

# Install Gleam
curl -L "https://github.com/gleam-lang/gleam/releases/download/v0.27.0/gleam-v0.27.0-x86_64-unknown-linux-musl.tar.gz" --output gleam.tar.gz
mkdir gleam
tar -xf gleam.tar.gz -C gleam