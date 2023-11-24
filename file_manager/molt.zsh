#! /bin/zsh

# 將當前目錄內的非隱藏檔、隱藏檔，全部移動到父目錄中
# 過濾錯誤訊息
# 在 .zshrc 檔添加 setopt nonomatch 效果為：使用*而沒有匹配時，不會報錯
mv ./{*,.*} .. 2>/dev/null

# 取得當前目錄的名稱
pp=${$(pwd):t}

cd ..

# 刪除原先的當前目錄
rm -rf $pp
unset pp