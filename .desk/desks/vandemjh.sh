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
}

serve() {
	live-server
}


# start

