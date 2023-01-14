## Prepare
  1. install alacritty.
  2. install [alacritty-theme-switch]("https://github.com/tichopad/alacritty-theme-switch").
  3. change alacritty_path's value appropriately in utils.lua.
  4. install Lsp command.
      - `sudo npm install -g cspell`
  5. install graphql-language-service-cli.
    - `pnpm add -g graphql-language-service-cli`.
  6. install telescope dependencies.
    - https://github.com/BurntSushi/ripgrep
    - https://github.com/nvim-telescope/telescope-fzf-native.nvim
  7. install debugger.
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


