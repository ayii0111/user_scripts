#! /bin/zsh

# 別名 vaxios
npm i axios vue-axios
npm i @types/axios -D

local import1="import axios from 'axios'
import VueAxios from 'vue-axios'"

local import2="app.use(VueAxios, axios)
app.provide('axios', app.config.globalProperties.axios)"

import1=$(echo "$import1" | gsed ':a;N;$!ba;s/\n/\\n/g')
import2=$(echo "$import2" | gsed ':a;N;$!ba;s/\n/\\n/g')


local file=$(checkExist "./src/main")
if [[ ! $file ]] return 1

gsed -i "/createApp(App)/,\$! {/^$/d}
0,/createApp(App)/{// s|^|$import1\n\n\n|}
/createApp(App)/,/app.mount('#app')/ {/^$/d}
0,/app.mount('#app')/{// s|^|$import2\n\n\n|}" $file

unset import1 import2 file