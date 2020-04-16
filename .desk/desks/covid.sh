# covid.sh
# 
# Description: Desk for working on the covid tracker
# 

# Sends you to the working dir
goto() {
	cd ~/Desktop/Projects/covid-19-grapher
}

# To start working
start() {
	goto
	x-terminal-emulator -e "micro graph.py predict.py"
	x-terminal-emulator -e "micro index.html"
	x-terminal-emulator -e "live-server"
}

# Runs the python
run() {
	python3 graph.py
}

start
