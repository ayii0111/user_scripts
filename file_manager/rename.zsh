#! /bin/zsh

# 確認第二個參數的存在
if [[ -n $2 ]] {
    mv -i $1 $2
  } else {
    local dir=$(pwd)

    # 取出當前目錄的名稱
    local pdir=${dir:t}
    cd ..
    mv -i $pdir $1
    cd $1
  }

unset dir pdir