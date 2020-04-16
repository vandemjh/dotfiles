# tiling.sh
# 
# Description: Desk for working on tiling app
# 

goto() {
	cd /opt/lampp/htdocs/tiling
	echo work
}

start() {
	goto
	x-terminal-emulator -e "micro createRGBArray.php index.php tiling.php utils.php"
	# x-terminal-emulator -e "micro index.html"
}

serve() {
	x-terminal-emulator -e "sudo /opt/lampp/lampp start"
}


# start

