## Prepare
  1. run checkhealth .
  1. install luarocks php composer julia 
  1. install alacritty-theme-switch, eslint, prettier and cspell . 
    - `pnpm add -g alacritty-theme-switch eslint prettier cspell` .
  2. config command path in constants.lua .
  3. install telescope dependencies sys-apps/ripgrep and sys-apps/fd .
  4. install debugger .
    - `vscode-node-debug2`
    - `vscode-chrome-debug`

## linux
  1. map CapsLock to Esc: `setxkbmap -option caps:escape`
  2. clear shada: `cat /dev/null > .local/state/nvim/shada/main.shada`

## Windows
  1. install dependencies:
    - `install JetBrainMono font`
    - `choco install mingw` (run as a administrator)
    - `choco install ripgrep fd` (run as a administrator)
    - `winget install alacritty`
    - `winget install qutebrowser`
    - `winget install DBeaver`

  2. change start path appropriately in start.vbs.
  3. send nvim.vbs to desktop.
  4. create shortcut for nvim.vbs's shortcut.
  5. change icon of shortcut.
