#!/bin/zsh

# set -e
git commit -m "$1"

# 取得前第 n個提交的 hash值
get_nth_commit_hash() {
  git rev-parse HEAD~$1
}

# 取得當前分支的提交數量
total_commits=$(git rev-list --count HEAD)


 # 大於5個提交時，往前數前第5個提交，來移除
if (( $total_commits > 5 )) {

  # 取出要移除提交的 hash值
  commit_to_remove=$(get_nth_commit_hash 5)

  # 取得 hash值短版
  commit_to_remove=$commit_to_remove[1,7]

  # 透過 git rebase -i --root 互動模式
  # 使用 GIT_EDITOR環境變數，指定 sed為編輯指令
  # 透過 sed 指令語法，將指定 hash值的前面的 pick 改為 drop，就會有移除指定的歷史提交的效果
  GIT_EDITOR="sed -i '' -e 's/^pick $commit_to_remove/drop $commit_to_remove/'" git rebase -i --root
}
