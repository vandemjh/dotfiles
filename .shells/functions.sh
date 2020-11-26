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
	if [ "$2" != "" ]; then		
		tar -czf "$2.tar" "$1"
	else
		tar -czf "$1.tar" "$1"
	fi
}

function up()
{
  for i in `seq 1 $1`;
  do
  	cd ../
  done;
}

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
	echo "${EMOJIS[$RANDOM % ${#EMOJIS[@]}]}"
}
