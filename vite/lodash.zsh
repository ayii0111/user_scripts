#! /bin/zsh

# 別名 vlodash
# 可以安裝 lodash 與其型別，還有 lodash 不需要的函式
npm i lodash-es

# 安裝型別，以及 lodash廢棄判斷插件
npm i -D @types/lodash-es eslint-plugin-you-dont-need-lodash-underscore

local dont_need_lodash=",
    'plugin:you-dont-need-lodash-underscore/compatible'"

dont_need_lodash=$(echo "$dont_need_lodash" | gsed ':a;N;$!ba;s/\n/\\n/g')
gsed -i "/extends*.: /,$ { 0,/'$/ {// s|$|$dont_need_lodash|}}" ./.eslintrc.cjs


# 以下為 auto-import 的配置
local auto_import=",
        {'lodash-es': ['cloneDeep', 'camelCase', 'isPlainObject', 'merge']}"

auto_import=$(echo "$auto_import" | gsed ':a;N;$!ba;s/\n/\\n/g')
for file (./vite.config.{t,j}s) {
  if [[ -f $file ]] {
  # 在搜尋時，若有[] 需轉譯
  gsed -i "/imports: \[/,$ { 0,/\}$/ {// s|$|$auto_import|}}" $file
  }
}


unset dont_need_lodash auto_import

  2> /dev/null