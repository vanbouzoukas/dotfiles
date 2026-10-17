# dotfiles

My macOS setup, managed with [mise](https://mise.jdx.dev): dev tools, apps,
dotfiles and macOS settings.

## Using this yourself

It's tailored to my machines, so fork it and change:

1. `vanbouzoukas` in the command below to your GitHub username.
2. `name` and `email` in `git/config`.
3. The tools, apps and settings in `mise/` to your taste.

## New machine

Sign in to the App Store and install Git with `xcode-select --install`. Then
run this, with `P` set to `personal` or `work`:

```sh
P=personal && git clone https://github.com/vanbouzoukas/dotfiles.git ~/Developer/dotfiles && curl -fsSL https://mise.run | sh && mkdir -p ~/.config && ln -s ~/Developer/dotfiles/mise ~/.config/mise && echo "env = [\"$P\"]" > ~/.config/mise/miserc.local.toml && ~/.local/bin/mise bootstrap
```

When it finishes, open a new terminal and run `mise bootstrap` again to
install the App Store apps, then log out and back in. If a dotfile already exists, replace it with
`mise dot apply --force`.

## Structure

```
mise/config.toml           Every machine
mise/config.personal.toml  Personal machines
mise/config.work.toml      Work machines
mise/miserc.local.toml     This machine's profile (not in the repo)
zsh/.zshrc                 → ~/.zshrc
git/config, git/ignore     → ~/.config/git/
starship/starship.toml     → ~/.config/starship.toml
```

## Updates

Tools and apps update daily at 7:00. Run `mu` to update now, and `ms` to see
the state of everything.
