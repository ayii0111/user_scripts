#! /bin/zsh


# 應該要檢查最後兩個提交有沒有一樣
# 最後兩個提交一樣，代表是 rebase
# 但還沒操作過 merge 觀察 reflog
# 最好再多操作 reset 看看 reflog
# 也要操作 提交讀取，觀察 reflog
local latest_merge_commit=$(git reflog | awk '/\(finish\)/ && NR==1 {print $1}')
