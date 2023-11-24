#! /bin/zsh

# 別名 cp
# 讓 cp 複製到不存在的目錄時，會自動建立目錄

local args=($*)
local final=$args[$#*]

# 切記字串比較時不要添加引號
if [[ $final == */ ]] {
  mkdir -p "$final"
}

cp -r $*


unset args final