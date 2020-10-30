# Colors
export FORMAT_BOLD='\[$(tput bold)\]'
export FORMAT_RESET='\[$(tput sgr0)\]'
export COLOR_RESET='\e[0m'
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

function set_bash_prompt() {
	local CUR_EXIT=$?
	local CHECK=""
	local HEADER=`echo -en "\033]0;$(whoami)@$(hostname):/~/$(pwd|cut -d "/" -f 4-100)\a"`
	
	if [ $CUR_EXIT -ne 0 ]; then
		CHECK="${COLOR_RED}✗${COLOR_RESET}"
	else
		CHECK="${COLOR_GREEN}✓${COLOR_RESET}"
	fi
    PS1="${HEADER}╭╴ ${FORMAT_BOLD}${COLOR_YELLOW}\w${RESET} ${CHECK}\n╰─➤ ${RESET}"
}

export PROMPT_COMMAND=set_bash_prompt

