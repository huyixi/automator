#!/bin/bash
zshrc="$HOME/.zshrc"
yazi="$HOME/.config/yazi/"
dest="$HOME/i/config"
yazi_dest="$HOME/i/config/yazi/"

cp "$zshrc" "$dest"
cp -r "$yazi" "$yazi_dest"
