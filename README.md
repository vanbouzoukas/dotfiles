# dotfiles

Personal macOS setup. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```sh
git clone https://github.com/vanbouzoukas/dotfiles.git ~/Developer/dotfiles
cd ~/Developer/dotfiles
make install
```

For work machines (skips personal apps): `make install-work`

Homebrew tap trust is enabled by default in the shell config. The installer also
trusts the specific third-party formulae listed in `install.sh`, so `brew
bundle` and upgrade commands keep working as Homebrew tightens tap trust.

## Post-install

Create your Git identity:

```sh
cp ~/Developer/dotfiles/git/.gitconfig.local.template ~/.gitconfig.local
# Edit with your name and email
```

Then restart your terminal.

## Structure

```
brew/       Brewfile
git/        .gitconfig, .gitignore_global, gitconfig.local.template
macos/      System preferences scripts
starship/   Shell prompt
zsh/        .zshrc
```

## Commands

| Command             | Description          |
| ------------------- | -------------------- |
| `make install`      | Full install         |
| `make install-work` | Skip personal apps   |
| `make macos`        | Apply macOS defaults |
| `make macos-reset`  | Reset macOS defaults |

## Maintaining Homebrew trust

If you add a formula, cask, or command from a non-Homebrew tap to
`brew/Brewfile`, also add the matching `brew trust` entry in `install.sh`.
Prefer trusting the specific formula, cask, or command you use instead of the
entire tap.
