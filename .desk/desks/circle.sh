# circle.sh
# 
# Description: For working on Circle the social media
# 

goto() {
	cd ~/Desktop/Projects/circle
	echo work
}

start() {
	goto
	x-terminal-emulator -e "micro pages/*.js"
	# x-terminal-emulator -e "micro index.html"
}

serve() {
	npm run dev
}


# start

