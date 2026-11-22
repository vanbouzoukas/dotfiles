# dotfiles

My macOS setup, managed with [mise](https://mise.jdx.dev): dev tools, apps,
dotfiles and macOS settings.

## New machine

1. Install Git with `xcode-select --install`.
2. Run this, with `P` set to `personal` or `work`:

   ```sh
   P=personal && git clone https://github.com/vanbouzoukas/dotfiles.git ~/Developer/dotfiles && curl -fsSL https://mise.run | sh && mkdir -p ~/.config && ln -sfn ~/Developer/dotfiles/mise ~/.config/mise && echo "env = [\"$P\"]" > ~/.config/mise/miserc.local.toml && ~/.local/bin/mise bootstrap
   ```

   If a dotfile already exists, replace it with `mise dot apply --force`.

3. Open a new terminal and log in to GitHub:

   ```sh
   gh auth login -s admin:ssh_signing_key
   ```

4. Set up commit signing, so GitHub shows commits as Verified. Each Mac has its
   own key, and `git commit` fails until this is done. Choose a passphrase when
   asked; the Keychain remembers it.

   ```sh
   ssh-keygen -t ed25519 -C "29815828+vanbouzoukas@users.noreply.github.com"
   printf 'Host *\n    AddKeysToAgent yes\n    UseKeychain yes\n' >> ~/.ssh/config
   ssh-add --apple-use-keychain ~/.ssh/id_ed25519
   gh ssh-key add ~/.ssh/id_ed25519.pub --type signing
   ```

5. Log out and back in, so the keyboard settings apply.

## Updates

Tools and apps update daily at 7:00, or when the Mac next wakes if it was
asleep. Run `mu` to update now, and `ms` to see the state of everything.

## Structure

```
mise/config.toml           Every machine
mise/config.personal.toml  Personal machines
mise/config.work.toml      Work machines
mise/miserc.local.toml     This machine's profile (not in the repo)
claude/CLAUDE.md           → ~/.claude/CLAUDE.md
claude/settings.json       → ~/.claude/settings.json
zsh/.zshrc                 → ~/.zshrc
git/config, git/ignore     → ~/.config/git/
starship/starship.toml     → ~/.config/starship.toml
```

## Using this yourself

It's tailored to my machines, so fork it and change:

1. `vanbouzoukas` in the clone command to your GitHub username.
2. `name` and `email` in `git/config`, and the email in the `ssh-keygen`
   command.
3. The tools, apps and settings in `mise/` to your taste.
