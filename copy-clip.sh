#!/bin/bash
src="$HOME/Desktop/clip"
dest="$HOME/i/huyixi.wiki/docs/clip"

# Copy all files from source to destination
cp -r "$src"/* "$dest"

# Delete all files from source
rm -r "$src"/*
