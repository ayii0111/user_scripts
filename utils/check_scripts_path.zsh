#! /bin/zsh

# 要忽略路徑的陣列
ignore_path=("README.md" ".DS_Store" ".gitignore" ".history" ".vscode" "undecided")

# 腳本目錄路徑
scripts_path="$HOME/user_scripts"

# 使用 find 命令找出所有檔案的絕對路徑，並儲存到陣列中
file_paths=($(find "$scripts_path" -type f -a ! -path "$scripts_path/.history/*" -a ! -path "$scripts_path/.git/*"))

# 迭代刪除 ignore_path要忽略的檔案
for i ({1..$#file_paths}) {
  for j ({1..$#ignore_path}) {
    if [[ $file_paths[$i] == *$ignore_path[$j]* ]] {
      file_paths[$i]=()
    }
  }
}

# 使用 ~ 取代絕對路徑的前段
for i ({1..$#file_paths}) {
    file_paths[$i]=${file_paths[$i]//"$HOME"/'~'}
}


# 讀取文檔內容到一個變數中
verifyFileContent=$(<$HOME/user_scripts/README.md)
not_found=()
echo $not_found

# 迭代檢驗，使否檔案沒有寫入 README.md 檔案中
for i ({1..$#file_paths}) {
  if [[ ! $verifyFileContent == *$file_paths[$i]* ]] {
    not_found+=$file_paths[$i]
  }
}

echo "不存在於 README.md 中的路徑共：${#not_found} 個："
print -l $not_found
echo "\n"


verifyFileContent=$(<$HOME/user_config/zshrc_dir/alias_script.zsh)
not_found=()

# # 迭代檢驗，使否檔案沒有寫入 alias_script.zsh檔案中
for i ({1..$#file_paths}){
  if [[ ! $verifyFileContent == *$file_paths[$i]* ]] {
    not_found+=$file_paths[$i]
  }
}

echo "不存在於 ~/user_config/zshrc_dir/alias_script 中的路徑共：${#not_found} 個："
print -l $not_found

unset file_paths file_paths ignore_path scripts_path verifyFileContent not_found
