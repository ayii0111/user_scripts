#! /bin/zsh

# 別名 vaxios
npm i axios vue-axios
npm i @types/axios -D

local import1="import axios from 'axios'"
local import2="import VueAxios from 'vue-axios'"
local import3="app.use(VueAxios, axios)"
local import4="app.provide('axios', app.config.globalProperties.axios)"

gsed -i "/createApp(App)/,\$! {/^$/d}; 0,/createApp(App)/{// s|^|$import1\n$import2\n\n\n|};"
-e "0,/app.mount('#app')/{// s|^|$import3\n$import4\n\n\n|}" ./vite.config.{t,j}s

unset import1 import2 import3 import4