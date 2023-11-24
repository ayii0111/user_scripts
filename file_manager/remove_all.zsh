#! /bin/zsh

# 取得當前目錄名稱
local pp=${$(pwd):t}
cd ..
rm -rf $pp

unset pp
