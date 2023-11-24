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
# 將前次指令與執行結果儲存於 last_command、last_exit_code 全域變數
source ~/user_scripts/hook/preec.zsh
source ~/user_scripts/hook/brew_packages.zsh
source ~/user_scripts/hook/conda_env_hook.zsh
source ~/user_scripts/hook/git_ignore.zsh


alias concr='source ~/user_scripts/package_manager/conda_create_env.zsh'  # conda 環境建立
alias conrm='source ~/user_scripts/package_manager/conda_remove_env.zsh'  # conda 環境移除
alias brewi='source ~/user_scripts/package_manager/brew_pack_install.zsh' # brew 包列安裝
alias stylint='source ~/user_scripts/package_manager/stylelint.zsh'         # 快速建立 stylelint 環境
alias bootsr='source ~/user_scripts/package_manager/bootstrap.zsh'          # 快速建立 vite中的 boostrap環境
alias cb='source ~/user_scripts/utils/config_backup.zsh'                  # 設定檔備份
alias hali='source ~/user_scripts/utils/hash_alignment.zsh'               # hash字符對齊
alias fis='source ~/user_scripts/utils/find_installed.zsh'                # 已安裝軟件地毯搜尋
alias re='source ~/user_scripts/utils/terminal_restart.zsh'               # Mac iterm2重啟
alias ch='source ~/user_scripts/utils/check_scripts_path.zsh'             # 確認腳本路徑在 README中存在
alias pok='source ~/user_scripts/utils/push_OK.zsh'                       # 快速上傳使用者腳本
alias c='source ~/user_scripts/utils/vscode_cli.zsh'                      # vscode的指令改寫
alias ga='source ~/user_scripts/utils/git_add.zsh'                        # 自訂git add無參數模式
alias gseth='source ~/user_scripts/utils/git_reset_HEAD.zsh'              # 直接重製到前第n個提交
alias g5c='source ~/user_scripts/utils/keep_new_5commit.zsh'              # 保留前五個提交
alias molt='source ~/user_scripts/file_manager/molt.zsh'                  # 剝去當前目錄
alias mc='source ~/user_scripts/file_manager/mkdir_cd.zsh'                # 建立並進入一個目錄
alias mp='source ~/user_scripts/file_manager/custom_cp.zsh'                # 複製到某一目錄時，預先建立該目錄
alias rmal='source ~/user_scripts/file_manager/remove_all.zsh'            # 刪除當前目錄與目錄中的檔案
alias ren='source ~/user_scripts/file_manager/rename.zsh'

```
