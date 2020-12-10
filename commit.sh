#!/bin/bash

# >>> conda init >>>
__conda_setup="$(CONDA_REPORT_ERRORS=false '$HOME/anaconda3/bin/conda' shell.bash hook 2>/dev/null)"
if [ $? -eq 0 ]; then
  \eval "$__conda_setup"
else
  if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/anaconda3/etc/profile.d/conda.sh"
    CONDA_CHANGEPS1=false conda activate base
  else
    \export PATH="$PATH:$HOME/anaconda3/bin"
  fi
fi
unset __conda_setup
# <<< conda init <<<

conda activate resume
echo ""
# 更新日を書き換え
DATE=$(python3 replace_date.py)
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
