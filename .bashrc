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

if curl -h &> /dev/null; then curl https://wttr.in/?format="%c%t\n"; fi;
