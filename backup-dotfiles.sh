#!/bin/bash
zshrc="$HOME/.zshrc"
yazi="$HOME/.config/yazi/"
dest="$HOME/i/dotfiles"
yazi_dest="$HOME/i/dotfiles/yazi/"

cp "$zshrc" "$dest"
cp -r "$yazi" "$yazi_dest"
