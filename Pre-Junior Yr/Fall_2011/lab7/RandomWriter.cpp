/*
 * File: RandomWriter.cpp
 * ----------------------
 * Name: [TODO: enter name here]
 * Section: [TODO: enter section leader here]
 * This file is the starter project for the random writer problem
 * on Assignment #2.
 * [TODO: extend the documentation]
 */

#include "genlib.h"
#include "simpio.h"
#include "random.h"
#include "vector.h"
#include "map.h"
#include <iostream>
#include <fstream>

bool openFile(ifstream &infile, string filename);
char nextChar(ifstream &infile);
string readSeedFromFile(ifstream &infile, int seedValue);
inline void addNewChar(Map<Vector<char> > &theKeys, string seedValue, char insertChar);
void setupKeys(Map<Vector<char> > &theKeys, ifstream &infile, int seed);
void outputMarkov(Map<Vector<char> > &theKeys, string startKey);
string obtainAMaxKey(Map<Vector<char> > &theKeys);

int main() {
	string filename="";
	int seed;
	Map<Vector<char> > theKeys;
	ifstream infile;

	while (true)
	{
		cout << "Please enter filename to open : ";
		filename = GetLine();
		if (openFile(infile, filename)) break;
	}

	while (true)
	{
		cout << "What order of analysis ? (a number between 1 - 10) : ";
		seed = GetInteger();
		if (seed >=1 && seed <=10) break;
	}

	cout << "Analysis.... please wait " << endl;
	// read in the rest of the file
	setupKeys(theKeys,infile,seed);
	infile.close();

	// get the first highest maximum 
	string maxKey = obtainAMaxKey(theKeys);

	// start the output
	cout << maxKey;
	// output the rest of the markov results
	outputMarkov(theKeys, maxKey);

	cout << "FINISHED"<< endl;
	return 0;
}

// iterator through the key map and find the highest (first one) subkeys attached to it
string obtainAMaxKey(Map<Vector<char> > &theKeys)
{
	int maxSeed =0;
	string maxKey="";
	Vector<char> values;
	// iterator through the map values
	foreach (string key in theKeys)
	{
		values = theKeys.get(key);
		if (values.size() > maxSeed)
		{
			maxKey = key;
			maxSeed = values.size();
		}
	}
	return maxKey;
}

// output the words with the martov appoarch
void outputMarkov(Map<Vector<char> > &theKeys, string startKey)
{
	Randomize();
	int wordCount = startKey.length(), randomKey;
	Vector<char> values;
	while (true)
	{
		if (wordCount >= 2000) break;
		values = theKeys.get(startKey);
		if (values.size() ==0) 
		{
			cout << "NO MORE KEYS"; 
			break;
		}
		randomKey = RandomInteger(0,values.size()-1);
		cout << values[randomKey];
		startKey = startKey.substr(1,startKey.length()-1) + values[randomKey];
		wordCount++;
	}
}

// setup the keys from the key input file and starting seeding value
void setupKeys(Map<Vector<char> > &theKeys, ifstream &infile, int seed)
{
	// obtain the first seed value
	string seedValue = readSeedFromFile(infile,seed);
	char newChar;
	while (!infile.eof())
	{
		newChar = nextChar(infile);
		addNewChar(theKeys, seedValue, newChar);
		seedValue = seedValue.substr(1,seedValue.length()-1) + newChar;
	}
}

// add the new char(acters) to the mapped string value, just append to the vector,
// you could pull back the a map instead of a vector and the mapped seed would be the letter
// and the value would be the letter count for that seed in question.
inline void addNewChar(Map<Vector<char> > &theKeys, string seedValue, char insertChar)
{
	Vector<char> addResults;
	if (theKeys.containsKey(seedValue))
		addResults = theKeys.get(seedValue);
	addResults.add(insertChar);
	theKeys.put(seedValue, addResults);
}

// open the file, true = there, false = not there
bool openFile(ifstream &infile, string filename)
{
	infile.open(filename.c_str());
	if (infile.fail())
		return false;
	return true;
}

// obtain the next character from the file
char nextChar(ifstream &infile)
{
	char returnChar;
	infile.get(returnChar);
	return returnChar;
}

// read seedValue from the file to obtain the first seed
string readSeedFromFile(ifstream &infile, int seedValue)
{
	seedValue++;
	char* returnStr = new char[seedValue];
	infile.get(returnStr, sizeof(char)*seedValue);
	return returnStr;
}