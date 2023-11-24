#! /bin/zsh

# 別名 cb
# 設定檔的備份，包含 vscode、snippets、.zshrc骨幹

# 透過自製的 mp指令，將設定檔備份管理
cpp $HOME/.zshrc $HOME/UserConfig/
cpp "$HOME/Library/Application Support/Code/User/settings.json" $HOME/UserConfig/vsCode/
cpp "$HOME/Library/Application Support/Code/User/keybindings.json" $HOME/UserConfig/vsCode/
cpp $HOME/Library/Application\ Support/Code/User/snippets  $HOME/UserConfig/vsCode/snippets
cpp $HOME/.tmux.conf $HOME/UserConfig
cpp $HOME/.config/yazi $HOME/UserConfig/config/yazi
cpp $HOME/.config/starship.toml $HOME/UserConfig/config
cpp $HOME/.config/zellij/config.kdl $HOME/UserConfig/config