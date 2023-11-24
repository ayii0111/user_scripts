#! /bin/zsh

# 別名 vbcp
# vbcp 檔名
# 快速將 node_modules 中的 bootstrap 的個別檔案複製過來

local main_scss="./src/assets/scss/main.scss"
local dir_scss="./src/assets/scss/"
local boots_scss="./node_modules/bootstrap/scss/"


if [[ ! -e $dir_scss ]] {
  mkdir -p "$dir_scss"
}

cp -r $boots_scss\_$1\.scss $dir_scss
gsed -i "/\/$1\"/ s|.*|@import \"./$1\";|" $main_scss
# /reboot'
unset main_scss dir_scss boots_scss