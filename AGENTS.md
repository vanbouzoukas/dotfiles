# AGENTS.md

macOS setup managed with mise. See README.md for the layout and bootstrap command.

## Principles

- Less is more. Keep the defaults of macOS, apps and tools unless there's a
  clear reason to change one.
- Stay close to standards and conventions, not custom setups.
- Use only what mise offers out of the box. No custom scripts or workarounds.

## Where things go

- `mise/config.toml`: every machine. `mise/config.personal.toml`: personal Macs
  only. `mise/config.work.toml`: work Macs only.
- Apps are `brew-cask:` entries in `[bootstrap.packages]`. mise installs casks
  itself and Homebrew is not installed, so there is no `brew` command. Use
  `mise bootstrap packages status` instead of `brew list`.
- App Store apps are installed by hand from the App Store's Purchased page, not
  through mas.

## Editing the configs

- Keep the entries in every section sorted alphabetically. Commands like
  `mise bootstrap packages use` append to the end, so move the new line into
  place.
- For macOS settings, use only mise's named options (`[bootstrap.macos.finder]`,
  `dock`, `keyboard`, `trackpad`). Never use raw `[bootstrap.macos.defaults]`
  or `defaults_entries`. If mise has no named option for a setting, leave it
  to System Settings.
- Comments are short and say why, not what.
- After changing macOS settings, check them with
  `mise bootstrap macos defaults status`.
- Keep the README one-liner safe to run twice (for example `ln -sfn`, not
  `ln -s`).

## Temporary apps

- Install: `mise bootstrap packages use -g brew-cask:<name>`, and don't commit
  the line it adds.
- Remove: delete the line, then `mise bootstrap packages prune -m brew-cask`.
  mise skips casks whose uninstall step quits the app or stops a launchd job,
  so remove those apps and their leftover files by hand.

## Commits

- Only commit when asked.
- Angular convention, no scope: `feat:`, `fix:` or `refactor:`, then a subject
  in the imperative whose first word is lowercase. Names keep their capitals,
  as in `feat: install Perplexity on personal Macs`.
