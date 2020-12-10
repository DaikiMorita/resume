#!/bin/bash

git add .
git commit -m "修正"
PF=$(cat .credentials | grep PF -2 | tail -n 1)
expect -c "
set timeout 5
spawn git push origin master
expect \"Enter passphrase for key\"
send \"${PF}\n\"
expect \"master -> master\"
exit 0
"
echo "  ____                _     __         _  _          _   _                                 _            _ ";
echo " |  _ \   ___   _ __ | |_  / _|  ___  | |(_)  ___   | | | | _ __    __ _  _ __   __ _   __| |  ___   __| | ";
echo " | |_) | / _ \ | '__|| __|| |_  / _ \ | || | / _ \  | | | || '_ \  / _ || '__| / _ | / _ | / _ \ / _ | | |";
echo " |  __/ | (_) || |   | |_ |  _|| (_) || || || (_) | | |_| || |_) || (_| || |   | (_| || (_| ||  __/| (_| | ";
echo " |_|     \___/ |_|    \__||_|   \___/ |_||_| \___/   \___/ | .__/  \__, ||_|    \__,_| \__,_| \___| \__,_| ";
echo "                                                           |_|     |___/ ";
echo "";
echo https://daikimorita.github.io/resume/;
