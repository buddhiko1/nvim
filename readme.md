## Prepare
  1. run checkhealth .
  2. install luarocks,php,composer and julia 
  3. `pnpm add -g alacritty-theme-switch eslint prettier cspell` .
  4. config command path in constants.lua .
  5. install telescope dependencies: ripgrep and fd .
  6. install debugger .
    - `vscode-node-debug2`
    - `vscode-chrome-debug` (add "185.199.108.133 raw.githubusercontent.com" to /etc/hosts) .

## linux
  - clear shada: `cat /dev/null > .local/state/nvim/shada/main.shada`

## Windows
  1. install dependencies:
    - `install JetBrainMono font`
    - `choco install mingw` (run as a administrator)
    - `choco install ripgrep fd` (run as a administrator)
    - `winget install alacritty`
    - `winget install qutebrowser`
    - `winget install DBeaver`

  2. change start path appropriately in start.vbs .
  3. send nvim.vbs to desktop .
  4. create shortcut for nvim.vbs's shortcut .
  5. change icon of shortcut .
