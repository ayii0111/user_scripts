#! /bin/zsh

# 別名 gset
# 切換 HEAD到指定提交，並切刪除非當前提交所屬的檔案
git reset --hard $1 && git clean -fd
