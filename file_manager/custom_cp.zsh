#! /bin/zsh

# 若僅有兩個以上參數 > 條件滿足，會先建立目錄
# 若僅有一個參數 > 條件不滿足，會將參數路徑的檔案，複製到當前目錄下
if (($(($#* - 1)))) {
  # 取得所有參數的陣列
  local para=($*)

  # 取出最後一個參數
  local final=$para[$#*]

  # 前大半其他參數
  # 需去除最後一個參數
  local first_half=($para)
  first_half["$#para"]=()

  # mkdir -p 若目錄已經存在，也不會報錯；且可建立巢狀目錄
  # cp -r 可複製目錄
  # \"$first_half\" 可避免目錄名稱有空隔，在帶入 eval後，被看成兩個參數
  eval "mkdir -p \$final && cp -r \"$first_half\" \$final"

} else {
  cp -r $1 .
}

unset para final first_half