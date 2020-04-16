# clipup.sh
# 
# Description: Desk for working on clipup
# 

goto() {
	cd ~/Desktop/Projects/clipup
}

start() {
	goto
	npm start
}

work() {
	goto
	x-terminal-emulator -e "micro src/*"
	x-terminal-emulator -e "micro public/*"
	x-terminal-emulator -e "micro server/*"
}


# start
