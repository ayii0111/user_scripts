#! /bin/zsh

# 一鍵複製，上個指令的輸出
cp /dev/stdin /tmp/zdemo.txt
# 一鍵貼上，上個指令的輸入
cat /tmp/zdemo.txt
# 一鍵貼上，上個指令的輸入，並且加上換行
cat /tmp/zdemo.txt

tee /tmp/lastOput.txt

npm i --color=always 2>&1 | tee >(sed 's/\x1b\[[0-9;]*m//g' >/tmp/lastOput.txt)


