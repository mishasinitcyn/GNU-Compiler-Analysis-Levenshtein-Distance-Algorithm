#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <vector>

using namespace std;

// Returns the Levenshtein distance between word1 and word2.
int levenshteinDist(const string& word1, const string& word2) {
    int size1 = word1.size();
    int size2 = word2.size();
    vector<vector<int>> verif(size1 + 1, vector<int>(size2 + 1)); // 2D vector for dynamic programming

    if (size1 == 0) return size2;
    if (size2 == 0) return size1;

    for (int i = 0; i <= size1; i++)
        verif[i][0] = i;
    for (int j = 0; j <= size2; j++)
        verif[0][j] = j;

    for (int i = 1; i <= size1; i++) {
        for (int j = 1; j <= size2; j++) {
            int cost = (word1[i - 1] == word2[j - 1]) ? 0 : 1;
            verif[i][j] = min({verif[i - 1][j] + 1, verif[i][j - 1] + 1, verif[i - 1][j - 1] + cost});
        }
    }

    return verif[size1][size2];
}

string readFile(const string& fileName) {
    ifstream file(fileName);
    if (!file.is_open()) {
        cerr << "Error opening file: " << fileName << endl;
        exit(EXIT_FAILURE);
    }
    string content((istreambuf_iterator<char>(file)), istreambuf_iterator<char>());
    file.close();
    return content;
}

int main(int argc, char* argv[]) {
    string word1, word2;

    if (argc == 3) {
        string input1 = argv[1];
        string input2 = argv[2];

        // Check if inputs are file names or direct strings
        ifstream testFile1(input1);
        ifstream testFile2(input2);

        if (testFile1.good() && testFile2.good()) {
            // Inputs are file names
            word1 = readFile(input1);
            word2 = readFile(input2);
        } else {
            // Inputs are direct strings
            word1 = input1;
            word2 = input2;
        }
    } else {
        cerr << "Usage: " << argv[0] << " <string1 or file1> <string2 or file2>" << endl;
        return EXIT_FAILURE;
    }

    cout << "The number of modifications needed to make one word equal to the other is: " << levenshteinDist(word1, word2) << endl;

    return 0;
}
