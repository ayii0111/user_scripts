#! /bin/zsh

# 透過自製的 mp指令，將設定檔備份管理
mp $HOME/.zshrc ~/user_config/
mp "$HOME/Library/Application Support/Code/User/settings.json" ~/user_config/Code
mp "$HOME/Library/Application Support/Code/User/keybindings.json" ~/user_config/Code
mp $HOME/.fig/settings.json ~/user_config/fig