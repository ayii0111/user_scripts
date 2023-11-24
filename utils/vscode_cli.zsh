#! /bin/zsh


if (($#*)) {
  code $*
} else {

  # 設定特殊目錄下，打開指定檔案與目錄
  if [[ $(pwd) = /Users/ayii/user_config ]] {
    code ~/user_config ~/.zshrc
  } elif [[ $(pwd) = /Users/ayii/user_scripts  ]] {
    code ~/user_scripts ~/user_config/zshrc_dir/alias_script.zsh ~/user_config/zshrc_dir/alias_cmd.zsh
  } else {
    code .
  }
}
