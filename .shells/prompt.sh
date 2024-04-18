function addSpace() {
	local noSpace="$1 | xargs"
	if [ "$1" != "" ] && [ "$1" != "0" ]; then
		echo " $1";
	fi
}
	
# Cool symbols for later...
# ⎇
# ☇
# ⚛
# ⚠
# ⛃
# ★
# ♨
# ▁▂▃▄▅▆▇█
function set_bash_prompt() {
	local CUR_EXIT=$?
	# Colors
	local FORMAT_BOLD='\[$(tput bold)\]'
	local FORMAT_ITALICS='\[$(tput sitm)\]'
	local FORMAT_RESET='\[$(tput sgr0)\]'
	local FORMAT_LIGHT_BLUE_HIGHLIGHT='\[$(tput setab 12)\]'
	local FORMAT_LIGHT_LIGHT_PURPLE_HIGHLIGHT='\[$(tput setab 5)\]'
	local COLOR_RESET='\e[0m'
	local COLOR_WHITE='\e[1;37m'
	local COLOR_BLACK='\e[0;30m'
	local COLOR_BLUE='\e[0;34m'
	local COLOR_LIGHT_BLUE='\e[1;34m'
	local COLOR_GREEN='\e[0;32m'
	local COLOR_LIGHT_GREEN='\e[1;32m'
	local COLOR_CYAN='\e[0;36m'
	local COLOR_LIGHT_CYAN='\e[1;36m'
	local COLOR_RED='\e[0;31m'
	local COLOR_LIGHT_RED='\e[1;31m'
	local COLOR_PURPLE='\e[0;35m'
	local COLOR_LIGHT_MAGENTA='\e[1;95m'
	local COLOR_MAGENTA='\e[1;35m'
	local COLOR_BROWN='\e[0;33m'
	local COLOR_YELLOW='\e[1;33m'
	local COLOR_GRAY='\e[0;30m'
	local COLOR_LIGHT_GRAY='\e[0;37m'
	local RESET_ALL='\[$(tput sgr0)\]'
	# Git constants
	local HASH_LENGTH=8;
	
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
		local GIT_BRANCH="`git rev-parse --abbrev-ref --symbolic-full-name HEAD 2> /dev/null`"
		# If detatched just show nothing
		if [ "$GIT_BRANCH" == "HEAD" ]; then
			GIT_BRANCH=""
		fi
		local GIT_BRANCH_FORMATTED="${COLOR_LIGHT_CYAN}${FORMAT_BOLD}$GIT_BRANCH${RESET_ALL}"
		local GIT_FULL_DIR_FORMATTED_START="$BLOCKY_START${FORMAT_LIGHT_BLUE_HIGHLIGHT}${COLOR_YELLOW}${FORMAT_BOLD}$GIT_FULL_DIR"
		local GIT_FULL_DIR_FORMATTED_END="${COLOR_LIGHT_BLUE}${FORMAT_LIGHT_LIGHT_PURPLE_HIGHLIGHT}${RESET_ALL}$BLOCKY_END"
		local GIT_STASHES=""
		local NUMBER_OF_STASHES=`git stash list | wc -l | xargs`
		if [ "$NUMBER_OF_STASHES" != "" ] && [ "$NUMBER_OF_STASHES" != "0" ]; then
			GIT_STASHES="${COLOR_LIGHT_BLUE}⚑$NUMBER_OF_STASHES${RESET_ALL}"
		fi
		local GIT_NEW_FILES=""
		local GIT_MERGING=`git rev-list -1 MERGE_HEAD 2> /dev/null`
		if [ "$GIT_MERGING" == "" ]; then
			local NUMBER_OF_NEW_FILES=`git ls-files --others --exclude-standard | wc -l | xargs 2> /dev/null`
			if [ "$NUMBER_OF_NEW_FILES" != "" ] && [ "$NUMBER_OF_NEW_FILES" != "0" ]; then
				GIT_NEW_FILES+="${COLOR_LIGHT_GREEN}+$NUMBER_OF_NEW_FILES${RESET_ALL}"
			fi
			local GIT_NEW_TO_BE_COMMITTED=`git diff --cached --numstat | wc -l | xargs 2> /dev/null`
			if [ "$GIT_NEW_TO_BE_COMMITTED" != "" ] && [ "$GIT_NEW_TO_BE_COMMITTED" != "0" ]; then
				GIT_NEW_FILES+="${COLOR_YELLOW}+$GIT_NEW_TO_BE_COMMITTED${RESET_ALL}"
			fi
			local NUMBER_OF_CHANGED_FILES=`git diff --name-only | wc -l | xargs`
			local GIT_CHANGED_FILES=""
			if [ "$NUMBER_OF_CHANGED_FILES" != "" ] && [ "$NUMBER_OF_CHANGED_FILES" != "0" ]; then
				GIT_CHANGED_FILES="${COLOR_BROWN}Δ$NUMBER_OF_CHANGED_FILES${RESET_ALL}"
			fi
		else
			GIT_MERGING=${COLOR_RED}∪:`echo $GIT_MERGING | head -c$HASH_LENGTH`${RESET_ALL}
		fi
		local GIT_COMMITS_AHEAD=""
		local GIT_COMMITS_BEHIND=""
		local GIT_REMOTE=""
		local IS_UPSTREAM=`git rev-parse --abbrev-ref $GIT_BRANCH@{upstream} 2> /dev/null`
		if [ "$IS_UPSTREAM" != "" ]; then
			local GIT_UPSTREAM=`git rev-parse --abbrev-ref $GIT_BRANCH@{upstream} 2> /dev/null`
			GIT_REMOTE="${COLOR_WHITE}❰${RESET_ALL}${COLOR_LIGHT_MAGENTA}$GIT_UPSTREAM"
			GIT_REMOTE="$GIT_REMOTE${RESET_ALL}${COLOR_WHITE}❱${RESET_ALL}"
			local GIT_NUMBER_OF_COMMITS_AHEAD=`git rev-list --count $GIT_UPSTREAM/$GIT_BRANCH..$GIT_BRANCH 2> /dev/null`
			if [ "$GIT_NUMBER_OF_COMMITS_AHEAD" != "" ] && [ "$GIT_NUMBER_OF_COMMITS_AHEAD" != "0" ]; then
				GIT_COMMITS_AHEAD="↑$GIT_NUMBER_OF_COMMITS_AHEAD"
			fi
			local GIT_NUMBER_OF_COMMITS_BEHIND=`git rev-list --count $GIT_BRANCH..$GIT_UPSTREAM/$GIT_BRANCH 2> /dev/null`
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
		GIT_MERGING="`addSpace "$GIT_MERGING"`"
		GIT_COMMITS_BEHIND_AHEAD="`addSpace "$GIT_COMMITS_BEHIND_AHEAD"`"
		GIT_BUILDER+=$GIT_FULL_DIR_FORMATTED_START
		GIT_BUILDER+=$GIT_FULL_DIR_FORMATTED_END
		GIT_BUILDER+=$GIT_BRANCH_FORMATTED
		GIT_BUILDER+=$GIT_REMOTE
		GIT_CHECK_CHANGES_EMOJI="$GIT_BUILDER"
		GIT_BUILDER+=$GIT_MERGING
		GIT_BUILDER+=$GIT_STASHES
		GIT_BUILDER+=$GIT_CHANGED_FILES
		GIT_BUILDER+=$GIT_NEW_FILES
		GIT_BUILDER+=$GIT_COMMITS_BEHIND_AHEAD
		# Adds an emoji if there are no changes, stashes, or commits behind / ahead
		if [ "$GIT_CHECK_CHANGES_EMOJI" == "$GIT_BUILDER" ]; then
			GIT_BUILDER="$GIT_BUILDER`addSpace $(emoji "$GIT_BUILDER")`"
		fi
		HEADER="\[\033]0;$GIT_FULL_DIR\a\]"
		CORE=$GIT_BUILDER
	else
		HEADER="\[\033]0;$(whoami)@$(hostname):/~/$(pwd|cut -d "/" -f 4-100)\a\]"
	fi
	local CHECK=""
	if [ $CUR_EXIT -ne 0 ]; then
		EXIT_TEXT="- $CUR_EXIT"		
		case $CUR_EXIT in
		  1)
			EXIT_TEXT="Error"
		    ;;
		  126)
			EXIT_TEXT="Cannot exec"
		    ;;
		  127)
			EXIT_TEXT="Not found"
		    ;;
   		  128)
			EXIT_TEXT="Invalid"
		  	;;
		  129)
			EXIT_TEXT="SIGHUP"
		  	;;
		  130)
			EXIT_TEXT="Killed"
		  	;;		  
	  	  131)
			EXIT_TEXT="SIGQUIT"
		  	;;
		  132)
			EXIT_TEXT="SIGABRT"
		  	;;
		  137)
			EXIT_TEXT="SIGKILL"
		  	;;
		  143)
			EXIT_TEXT="SIGTERM"
		  	;;
		  139)
			EXIT_TEXT="SIGV"
		    ;;
		esac
		EXIT_TEXT="`addSpace "$EXIT_TEXT"`"	
		CHECK="${COLOR_RED}✘${EXIT_TEXT}${RESET_ALL}"
	else
		CHECK="${COLOR_GREEN}✔${RESET_ALL}"
	fi
    PS1="${HEADER}╭${CORE} ${CHECK}\n╰─ᐅ ${RESET_ALL}"
}

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND} set_bash_prompt;"
