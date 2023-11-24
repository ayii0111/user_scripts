#! /bin/zsh

# 在專案目錄內，指定 python版本，來建立 conda環境
conda create --prefix . python=$1
local env=$(pwd)

# 僅保留專案目錄名稱
env="${env/$HOME\/}"

# 寫入環境管理的清單
echo $env >> ~/user_config/conda_env

# 立即登入專案環境
conda activate ./

unset env