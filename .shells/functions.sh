function extract () {
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
