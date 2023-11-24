#! /bin/zsh
conda_env_in() {
  local cmd=$last_command

  if [[ $cmd == cd ]] {
    conda deactivate
  }

  if [[ $cmd == cd\ * ]] {
    local env_arr=($(cat ~/user_config/conda_env))

    local dir=$(pwd)

    # 取出當前目錄的名稱
    dir=${dir:t}

    if (( $env_arr[(Ie)$dir] )) {
      conda activate ./
    }
  }
  unset cmd env_arr dir
}

add-zsh-hook precmd conda_env_in