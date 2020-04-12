# prose.sh
# 
# Description: Desk for working on CS374 Group Project
# 


cd ~/Desktop/CS374/prose/webapp
# micro webapp/avg_occ_each_day.html webapp/avg_occ_each_day.sql.
# gnome-terminal -x bash -c "asdf" --Depricated

dataLocalhost() {
	ssh -L 5432:data.cs.jmu.edu:5432 vandemjh@stu.cs.jmu.edu
}

# cd ..
# gnome-terminal & disown
