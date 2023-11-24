#! /bin/zsh


# insertMain <import參數> <app.use參數>
local file=$(checkExist "./src/main")
if [[ ! $file ]] return 1

local import1=$(echo "$1" | gsed ':a;N;$!ba;s/\n/\\n/g')
local import2=$(echo "$2" | gsed ':a;N;$!ba;s/\n/\\n/g')

gsed -i "/createApp(App)/,\$! {/^$/d}
0,/createApp(App)/{// s|^|$import1\n\n\n|}
/createApp(App)/,/app.mount('#app')/ {/^$/d}
0,/app.mount('#app')/{// s|^|$import2\n\n\n|}" $file

unset file import1 import2