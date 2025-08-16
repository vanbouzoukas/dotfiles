# dotfiles

My personal collection of dotfiles.

## Requirements

- [zsh](http://www.zsh.org/) – Unix shell
- [git](https://git-scm.com/) – version control

## Installation

1. Clone the repo into your home directory:

   ```sh
   git clone git@github.com:your-username/dotfiles.git ~/.dotfiles
   ```

2. Point to the relevant dotfiles in your local config.

   ### `.zshrc`

   Source your custom shell configuration:

   ```sh
   source ~/.dotfiles/zsh/.zshrc
   ```

   ### `.gitconfig`

   Include your Git config and set your user identity:

   ```ini
   [include]
       path = ~/.dotfiles/.gitconfig

   [user]
       name = Your Name
       email = your@email.com
   ```
