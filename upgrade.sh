#!/bin/bash

conda activate resume
echo ""
# 更新日を書き換え
DATE=$(/Users/daikimorita/opt/anaconda3/bin/python pyscript/replace_date.py)
figlet -f standard $DATE

echo ""
figlet -f standard "Updated  Files"
echo ""
echo ""
echo ""
git diff --name-only
echo ""

git add .
git commit -m "修正" >/dev/null

PF=$(cat .credentials | grep PF -2 | tail -n 1)
expect -c "
set timeout 5
spawn git push origin master
expect \"Enter passphrase for key\"
send \"${PF}\n\"
expect \"master -> master\"
exit 0
" >/dev/null

echo ""
figlet -f standard "Portfolio Upgraded"
echo ""
echo ""
echo "Go to Github Pages >> https://daikimorita.github.io/resume"
echo ""
echo ""

conda deactivate
