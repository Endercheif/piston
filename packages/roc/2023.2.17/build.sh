#!/bin/bash

# Install Zig
mkdir -p bin
cd bin/

curl -L "https://ziglang.org/download/0.9.1/zig-linux-x86_64-0.9.1.tar.xz" -o zig.tar.xz
tar xf zig.tar.xz --strip-components=1
rm zig.tar.xz

cd ../

# Add zig to PATH
export PATH=$PWD/bin:$PATH

apt-get update
apt-get install lsb-release wget software-properties-common gnupg -y

# Install llvm
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
./llvm.sh 13

export LLVM_SYS_130_PREFIX=$(llvm-config --obj-root)

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Build roc
git clone https://github.com/roc-lang/roc
cd roc
git reset --hard 5285884830877d32c3ff0ab2fc452048b15d2e5c

cargo build --release --locked
cp target/release/roc bin/roc
