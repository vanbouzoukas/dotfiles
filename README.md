# dotfiles

Personal macOS setup. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```sh
git clone https://github.com/vanbouzoukas/dotfiles.git ~/Developer/dotfiles
cd ~/Developer/dotfiles
make install
```

For work machines (skips personal apps): `make install-work`

Automatic Homebrew updates stay quiet, and casks that update themselves are
skipped during upgrades.

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
starship/   Shell prompt
zsh/        .zshrc
```

## Commands

| Command             | Description          |
| ------------------- | -------------------- |
| `make install`      | Full install         |
| `make install-work` | Skip personal apps   |

## Maintaining Homebrew trust

`brew/Brewfile` currently uses only official Homebrew formulae and casks, so
no trust step is needed. If you add one from a non-Homebrew tap, trust it
explicitly with `brew trust --formula <tap>/<formula>` (prefer the specific
formula over the entire tap) — see [Homebrew's Tap Trust
docs](https://docs.brew.sh/Tap-Trust).
