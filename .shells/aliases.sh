# ls aliasses
alias lt='ls --human-readable --size -1 -S --classify'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsa='ls -a'

# Useful for testing .bashrc
alias gogo='source $HOME/.bashrc'

# Open Micro editor with 'm'
alias m='micro'

# Lists most recently updated files in directory
alias recent='ls -t -1'

# Useful for copying to clipboard
alias cb='xclip -sel clip'

# Throws a file in the trash rather than rm
alias tnt='mv --force -t ~/.local/share/Trash '

# For opening stuff easier
alias op='xdg-open'

# Uses the word config and the .cfg directory to keep dotfiles up to date
alias config='/usr/bin/git --git-dir=/home/$USER/.cfg/ --work-tree=/home/$USER'

# Lists most recently updated files in directory
alias recent='ls -t -1'

# Docker
alias docker-rm-all="docker rm \$(docker ps -aq)"

# Start chrome no web security
alias start-chrome-no-web-security="google-chrome --disable-web-security --user-data-dir=\"/tmp/chrome-data\""

alias sshjmu="ssh vandemjh@stu.cs.jmu.edu"
