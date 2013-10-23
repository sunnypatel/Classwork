ALG=heapsort

all: clean compile run
	
compile: 
	g++ -o ./$(ALG) ./$(ALG).cpp

run:
	#./$(ALG) inputs/test20.txt output.txt
	echo "-- Starting $(ALG) sort --" >> Analytics.txt
	echo "Run time (in milliseconds) of array sizes of (1K, 5K, 10K, 15K, 20K, 25K, 50K)  " >> Analytics.txt 
	
	echo " " >> Analytics.txt
	echo "Sorted Arrays" >> Analytics.txt
	./$(ALG) tests/sorted/1k output.txt
	./$(ALG) tests/sorted/5k output.txt
	./$(ALG) tests/sorted/10k output.txt
	./$(ALG) tests/sorted/15k output.txt
	./$(ALG) tests/sorted/20k output.txt
	./$(ALG) tests/sorted/25k output.txt
	./$(ALG) tests/sorted/50k output.txt

	echo " " >> Analytics.txt
	echo "Random ordered Arrays " >> Analytics.txt
	./$(ALG) tests/random/1k output.txt
	./$(ALG) tests/random/5k output.txt
	./$(ALG) tests/random/10k output.txt
	./$(ALG) tests/random/15k output.txt
	./$(ALG) tests/random/20k output.txt
	./$(ALG) tests/random/25k output.txt
	./$(ALG) tests/random/50k output.txt

	echo " " >> Analytics.txt
	echo "Reverse ordered Arrays " >> Analytics.txt
	./$(ALG) tests/reverse/1k output.txt
	./$(ALG) tests/reverse/5k output.txt
	./$(ALG) tests/reverse/10k output.txt
	./$(ALG) tests/reverse/15k output.txt
	./$(ALG) tests/reverse/20k output.txt
	./$(ALG) tests/reverse/25k output.txt
	./$(ALG) tests/reverse/50k output.txt
clean:
	rm -f $(ALG)
	rm -f Analytics.txt
	rm -f output.txt
