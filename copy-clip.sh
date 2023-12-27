#!/bin/bash
src="$HOME/Desktop/clip"
dest="$HOME/i/wiki/docs/clip"
today=$(date +%Y-%m-%d)

# 查找并复制今天的文件
find "$src" -type f -newermt "$today" ! -newermt "$today + 1 day" -exec cp {} "$dest" \;

