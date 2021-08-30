#!/bin/bash
exec >/dev/null 2>&1

cd chia-blockchain
. ./activate
ver=$(chia version)
echo "Current version: $ver" >/dev/tty

chia stop -d all
deactivate
git fetch
git checkout latest
git reset --hard FETCH_HEAD --recurse-submodules
sh install.sh
. ./activate
chia init

ver=$(chia version)
echo "Updated to version: $ver" >/dev/tty
