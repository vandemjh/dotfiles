# graph-algorithms.sh
# 
# Description: Desk for working on 327 PA
# 

cd ~/Desktop/CS327/graph-algorithms

openToWork() {
	x-terminal-emulator -e "micro WeightedMatrixGraph.java DisjointSet.java GraphAlgorithms.java Edge.java"
}

openGiven() {
	x-terminal-emulator -e "micro AdjacencyListGraph.java WeightedGraph.java MazeViewer.java MazePanel.java Graph.java"
}


make() {
	javac MazeViewer.java
}
clean() {
	rm *.class
}
run() {
	make
	java MazeViewer
	clean
}


openToWork
openGiven

