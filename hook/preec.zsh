#! /bin/zsh

# 初始化變數來儲存上次和即將執行的指令
typeset -g last_command
typeset -g current_command
typeset -g last_exit_code
typeset -g lastdir="$HOME/.lastdir"

# preexec hook：在每個指令執行之前觸發
preec_pre() {
  current_command=$1
}

# precmd hook：在每個指令執行之後觸發
preec_post() {

  # 只要切換目錄，就將當前目錄，儲存起來
  # 不要將其他別名設定為 cd 開頭
  # 添加了一些會切換當前目錄的自訂指令 rmal、mc
  if [[ $current_command = cd* || $current_command = z\ * || $current_command = rmal || $current_command = mc\ * ]] {
    pwd > $lastdir
  }

  # 取出上次執行結果
  # 需注意 $?每次取得都僅是上一行的執行結果，$? 取出的位置很重要
  last_exit_code=$?

  # 更新 last_command 只在 next_command 不為空的情況下
  if [[ ! -z "$current_command" ]] {
    last_command=$current_command

    # 清空 next_command，以避免重複使用
    current_command=""
  }

}

# 註冊 hooks
autoload -U add-zsh-hook
add-zsh-hook preexec preec_pre
add-zsh-hook precmd preec_post

# 切記本檔中，所有變數綁定到 hook後，不能馬上 unset，否則會讀不到該變數