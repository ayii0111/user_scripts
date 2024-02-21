#! /bin/zsh

# 別名 vaxios
npm i axios vue-axios
npm i @types/axios -D

local import1="import axios from 'axios'"
local import2="import VueAxios from 'vue-axios'"
local import3="app.use(VueAxios, axios)"
local import4="app.provide('axios', app.config.globalProperties.axios)"

for file (./src/main.{t,j}s) {
  if [[ -f $file ]] {
    gsed -i "/createApp(App)/,\$! {/^$/d}
0,/createApp(App)/{// s|^|$import1\n$import2\n\n\n|}
/createApp(App)/,/app.mount('#app')/ {/^$/d}
0,/app.mount('#app')/{// s|^|$import3\n$import4\n\n\n|}" $file
  }
}

unset import1 import2 import3 import4