#!/bin/bash

git add .
git commit -m "修正"
git push origin master

PF=$(cat .credentials | grep ^# -2 | tail -n 1)
expect -c "
set timeout 5
spawn git push origin master
expect \"Enter passphrase for key '/Users/daikimorita/.ssh/id_rsa':\"
send \"${PF}\n\"
"