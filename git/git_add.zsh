#! /bin/zsh

# 檢驗參數存是否為空
if [[ -n "$1" ]] {
  git add $1
} else {
  git add .
}