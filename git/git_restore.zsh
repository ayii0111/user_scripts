#!/bin/zsh

# 別名 gr
# 檢驗參數存是否存在
if [[ -n "$1" ]] {
  git restore $1
} else {
  git restore . && git clean -fd
}