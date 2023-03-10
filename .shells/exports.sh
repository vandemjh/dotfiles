# Sets Micro as the default editor
export EDITOR=micro
export VISUAL=micro

# GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Jump
if jump --version &> /dev/null; then
	eval "$(jump shell)"
fi

# Node exports
export NODE_OPTIONS=--max_old_space_size=4096

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export LANG=C.UTF-8 # or any UTF-8 English locale supported by your OS may be used

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/`whoami`/.miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/`whoami`/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/`whoami`/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/`whoami`/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Adds inputrc file from home
# export INPUTRC=~/.inputrc
# source ~/.inputrc
