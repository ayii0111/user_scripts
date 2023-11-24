#! /bin/zsh

# 別名 vlodash
# 可以安裝 lodash 與其型別，還有 lodash 不需要的函式
npm i lodash-es

# 安裝型別
npm i -D @types/lodash-es eslint-plugin-you-dont-need-lodash-underscore

local dont_need_lodash=',\
    "plugin:you-dont-need-lodash-underscore/compatible",'

gsed -i "/extends:/,\$ { 0,/'$/ {// s|$|$dont_need_lodash|}}" ./.eslintrc.cjs


# 以下為 auto-import 的配置
local auto_import=$(cat <<'EOF'
,\
        {'lodash-es': ['cloneDeep', 'camelCase', 'isPlainObject', 'merge']}
EOF
)
# 在搜尋時，若有[] 需轉譯
gsed -i "/imports: \[/,\$ { 0,/\}$/ {// s|$|$auto_import|}}" ./vite.config.{t,j}s


unset dont_need_lodash auto_import