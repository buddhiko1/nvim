## Platform agnostic

1. Install alacritty.
2. Install [alacritty-theme-switch]("https://github.com/tichopad/alacritty-theme-switch").
3. Change alacritty_path's value appropriately in utils.lua.
4. Install ctags-git.
5. Run PackerSync when fresh install.
6. Install graphql-language-service-cli.
   - `pnpm add -g graphql-language-service-cli`.
7. Install telescope dependencies.
   - https://github.com/BurntSushi/ripgrep
   - https://github.com/nvim-telescope/telescope-fzf-native.nvim
8. Install linter and formmater
   - `pacman -Syu prettier`
   - `pacamn -Syu eslint && mi -g eslint`
   - `pacman -Syu stylua`
   - `pacman -Syu yamllint`
9. Install debuger.
   - `vscode-node-debug2`
   - `vscode-chrome-debug`
10. Install dbeaver

## ArchLinux

1. Map CapsLock to Esc: `setxkbmap -option caps:escape`
2. clear shada: `cat /dev/null > .local/state/nvim/shada/main.shada`

## Windows

1. Install dependencies:

- `install JetBrainMono font`
- `choco install mingw` (run as a administrator)
- `choco install ripgrep fd` (run as a administrator)
- `winget install alacritty`
- `winget install qutebrowser`
- `winget install DBeaver`
- `pnpm install -g eslint prettier`
- `pip install --user yamllint`
- `download stylua`

2. Change start path appropriately in start.vbs.
3. Send nvim.vbs to desktop.
4. Create shortcut for nvim.vbs's shortcut.
5. Change icon of shortcut.
