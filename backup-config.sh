#!/bin/bash
zshrc="$HOME/.zshrc"
yazi="$HOME/.config/yazi/"
dest="$HOME/i/config"
yazi_dest="$HOME/i/config/yazi/"

[ -f "$zshrc" ] && cp "$zshrc" "$dest"
[ -d "$yazi" ] && cp -r "$yazi" "$yazi_dest"
