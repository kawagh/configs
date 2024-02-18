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
