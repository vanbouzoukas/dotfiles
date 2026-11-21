# dotfiles

My macOS setup, managed with [mise](https://mise.jdx.dev): dev tools, apps,
dotfiles and macOS settings.

## Using this yourself

It's tailored to my machines, so fork it and change:

1. `vanbouzoukas` in the command below to your GitHub username.
2. `name` and `email` in `git/config`, and the email in the `ssh-keygen`
   command under Signing commits.
3. The tools, apps and settings in `mise/` to your taste.

## New machine

Install Git with `xcode-select --install`, then run this with `P` set to
`personal` or `work`:

```sh
P=personal && git clone https://github.com/vanbouzoukas/dotfiles.git ~/Developer/dotfiles && curl -fsSL https://mise.run | sh && mkdir -p ~/.config && ln -sfn ~/Developer/dotfiles/mise ~/.config/mise && echo "env = [\"$P\"]" > ~/.config/mise/miserc.local.toml && ~/.local/bin/mise bootstrap
```

When it finishes, open a new terminal, log in to GitHub with `gh auth login`,
and log out and back in. If a dotfile already exists, replace it with
`mise dot apply --force`.

## Signing commits

Commits are signed so GitHub shows them as Verified. Until you do this on a new
Mac, `git commit` fails. Each Mac has its own key:

1. `ssh-keygen -t ed25519 -C "29815828+vanbouzoukas@users.noreply.github.com"`,
   with a passphrase.
2. Add this to `~/.ssh/config`, then run
   `ssh-add --apple-use-keychain ~/.ssh/id_ed25519` to store the passphrase in
   the Keychain:

   ```
   Host *
       AddKeysToAgent yes
       UseKeychain yes
   ```

3. `gh auth refresh -h github.com -s admin:ssh_signing_key`, then
   `gh ssh-key add ~/.ssh/id_ed25519.pub --type signing`.

## Structure

```
mise/config.toml           Every machine
mise/config.personal.toml  Personal machines
mise/config.work.toml      Work machines
mise/miserc.local.toml     This machine's profile (not in the repo)
claude/settings.json       → ~/.claude/settings.json
zsh/.zshrc                 → ~/.zshrc
git/config, git/ignore     → ~/.config/git/
starship/starship.toml     → ~/.config/starship.toml
```

## Updates

Tools and apps update daily at 7:00, or when the Mac next wakes if it was
asleep. Run `mu` to update now, and `ms` to see the state of everything.
