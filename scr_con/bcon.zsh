#! /bin/zsh

# 別名 bcon: 將設定檔備份到 UserConfig 資料夾
# 全稱 backup config
# 設定檔的備份，包含 vscode、snippets、.zshrc骨幹

# 透過自製的 mp指令，將設定檔備份管理

local basePath=$HOME/UserConfig

# zshrc
cp $HOME/.zshrc $basePath/zshrc/.zshrc

# vsCode(Cursor)
cp "$HOME/Library/Application Support/Cursor/User/settings.json" $basePath/vsCode/
cp "$HOME/Library/Application Support/Cursor/User/keybindings.json" $basePath/vsCode/
cp $HOME/Library/Application\ Support/Cursor/User/snippets $basePath/vsCode/snippets
cursor --list-extensions >$basePath/vsCode/extensionsList

# config
cp $HOME/.tmux.conf $basePath/config
cp $HOME/.config/yazi $basePath/config/yazi
cp $HOME/.config/starship.toml $basePath/config
cp $HOME/.config/zellij/config.kdl $basePath/config/zellij/config.kdl
cp $HOME/Library/Containers/org.atelierInmu.inputmethod.vChewing/Data/Library/Application\ Support/vChewing $basePath/config/vChewing

unset basePath
