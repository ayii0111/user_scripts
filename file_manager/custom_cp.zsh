#! /bin/zsh

# 別名 cpp
# cpp file1 [file2 ...] dir
# 若複製檔案移動到不存在的目錄時，會自動建立

local args=($*)
local final=$args[$#*]

final=${final:h}
mkdir -p "$final"

cp -r $*

unset args final