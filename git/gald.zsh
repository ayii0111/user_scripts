#! /bin/zsh

# gald 腳本
# 測試情境：新建一個檔案後暫存，再次新間一個檔案後，載入暫存
if (( $# == 0 )) {
  git checkout .
  git clean -fd
} else {
  git checkout -- $*
  git clean -fd $*
}