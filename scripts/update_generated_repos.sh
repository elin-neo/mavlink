#!/usr/bin/env bash

# Config for auto-building
git remote rename origin upstream
git config --global user.email "neodrone@neosystems.co.kr"
git config --global user.name "elin-neo"
git config --global credential.helper "store --file=$HOME/.git-credentials"
echo "https://${GH_TOKEN}:@github.com" > "$HOME"/.git-credentials

# Build C library
GEN_START_PATH=$PWD
mkdir -p include/mavlink/v2.0
cd include/mavlink/v2.0
git clone https://github.com/elin-neo/c_library_v2.git
cd ../../..
./scripts/update_c_library.sh 2
