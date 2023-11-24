#! /bin/zsh

npm i bootstrap @popperjs/core

# 安裝 sass編譯套件
npm i sass -D

# 多指令同時運行的套件
npm install concurrently -D

# vite 的目錄結構
local scss_path="./src/assets/"

# 把 bootstrap.scss 拷貝出來，改為 all.scss
cp ./node_modules/bootstrap/scss/bootstrap.scss $scss_path\main.scss

# 用 sed 指令，替換成正確的路徑
sed -i '' 's/\ "/\ "..\/..\/node_modules\/bootstrap\/scss\//' $scss_path\main.scss

# bootstrap 的樣式與js，統一在 main.js 中匯入
# '"'"'單引號內容'"'"'
sed -i '' -e '1a\
import '"'"'bootstrap'"'"'
' ./src/main.{t,j}s


# 修改 "dev": "vite"
# 改為這樣"dev": "concurrently -n \"vite,bootstrap\" --prefix-colors \"cyan,magenta\" \"vite\" \"sass --watch ./src/assets/main.scss ./src/assets/main.css\"",
sed -i '' "s|\"dev\": \"vite\"|\"dev\": \"concurrently -n \\\\\"vite,bootstrap\\\\\" --prefix-colors \\\\\"cyan,magenta\\\\\" \\\\\"vite\\\\\" \\\\\"sass --watch $scss_path\main.scss $scss_path\main.css\\\\\"\"|" ./package.json


# 刪除 App.vue樣式與 base.css檔
sed -i "" '23,85d' ./src/App.vue
rm ./src/assets/{base.css,logo.svg}

unset scss_path