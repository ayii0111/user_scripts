#! /bin/zsh

# 別名 vboot

# 先執行清除預設樣式的腳本
v-

npm i bootstrap @popperjs/core

# 添加 bootstrap中 js部分的型別
npm i -D @types/bootstrap

# 安裝 sass編譯套件
npm i sass -D

# 多指令同時運行的套件
npm i concurrently -D

# vite 的目錄結構
local scss_path="./src/assets/main.scss"

# 把 bootstrap.scss 拷貝出來，改為 all.scss
cp ./node_modules/bootstrap/scss/bootstrap.scss $scss_path

# 用 sed指令，去操作拷貝後的 main.scss檔，將其中各個檔案匯入的路徑，修改成正確的路徑
gsed -i 's| "| "../../node_modules/bootstrap/scss/|' $scss_path


for file (./src/main.{t,j}s) {
  if [[ -f $file ]] {
  # bootstrap 的樣式與js，統一在 main.js 中匯入
  gsed -i "1 s|^|import 'bootstrap'\nimport '../src/assets/main.css'|" $file
  }
}


# 修改 "dev": "vite"
# 改為這樣"dev": "concurrently -n \"vite,bootstrap\" --prefix-colors \"cyan,magenta\" \"vite\" \"sass --watch ./src/assets/main.scss ./src/assets/main.css\"",
local origStr='"dev": "vite"'
local modStr='"dev": "concurrently -n \"vite,bootstrap\" --prefix-colors \"cyan,magenta\" \"vite\" \"sass --watch ./src/assets/main.scss ./src/assets/main.css\""'
modStr=${modStr//\\/\\\\}
gsed -i "s|$origStr|$modStr|" ./package.json
echo "修改了 package.json 中的 dev 指令內容"

unset scss_path origStr modStr