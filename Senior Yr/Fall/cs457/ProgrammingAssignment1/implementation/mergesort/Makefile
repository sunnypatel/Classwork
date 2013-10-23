ALG=mergesort

all: compile run
	
compile: 
	g++ -o ./$(ALG) ./$(ALG).cpp

run:
	#./$(ALG) inputs/test20.txt output.txt
	./$(ALG) tests/sorted/1k output.txt
	./$(ALG) tests/sorted/5k output.txt
	./$(ALG) tests/sorted/10k output.txt
	./$(ALG) tests/sorted/15k output.txt
	./$(ALG) tests/sorted/20k output.txt
	./$(ALG) tests/sorted/25k output.txt
	./$(ALG) tests/sorted/50k output.txt

	./$(ALG) tests/random/1k output.txt
	./$(ALG) tests/random/5k output.txt
	./$(ALG) tests/random/10k output.txt
	./$(ALG) tests/random/15k output.txt
	./$(ALG) tests/random/20k output.txt
	./$(ALG) tests/random/25k output.txt
	./$(ALG) tests/random/50k output.txt

	./$(ALG) tests/reverse/1k output.txt
	./$(ALG) tests/reverse/5k output.txt
	./$(ALG) tests/reverse/10k output.txt
	./$(ALG) tests/reverse/15k output.txt
	./$(ALG) tests/reverse/20k output.txt
	./$(ALG) tests/reverse/25k output.txt
	./$(ALG) tests/reverse/50k output.txt

clean:
	rm -f $(ALG)
