#! /bin/zsh

# 別名 v-
# 刪除所有初始樣式

# 刪除 App.vue樣式與 base.css檔
gsed -i '/<style scoped>/,/<\/style>/ {/<style scoped>/! {/<\/style>/! d}}' ./src/App.vue
gsed -i '/import HelloWorld/d; /<header>/,/HelloWorld/d; /<\/div>/,/<\/header>/d' ./src/App.vue
gsed -i '/TheWelcome/d' ./src/views/HomeView.vue
gsed -i "/.\/assets\/main.css/d" ./src/main.{t,j}s



echo "刪除 App.vue 中的 <style> 內容，以及 <header> 標籤、HelloWorld元件
刪除 HomeView.vue 中的 TheWelcome元件"

rm ./src/assets/{base.css,logo.svg}