# Sets Micro as the default editor
export EDITOR=micro
export VISUAL=micro

# GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Jump
if jump --version >> /dev/null ; then
	eval "$(jump shell)"
fi

# Node exports
export NODE_OPTIONS=--max_old_space_size=4096

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export LANG=C.UTF-8 # or any UTF-8 English locale supported by your OS may be used

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Adds inputrc file from home
# export INPUTRC=~/.inputrc
# source ~/.inputrc
