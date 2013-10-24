ALG=quicksort

all: compile run
	
compile: 
	g++ -o ./$(ALG) ./$(ALG).cpp

run:
	./$(ALG) inputs/test20.txt output.txt

clean:
	rm -f $(ALG)
	rm -f Analytics.txt
	rm -f output.txt
