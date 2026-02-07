# dotfiles

My personal macOS development setup. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Getting started

```sh
git clone https://github.com/vanbouzoukas/dotfiles.git ~/Developer/dotfiles
cd ~/Developer/dotfiles
make install
```

For work machines (skips personal apps):

```sh
make install-work
```

## Post-install

Create `~/.gitconfig.local` for your Git identity:

```sh
echo "[user]
    name = YOUR NAME
    email = YOUR EMAIL" > ~/.gitconfig.local
```

Then restart your terminal.

## Structure

```
dotfiles/
├── brew/       # Brewfile
├── git/        # .gitconfig, .gitignore_global
├── macos/      # System preferences scripts
├── starship/   # Shell prompt config
├── zsh/        # .zshrc
├── install.sh
└── Makefile
```

## Commands

| Command             | Description                   |
| ------------------- | ----------------------------- |
| `make install`      | Full install                  |
| `make install-work` | Install without personal apps |
| `make macos`        | Apply macOS defaults          |
| `make macos-reset`  | Reset macOS defaults          |
