#!/bin/bash
alacritty --class="__editor" -o window.padding.x=0 window.padding.y=0 font.size=12 font.offset.y=6 -e nvim 1>> /dev/null
