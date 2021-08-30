#!/bin/bash
exec >/dev/null # 2>&1
cd chia-blockchain
. ./activate

exec >1
chia version
exec >/dev/null

chia stop -d all
deactivate
git fetch
git checkout latest
git reset --hard FETCH_HEAD --recurse-submodules
sh install.sh
. ./activate
chia init
