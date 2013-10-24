ALG=mergesort

all: clean compile run
	
compile: 
	g++ -o ./$(ALG) ./$(ALG).cpp

run:
	./$(ALG) inputs/test20.txt output.txt

clean:
	rm -f $(ALG)
	rm -f output.txt
	rm -f Analytics.txt
