# user_scripts
自訂的一些腳本，適用環境為 MacOS、zsh
<br>
<br>
<br>

## 依賴軟件

*homebrew、fd、molovo/revolver/revolver*

- **homebrew**：為 brew_pack_install 的依賴
- **fd、molovo/revolver/revolver**：為 find_installed.zsh 的依賴

> 依賴安裝：直接 brew install 加軟件名稱就能安裝
>
<br>

## Install
下載此儲存庫，設定目錄路徑如下
```bash
~/user_scripts
```
<br>
<br>

## 配置
在 .zshrc 檔中添加
```bash
# hook 目錄
# 將前次指令與執行結果儲存於 last_command、last_exit_code 全域變數
source ~/user_scripts/hook/preec.zsh
source ~/user_scripts/hook/brew_packages.zsh
source ~/user_scripts/hook/conda_env_hook.zsh
source ~/user_scripts/hook/git_ignore.zsh

# package_manager目錄
alias concr='source ~/user_scripts/package_manager/conda_create_env.zsh'  # conda 環境建立
alias conrm='source ~/user_scripts/package_manager/conda_remove_env.zsh'  # conda 環境移除
alias brewi='source ~/user_scripts/package_manager/brew_pack_install.zsh' # brew 包列安裝

# vite 目錄
alias vstylint='source ~/user_scripts/vite/stylelint.zsh'                  # 快速建立 stylelint 環境
alias    vboot='source ~/user_scripts/vite/bootstrap.zsh'                  # 整合 bootstrap框架並刪除預設樣式
alias   vroute='source ~/user_scripts/vite/modifyRoute.zsh'                # 快速修改 vite 中的 route
alias    vauto='source ~/user_scripts/vite/auto-import.zsh'                # 快速安裝並設定 auto-import
alias    vcomp='source ~/user_scripts/vite/unplugin-component.zsh'         # 子元件可以不用 import
alias       v-='source ~/user_scripts/vite/delete-vite-style.zsh'          # 刪除預設樣式，不可與 vboot腳本一起執行
alias   vaxios='source ~/user_scripts/vite/axios.zsh'
alias  vlodash='source ~/user_scripts/vite/lodash.zsh'
alias    vconf='source ~/user_scripts/vite/vite-config.zsh'



# utils 目錄
alias   cb='source ~/user_scripts/utils/config_backup.zsh'                # 設定檔備份
alias hali='source ~/user_scripts/utils/hash_alignment.zsh'               # hash字符對齊
alias fins='source ~/user_scripts/utils/find_installed.zsh'               # 已安裝軟件地毯搜尋
alias   re='source ~/user_scripts/utils/terminal_restart.zsh'             # Mac iterm2重啟
alias   ch='source ~/user_scripts/utils/check_scripts_path.zsh'           # 確認腳本路徑在 README中存在
alias  pok='source ~/user_scripts/utils/push_OK.zsh'                      # 快速上傳使用者腳本
alias    c='source ~/user_scripts/utils/vscode_cli.zsh'                   # vscode的指令改寫

# git 目錄
alias     ga='source ~/user_scripts/git/git_add.zsh'                       # 自訂git add無參數模式
alias   gset='source ~/user_scripts/git/git_reset-hard.zsh'
alias    gc9='source ~/user_scripts/git/git_commits-keep-9.zsh'         # 保留前五個提交
alias  gmota='source ~/user_scripts/git/git_remote-add.zsh'                # remote add 參數簡寫
alias     gr='source ~/user_scripts/git/git_restore.zsh'
alias   gllo='source ~/user_scripts/git/git_local-commits-log.zsh'
alias  grebs='source ~/user_scripts/git/git_rebase-squash.zsh'
alias grebsb='source ~/user_scripts/git/git_rebase-squash-undo.zsh'
alias    gcf='source ~/user_scripts/git/git_commit-force.zsh'

# file_manager 目錄
alias molt='source ~/user_scripts/file_manager/molt.zsh'                  # 剝去當前目錄
alias   mc='source ~/user_scripts/file_manager/mkdir_cd.zsh'              # 建立並進入一個目錄
alias  cpp='source ~/user_scripts/file_manager/custom_cp.zsh'             # 複製到某一目錄時，預先建立該目錄
alias rmal='source ~/user_scripts/file_manager/remove_all.zsh'            # 刪除當前目錄與目錄中的檔案
alias  ren='source ~/user_scripts/file_manager/rename.zsh'                # 更改當前目錄名稱
alias   cs='source ~/user_scripts/file_manager/copy_stdout.zsh'            # 將輸出指令複製到剪貼板


```
