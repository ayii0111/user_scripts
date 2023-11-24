#! /bin/zsh

# 別名 gllo
# 對於 git local-commits 指令的美化

local count=$(git local-commits | grep -o "commit " | wc -l | gsed 's|       ||')
local format=$(git local-commits)
format=$(echo $format | gsed "/^$/d; /commit /{s/.\{33\}$//; s|^|\nplaceholder\n|}")

for i ({1..$count}) {
  format=$(echo $format | gsed "0,/placeholder/{// s|placeholder|~$i|}")
}

format=$(echo $format | gsed '/Author/d; /Date/s|.\{14\}$||')
echo $format

unset count format