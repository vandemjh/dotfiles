# databases.sh
# 
# Description: Desk for working on CS374 SQL
# 

dataLocalhost() {
	ssh -L 5432:data.cs.jmu.edu:5432 vandemjh@stu.cs.jmu.edu
}

run() {
	psql -h localhost -q postgres -U vandemjh < exam2.sql 2>&1 > exam2.txt
}

diff() {
	meld hw6-sol.txt exam2.txt &
}
