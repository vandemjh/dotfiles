# `vandemjh` Dotfiles

## Setup

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare git@github.com:vandemjh/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
```
