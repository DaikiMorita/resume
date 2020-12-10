#!/bin/bash

git add .
git commit -m "修正"
PF=$(cat .credentials | grep PF -2 | tail -n 1)
echo $PF
expect -c "
set timeout 5
spawn git push origin master
expect \"Enter passphrase for key '/Users/daikimorita/.ssh/id_rsa':\"
send \"${PF}\n\"
expect \"master -> master\"
exit 0
"
echo https://daikimorita.github.io/resume/
