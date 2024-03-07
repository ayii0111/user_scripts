#! /bin/zsh

# 別名 vauto
# 可以快速安裝配置 unplugin-auto-import
npm i -D unplugin-auto-import


for file (./vite.config.{t,j}s) {
  if [[ -f $file ]] {
# 在 export那一行前面的區塊的空行全部刪除，以及有著 https:的默認註解也刪除
# 在 export那一行，的前面插入 import...代碼還有兩個空行
  gsed -i "/^export/,\$! {/^$/d; /https:/d}
  0,/export/{// s|^|import AutoImport from 'unplugin-auto-import/vite'\n\n\n|}; " $file
  }
}




local AutoImport=$(cat <<'EOF'
AutoImport({
  include: [
    /\.[tj]sx?$/,
    /\.vue$/,
    /\.vue\?vue/,
    /\.md$/,
  ],

  imports: [
    'vue',
    'vue-router',
		// 需在安裝 vueuse 後，才能解開下面註解
		// '@vueuse/core',

		// 引入型別模組
    {
      from: 'vue-router',
      imports: ['RouteLocationRaw'],
      type: true,
    }
  ],

  defaultExportByFilename: false,
  dts: './auto-imports.d.ts',
  vueTemplate: false,
  injectAtEnd: true,

  eslintrc: {
    enabled: false,
    filepath: './.eslintrc-auto-import.json',
    globalsPropValue: true,
  },
}),
EOF
)

AutoImport=$(echo "$AutoImport" | gsed ':a;N;$!ba;s/\n/\\n/g')

for file (./vite.config.{t,j}s) {
  if [[ -f $file ]] {
  gsed -i "/vue(),/a\\$AutoImport" $file
  }
}


# tsconfig.app.json 檔添加項目
gsed -i '/include/ s|]|, "./auto-imports.d.ts"]|' ./tsconfig.app.json


# .eslintrc.cjs 添加項目
local auto_import=cat$( << 'EOF'
,\
    './eslintrc-auto-import.json'
EOF
)
gsed -i "/extends: \[/,$ { 0,/'$/ {// s|$|$auto_import|}}" ./.eslintrc.cjs


# 執行 npm run dev 產生 auto-imports.d.ts檔
npm run dev > /dev/null  &

unset AutoImport auto_import

echo '請直接執行建立的指令 kill -9 %2 來關閉 npm run dev 的背景執行'
print -z 'kill -9 %2'


