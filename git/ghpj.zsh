#! /bin/zsh

# ghpj 腳本：用來快速建立新repo目錄、git 本地環境、初次 commit
# 依賴 mc 腳本

mc $1
git init
echo "" > README.md
git add .; git commit -m "init"