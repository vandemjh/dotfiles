# webdev.sh
# 
# Description: Desk for working on WebDev stuff
# 

cd ~/Desktop/Projects
toilet Webdev environment

# Opens all js files in directory
openjs() {
	micro *.js
	# gnome-terminal "" & disown
}

# Opens all html files in directory
openhtml() {
	micro *.html
	# gnome-terminal "" & disown
}
