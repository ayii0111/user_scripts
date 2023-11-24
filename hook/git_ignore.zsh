#! /bin/zsh

git_ignore() {
  if [[ $last_command == git\ init ]] {

    echo '.history
.DS_Store
node_modules
.vscode' >> .gitignore

  }
}

add-zsh-hook precmd git_ignore



