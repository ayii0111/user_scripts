# UserScripts
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
~/UserScripts
```
<br>
<br>

## 配置
在 .zshrc 檔中添加
```bash
# hook 目錄
# 將前次指令與執行結果儲存於 lastCmd、lastStatus 全域變數
source ~/UserScripts/hook/preec.zsh
source ~/UserScripts/hook/brew_packages.zsh
source ~/UserScripts/hook/conda_env_hook.zsh
source ~/UserScripts/hook/git_ignore.zsh

# pkg_mgr目錄
alias concr='source ~/UserScripts/pkg_mgr/conda_create_env.zsh'  # conda 環境建立
alias conrm='source ~/UserScripts/pkg_mgr/conda_remove_env.zsh'  # conda 環境移除
alias brewi='source ~/UserScripts/pkg_mgr/brew_pack_install.zsh' # brew 包列安裝

# vite 目錄
alias      vconf='source ~/UserScripts/vite/vite-config.zsh'                # 快速設定 vite 基本設定
alias     vroute='source ~/UserScripts/vite/modifyRoute.zsh'                # 快速修改 vite 中的 route
alias      vauto='source ~/UserScripts/vite/auto-import.zsh'                # 快速安裝並設定 auto-import
alias      vcomp='source ~/UserScripts/vite/unplugin-component.zsh'         # 子元件可以不用 import
alias      vboot='source ~/UserScripts/vite/bootstrap.zsh'                  # 整合 bootstrap框架並刪除預設樣式
alias         v-='source ~/UserScripts/vite/delete-vite-style.zsh'          # 刪除預設樣式，不可與 vboot腳本一起執行
alias       vbcp='source ~/UserScripts/vite/vb-copy.zsh'                    # 一鍵輸入 bootstrap 的 scss 檔名，來將 node...中的拷貝到專案中，並修改入口檔中的匯入路徑
alias     vaxios='source ~/UserScripts/vite/axios.zsh'                      # 快速安裝並配置 axios
alias    vlodash='source ~/UserScripts/vite/lodash.zsh'                     # 快速安裝並配置 lodash
alias   vstylint='source ~/UserScripts/vite/stylelint.zsh'                  # 快速建立 stylelint 環境
alias checkExist='source ~/UserScripts/vite/check-file-exist.zsh'           # 用來確認指定檔案是存在.js 或 .ts



# utils 目錄
alias   cb='source ~/UserScripts/utils/config_backup.zsh'                # 設定檔備份
alias hali='source ~/UserScripts/utils/hash_alignment.zsh'               # hash字符對齊
alias fins='source ~/UserScripts/utils/find_installed.zsh'               # 已安裝軟件地毯搜尋
alias   re='source ~/UserScripts/utils/terminal_restart.zsh'             # Mac iterm2重啟
alias   ch='source ~/UserScripts/utils/check_scripts_path.zsh'           # 確認腳本路徑在 README中存在
alias  pok='source ~/UserScripts/utils/push_OK.zsh'                      # 快速上傳使用者腳本
alias    c='source ~/UserScripts/utils/vscode_cli.zsh'                   # vscode的指令改寫

# git 目錄
alias     ga='source ~/UserScripts/git/git_add.zsh'                       # 自訂git add無參數模式
alias   gset='source ~/UserScripts/git/git_reset-hard.zsh'
alias    gc9='source ~/UserScripts/git/git_commits-keep-9.zsh'         # 保留前五個提交
alias  gmota='source ~/UserScripts/git/git_remote-add.zsh'                # remote add 參數簡寫
alias     gr='source ~/UserScripts/git/git_restore.zsh'
alias  grebs='source ~/UserScripts/git/git_rebase-squash.zsh'
alias grebsb='source ~/UserScripts/git/git_rebase-squash-undo.zsh'
alias    gcf='source ~/UserScripts/git/git_commit-force.zsh'

# file_manager 目錄
alias molt='source ~/UserScripts/file_manager/molt.zsh'                  # 剝去當前目錄
alias   mc='source ~/UserScripts/file_manager/mkdir_cd.zsh'              # 建立並進入一個目錄
alias  cpp='source ~/UserScripts/file_manager/custom_cp.zsh'             # 複製到某一目錄時，預先建立該目錄
alias rmal='source ~/UserScripts/file_manager/remove_all.zsh'            # 刪除當前目錄與目錄中的檔案
alias  ren='source ~/UserScripts/file_manager/rename.zsh'                # 更改當前目錄名稱
alias   cs='source ~/UserScripts/file_manager/copy_stdout.zsh'            # 將輸出指令複製到剪貼板


```
