#! /bin/zsh

# 別名 cp
# cp file1 [file2 ...] dir
# 若複製檔案移動到不存在的目錄時，會自動建立

local args=($*)
local final=$args[$#*]

final=${final:h}
mkdir -p "$final"

# 此處不用 cp，為了避免與 cp alias 衝突，因此使用該指令的路徑來執行
/bin/cp -r $*

unset args final