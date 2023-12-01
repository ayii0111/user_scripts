#!/bin/zsh

local total_commits
local commit1_message

git commit -m "$1"

# 取得當前分支的提交數量
total_commits=$(git rev-list --count HEAD)


 # 大於5個提交時，往前數前第5個提交，來移除
if (( $total_commits > 5 )) {

  # 取得第一個提交訊息
  commit1_message=$(git log --reverse --pretty=format:"%B" | head -1)

  # git rebase -i --root 為變基互動模式，會進行兩次編輯存檔
  # 第一次編輯存檔，是用來操作提交歷史的
  # 第二次編輯存檔，則是用來修改合併後的提交訊息
  # 使用 GIT_EDITOR環境變數，指定 sed為編輯指令
  # 兩個 -e代表每次編輯存檔，都會進行兩次編輯動作
  # 第一個 -e編輯動作：將第二行的 pick 改為 squash，就會將第二個提交與第一個提交合併
  # 第二個 -e編輯動作：將第四行的提交訊息，使用空隔來取代
  GIT_EDITOR="sed -i '' -e '2s/pick/squash/' -e '4s/$commit1_message/ /'" git rebase -i --root
  # 只能用來刪單行的提交訊息，兩行以上的提交訊息，只能刪到第一行

}

unset total_commits commit1_message
