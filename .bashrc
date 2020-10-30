# Jack Vandemeulebroecke

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Add custom sources
source ~/.shells/misc.sh
source ~/.shells/aliases.sh
source ~/.shells/functions.sh
source ~/.shells/exports.sh
source ~/.shells/prompt.sh

# Bash-git-prompt info
# Install at https://github.com/magicmonty/bash-git-prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    export GIT_PROMPT_ONLY_IN_REPO=1
    export GIT_PROMPT_SHOW_UPSTREAM=1
    export GIT_PROMPT_THEME=Minimal
    source $HOME/.bash-git-prompt/gitprompt.sh
fi
