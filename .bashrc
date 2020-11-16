# Jack Vandemeulebroecke

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Add custom sources
source $HOME/.shells/misc.sh
source $HOME/.shells/aliases.sh
source $HOME/.shells/functions.sh
source $HOME/.shells/exports.sh
source $HOME/.shells/prompt.sh

# Bash-git-prompt info
# Install at https://github.com/magicmonty/bash-git-prompt
# if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
#     export GIT_PROMPT_ONLY_IN_REPO=1
#     export GIT_PROMPT_SHOW_UPSTREAM=1
#     export GIT_PROMPT_THEME=Minimal
#     source $HOME/.bash-git-prompt/gitprompt.sh
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
