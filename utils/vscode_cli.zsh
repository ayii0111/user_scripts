#! /bin/zsh

# 別名 c
# 無參數時，默認打開當前目錄 (若當前目錄為特殊目錄，還會額外打開指定檔案)

if (($#*)) {
  code $*
} else {

  # 設定特殊目錄下，打開指定檔案與目錄
  # 2> /dev/null 避免輸出--no-restore的 bug報錯
  if [[ $(pwd) == *user_config* ]] {
    code --no-restore . ~/user_config/zshrc_dir/alias_script.zsh ~/user_config/zshrc_dir/alias_cmd.zsh ~/user_config/zshrc_dir/alias_git.zsh 2> /dev/null
  } elif [[ $(pwd) == *user_scripts*  ]] {
    code --no-restore . ~/user_config/zshrc_dir/alias_script.zsh ~/user_config/zshrc_dir/alias_cmd.zsh 2> /dev/null
  } else {
    code .
  }
}
