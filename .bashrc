# Jack Vandemeulebroecke

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Add custom sources
source $HOME/.shells/misc.sh
source $HOME/.shells/aliases.sh
source $HOME/.shells/functions.sh
source $HOME/.shells/exports.sh
source $HOME/.shells/prompt.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# if curl -h &> /dev/null; then curl https://wttr.in/?format="%c%t\n"; fi;

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/.miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vandemjh/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/vandemjh/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/vandemjh/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
