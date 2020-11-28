# Colors
export FORMAT_BOLD='\[$(tput bold)\]'
export FORMAT_ITALICS='\[$(tput sitm)\]'
export FORMAT_RESET='\[$(tput sgr0)\]'
export FORMAT_LIGHT_BLUE_HIGHLIGHT='\[$(tput setab 12)\]'
export FORMAT_LIGHT_LIGHT_PURPLE_HIGHLIGHT='\[$(tput setab 5)\]'
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
export COLOR_LIGHT_MAGENTA='\e[1;95m'
export COLOR_MAGENTA='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export RESET_ALL='\[$(tput sgr0)\]\e[0m'

function addSpace() {
	if [ "$1" != "" ]; then
		echo " $1";
	fi
}

# Add option to show time in prompt
export PROMPT_SHOW_TIME="true"

# Cool symbols for later...
# ⎇
# ▁▂▃▄▅▆▇█
function set_bash_prompt() {
	local CUR_EXIT=$?
	local GIT_BUILDER="";
	local HEADER="";
	local CORE="${FORMAT_BOLD}${COLOR_YELLOW} \w${RESET_ALL}"
	local IS_INSIDE_GIT_DIR=`git rev-parse --show-toplevel 2> /dev/null`
	if [ "$IS_INSIDE_GIT_DIR" != "" ]; then 
		local GIT_DIR=`basename $(git rev-parse --show-toplevel)`
		local GIT_FULL_DIR=$GIT_DIR/`git rev-parse --show-prefix`
		GIT_FULL_DIR="${GIT_FULL_DIR%/}"
		local BLOCKY_START="┤${COLOR_LIGHT_BLUE}░▒▓${RESET_ALL}"
		local BLOCKY_END="${COLOR_LIGHT_BLUE}▓▒░${RESET_ALL}"
		local GIT_BRANCH="`git symbolic-ref --short HEAD`"
		local GIT_BRANCH_FORMATTED="${COLOR_LIGHT_CYAN}${FORMAT_BOLD}$GIT_BRANCH${RESET_ALL}"
		local GIT_FULL_DIR_FORMATTED_START="$BLOCKY_START${FORMAT_LIGHT_BLUE_HIGHLIGHT}${COLOR_YELLOW}${FORMAT_BOLD}$GIT_FULL_DIR"
		local GIT_FULL_DIR_FORMATTED_END="${COLOR_LIGHT_BLUE}${FORMAT_LIGHT_LIGHT_PURPLE_HIGHLIGHT}${RESET_ALL}$BLOCKY_END"
		local GIT_STASHES=""
		local NUMBER_OF_STASHES="`git stash list | wc -l`"
		if [ "$NUMBER_OF_STASHES" != "" ] && [ "$NUMBER_OF_STASHES" != "0" ]; then
			GIT_STASHES="${COLOR_MAGENTA}⚑$NUMBER_OF_STASHES${RESET_ALL}"
		fi
		local GIT_REMOTE=""
		local IS_UPSTRAM=`git rev-parse --abbrev-ref $GIT_BRANCH@{upstream} 2> /dev/null`
		if [ "`git remote show`" != "" ] && [ "$IS_UPSTRAM" != "" ]; then
			GIT_REMOTE="${COLOR_WHITE}❰${RESET_ALL}${COLOR_LIGHT_MAGENTA}`git rev-parse --abbrev-ref $GIT_BRANCH@{upstream}`"
			GIT_REMOTE="$GIT_REMOTE${RESET_ALL}${COLOR_WHITE}❱${RESET_ALL}"
		fi
		local GIT_NEW_FILES=""
		local NUMBER_OF_NEW_FILES="`git ls-files --others --exclude-standard | wc -l`"
		if [ "$NUMBER_OF_NEW_FILES" != "" ] && [ "$NUMBER_OF_NEW_FILES" != "0" ]; then
			GIT_NEW_FILES="${COLOR_LIGHT_GREEN}+$NUMBER_OF_NEW_FILES${RESET_ALL}"
		fi
		local NUMBER_OF_CHANGED_FILES="`git diff --name-only | wc -l`"
		local GIT_CHANGED_FILES=""
		if [ "$NUMBER_OF_CHANGED_FILES" != "" ] && [ "$NUMBER_OF_CHANGED_FILES" != "0" ]; then
			GIT_CHANGED_FILES="${COLOR_BROWN}Δ$NUMBER_OF_CHANGED_FILES${RESET_ALL}"
		fi
		local GIT_COMMITS_AHEAD=""
		local GIT_COMMITS_BEHIND=""
		if [ "$IS_UPSTRAM" != "" ]; then
			local GIT_NUMBER_OF_COMMITS_AHEAD="`git rev-list --count origin/$GIT_BRANCH..$GIT_BRANCH`"
			if [ "$GIT_NUMBER_OF_COMMITS_AHEAD" != "" ] && [ "$GIT_NUMBER_OF_COMMITS_AHEAD" != "0" ]; then
				GIT_COMMITS_AHEAD="↑$GIT_NUMBER_OF_COMMITS_AHEAD"
			fi
			local GIT_NUMBER_OF_COMMITS_BEHIND="`git rev-list --count $GIT_BRANCH..origin/$GIT_BRANCH`"
			if [ "$GIT_NUMBER_OF_COMMITS_BEHIND" != "" ] && [ "$GIT_NUMBER_OF_COMMITS_BEHIND" != "0" ]; then
				GIT_COMMITS_BEHIND="↓$GIT_NUMBER_OF_COMMITS_BEHIND"
			fi
		fi
		local GIT_COMMITS_BEHIND_AHEAD=$GIT_COMMITS_BEHIND$GIT_COMMITS_AHEAD
		GIT_STASHES="`addSpace "$GIT_STASHES"`"
		GIT_BRANCH_FORMATTED="`addSpace "$GIT_BRANCH_FORMATTED"`"
		GIT_CHANGED_FILES="`addSpace "$GIT_CHANGED_FILES"`"
		GIT_NEW_FILES="`addSpace "$GIT_NEW_FILES"`"
		GIT_REMOTE="`addSpace "$GIT_REMOTE"`"
		GIT_COMMITS_BEHIND_AHEAD="`addSpace "$GIT_COMMITS_BEHIND_AHEAD"`"
		GIT_BUILDER=$GIT_BUILDER$GIT_FULL_DIR_FORMATTED_START
		GIT_BUILDER=$GIT_BUILDER$GIT_FULL_DIR_FORMATTED_END
		GIT_BUILDER=$GIT_BUILDER$GIT_BRANCH_FORMATTED
		GIT_BUILDER=$GIT_BUILDER$GIT_REMOTE
		GIT_CHECK_CHANGES_EMOJI="$GIT_BUILDER"
		GIT_BUILDER=$GIT_BUILDER$GIT_STASHES
		GIT_BUILDER=$GIT_BUILDER$GIT_CHANGED_FILES
		GIT_BUILDER=$GIT_BUILDER$GIT_NEW_FILES
		GIT_BUILDER=$GIT_BUILDER$GIT_COMMITS_BEHIND_AHEAD
		# Adds an emoji if there are no changes, stashes, or commits behind / ahead
		if [ "$GIT_CHECK_CHANGES_EMOJI" == "$GIT_BUILDER" ]; then
			GIT_BUILDER="$GIT_BUILDER`addSpace $(emoji "$GIT_BUILDER")`"
		fi
		HEADER=`echo -en "\033]0;$GIT_FULL_DIR\a"`
		CORE=$GIT_BUILDER
	else
		HEADER=`echo -en "\033]0;$(whoami)@$(hostname):/~/$(pwd|cut -d "/" -f 4-100)\a"`
	fi
	local CHECK=""
	if [ $CUR_EXIT -ne 0 ]; then
		local EXIT_TEXT="-$CUR_EXIT"
		if [ $CUR_EXIT -eq "127" ]; then
			EXIT_TEXT=" Not found"
		elif [ $CUR_EXIT -eq "1" ]; then
			EXIT_TEXT=" Error"
		elif [ $CUR_EXIT -eq "139" ]; then
			EXIT_TEXT=" SIGV"
		fi
		CHECK="${COLOR_RED}✘$EXIT_TEXT${RESET_ALL}"
	else
		CHECK="${COLOR_GREEN}✔${RESET_ALL}"
	fi
    PS1="${HEADER}\[╭\]${CORE} ${CHECK}\n\[╰─ᐅ \]${RESET_ALL}"
}

export PROMPT_COMMAND=set_bash_prompt
