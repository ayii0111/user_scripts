#! /bin/zsh

# 腳本 gwd
currentDir=${$(pwd):t}
git worktree remove ../$currentDir\($1\)