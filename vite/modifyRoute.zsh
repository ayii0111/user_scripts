#! /bin/zsh

# 別名 vroute

# 檢查存在的檔暗示 index.ts 還是 index.js
if [[ -f "src/router/index.ts" ]]; then
  local file="src/router/index.ts"
elif [[ -f "src/router/index.js" ]]; then
  local file="src/router/index.js"
else
  echo "找不到 src/router/index 檔案"
  return 1
fi

# createWebHistory 改為 createWebHashHistory
gsed -i 's/createWebHistory/createWebHashHistory/' $file

# 格式化 Home的路由
gsed -i '/import HomeView/d' $file
gsed -i "s|component: HomeView|component: () => import('../views/HomeView.vue')|" $file

# //註解都刪除
gsed -i '/\/\//d' $file

unset file