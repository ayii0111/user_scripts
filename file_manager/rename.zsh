#! /bin/zsh

# 別名 ren
# 若僅有一個參數，就可以用來更改當前目錄名稱


# 確認第二個參數的存在
if [[ -n $2 ]] {
    mv -i $1 $2
  } else {
    local dir=$(pwd)

    # 取出當前目錄的名稱
    dir=${dir:t}
    cd ..
    mv -i $dir $1
    cd $1
  }

unset dir