#! /bin/zsh

# 透過自製的 mp指令，將設定檔備份管理
mp $HOME/.zshrc $HOME/user_config/
mp "$HOME/Library/Application Support/Code/User/settings.json" $HOME/user_config/Code
mp "$HOME/Library/Application Support/Code/User/keybindings.json" $HOME/user_config/Code
mp $HOME/.fig/settings.json $HOME/user_config/fig
mp $HOME/Library/Application\ Support/Code/User/snippets/*  $HOME/user_config/snippets