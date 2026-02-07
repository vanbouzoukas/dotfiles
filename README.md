# dotfiles

Personal macOS setup. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```sh
git clone https://github.com/vanbouzoukas/dotfiles.git ~/Developer/dotfiles
cd ~/Developer/dotfiles
make install
```

For work machines (skips personal apps): `make install-work`

## Post-install

Create your Git identity:

```sh
cp ~/Developer/dotfiles/git/gitconfig.local.template ~/.gitconfig.local
# Edit with your name and email
```

Set Terminal theme:

1. Double-click `terminal/github-dark-default.terminal`
2. Terminal → Settings → Profiles → select "GitHub Dark Default" → click "Default"

Then restart your terminal.

## Structure

```
brew/       Brewfile
git/        .gitconfig, .gitignore_global, gitconfig.local.template
macos/      System preferences scripts
starship/   Shell prompt
terminal/   Terminal.app theme
zsh/        .zshrc
```

## Commands

| Command             | Description          |
| ------------------- | -------------------- |
| `make install`      | Full install         |
| `make install-work` | Skip personal apps   |
| `make macos`        | Apply macOS defaults |
| `make macos-reset`  | Reset macOS defaults |
