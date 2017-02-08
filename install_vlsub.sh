#!/bin/bash

file_path=/Applications/VLC.app/Contents/MacOS/share/lua/extensions/vlsub.lua

if [ -f file_path ]; then
    wget https://raw.githubusercontent.com/exebetche/vlsub/master/vlsub.lua -O file_path
else
    echo "VLSub already installed"
fi
