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
	live-server
}


start


# gnome-terminal -- bash -c "<my command or script>; exec bash"
# gnome-terminal -- bash -c "source $HOME/.bashrc; cd $HOME/Desktop/Projects/vandemjh.github.io; ma; exec bash"
# exit
# openjs & openhtml

# exit

# xterm -hold -e ls
