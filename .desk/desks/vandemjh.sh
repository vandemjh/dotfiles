# vandemjh.sh
# 
# Description: Desk for working on my website
# 

cd ~/Desktop/Projects/vandemjh.github.io
echo work

start() {
	x-terminal-emulator -e "micro app.js"
	x-terminal-emulator -e "micro index.html"
}


start


# gnome-terminal -- bash -c "<my command or script>; exec bash"
# gnome-terminal -- bash -c "source $HOME/.bashrc; cd $HOME/Desktop/Projects/vandemjh.github.io; ma; exec bash"
# exit
# openjs & openhtml

# exit

# xterm -hold -e ls
