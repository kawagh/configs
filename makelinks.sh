#!/bin/sh

BASEDIR=$(dirname $0)
cd $BASEDIR
for file in .*; do
  [ "$file" = ".git" ] && continue
  [ "$file" = "." ] && continue
  [ "$file" = ".." ] && continue
  ln -sfv ${PWD}/$file ~/
done
ln -sfv ${PWD}/vscode/settings.json ~/.config/Code/User/settings.json
ln -sfv ${PWD}/vscode/keybindings.json ~/.config/Code/User/keybindings.json

ln -sfv ${PWD}/nvim/init.lua ~/.config/nvim/init.lua
