ALG=insertion

all: compile run
	
compile: 
	g++ -o ./$(ALG) ./$(ALG).cpp

run:
	./$(ALG) inputs/test20K.txt output.txt

clean:
	rm -f $(ALG)
	rm -f Analytics.txt
	rm -f output.txt
