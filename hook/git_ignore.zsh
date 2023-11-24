#! /bin/zsh

git_ignore() {
  if [[ $last_command == git\ init ]]; then

    echo '.history
.DS_Store
node_modules
.vscode' >> .gitignore

  fi
}

add-zsh-hook precmd git_ignore



