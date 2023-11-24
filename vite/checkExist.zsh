#! /bin/zsh

# 別名函式 checkExist
# 用來確認指定檔案是存在.js 或 .ts
# 確認是 .js 檔，還是 .ts 檔，並將存在的檔案路徑，儲存到 file 變數中提供使用
# 若兩者都不存在，則報錯
if [[ -f "$1.ts" ]] {
  echo "$1.ts"
} elif [[ -f "$1.js" ]] {
  echo "$1.js"
} else {
  echo "找不到 $1 檔案" >&2
  return 1
}