#! /bin/zsh

# 別名 vlodash
# 可以安裝 lodash 與其型別，還有 lodash 不需要的函式
npm i lodash-es

# 安裝型別，以及 lodash廢棄判斷插件
npm i -D @types/lodash-es eslint-plugin-you-dont-need-lodash-underscore

local eslintPluginConfig=",
    'plugin:you-dont-need-lodash-underscore/compatible'"

eslintPluginConfig=$(echo "$eslintPluginConfig" | gsed ':a;N;$!ba;s/\n/\\n/g')
gsed -i "/extends*.: /,$ { 0,/'$/ {// s|$|$eslintPluginConfig|}}" ./.eslintrc.cjs


# 以下為 auto-import 的配置
local autoImportConfig=",
        {'lodash-es': ['cloneDeep', 'camelCase', 'isPlainObject', 'merge']}"

autoImportConfig=$(echo "$autoImportConfig" | gsed ':a;N;$!ba;s/\n/\\n/g')
for file (./vite.config.{t,j}s) {
  if [[ -f $file ]] {
  # 在搜尋時，若有[] 需轉譯
  gsed -i "/imports: \[/,$ { 0,/\}$/ {// s|$|$autoImportConfig|}}" $file
  }
}


unset eslintPluginConfig autoImportConfig