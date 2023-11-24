#! /bin/zsh
conda_env_in() {
  local cmd=$last_command
  
  if [[ $cmd == cd ]]; then
    conda deactivate
  fi

  if [[ $cmd == cd\ * ]]; then
    local env_arr=($(cat ~/user_config/conda_env))
    local dir="${cmd//cd /}"

    if [[ "$dir" == */ ]]; then
      dir=${dir%/}
    fi

    if (( $env_arr[(Ie)$dir] )); then
      conda activate ./
    fi
  fi

}

add-zsh-hook precmd conda_env_in