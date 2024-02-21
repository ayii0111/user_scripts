#! /bin/zsh

# 別名 vcomp
# 安裝並配置 unplugin-vue-components
npm i unplugin-vue-components -D

if [[ -f "./vite.config.ts" ]]; then
  local file="./vite.config.ts"
elif [[ -f "./vite.config.js" ]]; then
  local file="./vite.config.js"
else
  echo "找不到 ./vite.config 檔案"
  return 1
fi

local import1="import Components from 'unplugin-vue-components/vite'"
local import2="import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'"

# 在 export那一行前面的區塊的空行全部刪除，以及有著 https:的默認註解也刪除
# 在 export那一行，的前面插入 import...代碼還有兩個空行
gsed -i "/^export/,\$! {/^$/d; /https:/d}; 0,/export/{// s|^|$import1\n$import2\n\n\n|};" $file

local Components=$(cat <<'EOF'
  Components({
		dirs: ['src/components', 'src/views'],
    resolvers: [ElementPlusResolver()],
    dts: true,
    include: [/\.vue$/, /\.vue\?vue/, /\.md$/]
  }),
EOF
)

Components=$(echo "$Components" | gsed ':a;N;$!ba;s/\n/\\n/g')

gsed -i "/vue(),/a\\$Components" $file

unset Components import1 import2