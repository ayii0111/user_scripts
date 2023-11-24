#! /bin/zsh

# 別名 cb
# 設定檔的備份，包含 vscode、snippets、.zshrc骨幹

# 透過自製的 mp指令，將設定檔備份管理
cpp $HOME/.zshrc $HOME/user_config/
cpp "$HOME/Library/Application Support/Code/User/settings.json" $HOME/user_config/Code
cpp "$HOME/Library/Application Support/Code/User/keybindings.json" $HOME/user_config/Code
cpp $HOME/Library/Application\ Support/Code/User/snippets/*  $HOME/user_config/snippets