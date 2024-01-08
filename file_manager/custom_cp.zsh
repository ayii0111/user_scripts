#! /bin/zsh

# mp 檔案路徑1 檔案路徑2 ... 目標目錄
# 拷貝檔按到目標目錄，若目標目錄不存在，則會自動建立

# mp 檔案路徑
# 拷貝單一檔案，到當前目錄


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
  eval "mkdir -p \$final "
  for i ($first_half) {
  # cp -r 可複製目錄
  # \"$i\" 可避免目錄名稱有空隔，在帶入 eval後，被看成兩個參數
  eval "cp -r \"$i\" \$final"
}

} else {
  cp -r $1 .
}

unset para final first_half