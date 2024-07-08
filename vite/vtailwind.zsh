
#! /bin/zsh


# 別名 vtail
# tailwind 快速安裝配置
# 會使用到 concurrently

npm i -D tailwindcss postcss autoprefixer
npm i -D concurrently

# ts設定檔初始化
# 會建立一個 tailwind.config.js 和 postcss.config.js
npx tailwindcss init -p

# 將 content: [], 替換成多行的內容
sed -i '' '/content: \[\],/{
s|content: \[\],|content: [|
a\
    "./index.html",\
    "./src/**/*.{vue,js,ts,jsx,tsx}",\
  ],
}' ./tailwind.config.js

echo '@tailwind base;
@tailwind components;
@tailwind utilities;' > ./src/assets/input.css



local origStr='"dev": "vite"'
local modStr='"dev": "concurrently -n \"vite,tailwindcss\" --prefix-colors \"cyan,magenta\" \"vite\" \"tailwindcss -i ./src/assets/input.css -o ./src/assets/main.css -w\""'
modStr=${modStr//\\/\\\\}
gsed -i "s|$origStr|$modStr|" ./package.json
echo "修改了 package.json 中的 dev 指令內容"