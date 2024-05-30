# Monitor a file for changes
monitor() {
    local file=$1
    local cmd=$2
    local interval=${3:-1} # Default interval of 2 seconds

    if [[ ! -e "$file" ]]; then
        echo "File does not exist: $file"
        return 1
    fi

    local last_shasum=$(shasum "$file" | awk '{ print $1 }')

    function p() {
   		clear
   		echo -e "Last updated: `date`"
   		eval "$cmd"
    }
    p

    while true; do
        sleep $interval
        if [[ ! -e "$file" ]]; then
            echo "File deleted: $file"
            return 1
        fi
       	local current_shasum=$(shasum "$file" | awk '{ print $1 }')
        if [[ "$last_shasum" != "$current_shasum" ]]; then
        	last_shasum="$current_shasum"
        	p
        fi
    done
}

# Helper function to tell if arg is a number
function isnum() {
	if [ -n "$1" ]; then
		return 0
	fi
	return 1
}

function json() {
	node -p "util.inspect(JSON.parse(require('fs').readFileSync(0)), false, 5, true)"
}

# Round stdin to $1 decimal places
function round() {
	local input=$(</dev/stdin)
	if ! `isnum $1`; then
		echo "$1 cannot be rounded to a number" >&2
		return 1
	fi
	if ! `isnum $1`; then
		echo "$input cannot be rounded to a number" >&2
	fi
	printf "%.${1:-0}f" "$input"
}

# Progress bar for $1 things out of a total of $2 things
function progress() {
	local total=$2
	local current=$1
	local totalCols=`tput cols`
	local cols=$(($totalCols - 3))
	local full=""
}

function extract() {
   if [ -f $1 ] ; then
   case $1 in
     *.tar.bz2)   tar xjf $1   ;;
     *.tar.gz)   tar xzf $1   ;;
     *.bz2)   bunzip2 $1   ;;
     *.rar)   rar x $1   ;;
     *.gz)   gunzip $1   ;;
     *.tar)   tar xf $1   ;;
     *.tbz2)   tar xjf $1   ;;
     *.tgz)   tar xzf $1   ;;
     *.zip)   unzip $1   ;;
     *.Z)   uncompress $1   ;;
     *)     echo "'$1' cannot be extracted via extract()" ;;
     esac
   else
   echo "'$1' is not a valid file"
   fi
}

function compress() {
	tar cfz $1.tgz $1/*
}

# Generates a random 
function genpass() {
	# Random gens may not include symbol
	range="\!@#$%^&{}()[]|~*A-Z-a-z-0-9"
	if [[ $1 =~ ^[0-9]+$ ]]; then
		cat /dev/urandom | tr -dc $range | head -c $1
	else
		cat /dev/urandom | tr -dc $range | head -c 32
	fi
}

function up() {
  for i in `seq 1 $1`;
  do
   cd ../
  done;
}

# capture the output of a command so it can be retrieved with ret
function cap () { tee /tmp/capture.out; }

# return the output of the most recent command that was captured by cap
function ret () { cat /tmp/capture.out; }

# Gives a random emoji from the list
# I can add more emojis here
function emoji() {
	local EMOJIS=(
		😎
		😀
		😃
		😁
		😆
		💥
		💯
		🍇
		🍈
		🍉
		🍊
		🍋
		🍌
		🍍
		🥭
		🍎
		🍏
		🍐
		🍑
		🍒
		🍓
		🥝
		🍅
		🥥
		🥑
		🍆
		🥔
		🥕
		🌽
		🌶️ 
		🥒
		🥬
		🥦
		🍄
		🥜
		🌰
		🍞
		🥐
		🥖
		🥨
		🥯
		🥞
		🧀
		🍖
		🍗
		🥩
		🥓
		🍔
		🍟
		🍕
		🌭
		🥪
		🌮
		🌯
		🥙
		🥚
		🍳
		🥘
		🍲
		🥣
		🥗
		🍿
		🧂
		🥫
		🍱
		🍘
		🍙
		🍚
		🍛
		🍜
		🍝
		🍠
		🍢
		🍣
		🍤
		🍥
		🥮
		🍡
		🥟
		🥠
		🥡
		🍦
		🍧
		🍨
		🍩
		🍪
		🎂
		🍰
		🧁
		🥧
		🍫
		🍬
		🍭
		🍮
		🍯
		🍼
		🥛
		☕
		🍵
		🍶
		🍾
		🍷
		🍸
		🍹
		🍺
		🍻
		🥂
		🥃
		🥤 
	);
	echo ${EMOJIS[$RANDOM % ${#EMOJIS[@]}]}
}
