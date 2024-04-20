# ls aliasses
alias lt='ls --human-readable --size -1 -S --classify'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsa='ls -a'

alias watch='watch -n 0.5 --color'

# Useful for testing .bashrc
alias gogo='source $HOME/.bashrc'

# Open Micro editor with 'm'
alias m='micro'

# Lists most recently updated files in directory
alias recent='ls -t -1'

# Throws a file in the trash rather than rm
alias tnt='mv --force -t ~/.local/share/Trash '

# For opening stuff easierss
alias op='xdg-open'

# Uses the word config and the .cfg directory to keep dotfiles up to date
alias config='/usr/bin/git --git-dir=/home/$USER/.cfg/ --work-tree=/home/$USER'

# Lists most recently updated files in directory
alias recent='ls -t -1'

# Docker
alias docker-rm-all="docker rm \$(docker ps -aq)"

# Pipe to clipboard
alias cb="xclip -selection c"

# Start chrome no web security
alias start-chrome-no-web-security="google-chrome --disable-web-security --user-data-dir=\"/tmp/chrome-data\""

# Print the weather
alias weather="if curl -h &> /dev/null; then curl https://wttr.in/?format="%c%t"; echo; fi;"

# Transfer files across local network
alias transfer="tar -cz $1 | nc -q 10 -l -p 54545"
alias recieve="nc -w 10 $1 54545 | tar -xz"
