@echo off
title nvim
start  /max alacritty --class="__editor" -o window.padding.x=0 window.padding.y=0 font.size=12 font.offset.y=8 font.offset.x=0 window.startup_mode=Fullscreen -e nvim
exit
