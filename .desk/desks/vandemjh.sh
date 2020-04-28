# vandemjh.sh
# 
# Description: Desk for working on my website
# 

goto() {
	cd ~/Desktop/Projects/vandemjh.github.io
	echo work
}

start() {
	goto
	x-terminal-emulator -e "micro app.js"
	x-terminal-emulator -e "micro index.html"
	x-terminal-emulator -e "micro css/style.css"
}

serve() {
	goto
	live-server
}

goto
# start
# serve
