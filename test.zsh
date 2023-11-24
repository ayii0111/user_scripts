#! /bin/zsh




gsed 's| "| "../../node_modules/bootstrap/scss/|' $scss_path


gsed '1a\
import '"'"'bootstrap'"'"'
' ./src/main.{t,j}s

gsed "1 s|^|import 'bootstrap'\n|" ./src/main.{t,j}s



# 修改 "dev": "vite"
# 改為這樣"dev": "concurrently -n \"vite,bootstrap\" --prefix-colors \"cyan,magenta\" \"vite\" \"sass --watch ./src/assets/main.scss ./src/assets/main.css\"",

local origStr='"dev": "vite"'
local modStr='"dev": "concurrently -n \"vite,bootstrap\" --prefix-colors \"cyan,magenta\" \"vite\" \"sass --watch ./src/assets/main.scss ./src/assets/main.css\"",'
modStr=${modStr//\\/\\\\}
gsed -i "s|$origStr|$modStr|" ./package.json

gsed "s|\"dev\": \"vite\"|\"dev\": \"concurrently -n \\\\\"vite,bootstrap\\\\\" --prefix-colors \\\\\"cyan,magenta\\\\\" \\\\\"vite\\\\\" \\\\\"sass --watch $scss_path $css_path\\\\\"\"|" ./package.json



gsed '/<style scoped>/,/<\/style>/ {/<style scoped>/! {/<\/style>/! d}}' ./src/App.vue


gsed -i '/<header>/,/HelloWorld/d; /<\/div>/,/<\/header>/d' ./src/App.vue


gsed "/skip-formatting/ s|$|,\n    './eslintrc-auto-import.json'|" ./.eslintrc.cjs