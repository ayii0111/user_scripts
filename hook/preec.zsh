#! /bin/zsh

# 初始化變數來儲存上次和即將執行的指令
typeset -g last_command
typeset -g current_command
typeset -g last_exit_code

# preexec hook：在每個指令執行之前觸發
preec_pre() {
  current_command=$1
}

# precmd hook：在每個指令執行之後觸發
preec_post() {

  # 取出上次執行結果
  # 需注意 $?每次取得都僅是上一行的執行結果，$? 取出的位置很重要
  last_exit_code=$?


  # 每次切換目錄時，記錄切換的目錄，以便下次登入時，自動回到該目錄
  if [[ $current_command = cd* || $current_command = z\ * || $current_command = rmal || $current_command = mc\ * ]] {
    pwd > $HOME/.lastdir
  }


  # 將剛執行的指令儲存到 last_command，並清空儲存剛執行指令的 current_command
  if [[ -n "$current_command" ]] {
    last_command=$current_command

    # 清空 current_command
    current_command=""
  }

}

# 註冊 hooks
autoload -U add-zsh-hook
add-zsh-hook preexec preec_pre
add-zsh-hook precmd preec_post

# 切記本檔中，所有變數綁定到 hook後，不能馬上 unset，否則會讀不到該變數