#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <vector>
#include "vectorclass.h"

using namespace std;

// Returns the Levenshtein distance between word1 and word2.
int quickenshteinDist(const string& word1, const string& word2) {
    int size1 = word1.size();
    int size2 = word2.size();
    vector<vector<int>> verif(size1 + 1, vector<int>(size2 + 1)); // 2D vector for dynamic programming

    if (size1 == 0) return size2;
    if (size2 == 0) return size1;

    // Initialize the first column using SIMD
    for (int i = 0; i <= size1; i += 8) {
        Vec8i vec_i = Vec8i(i, i+1, i+2, i+3, i+4, i+5, i+6, i+7);
        int limit = std::min(8, size1 - i + 1);
        for (int k = 0; k < limit; k++) {
            verif[i + k][0] = vec_i[k];
        }
    }

    // Initialize the first row using SIMD
    for (int j = 0; j <= size2; j += 8) {
        Vec8i vec_j = Vec8i(j, j+1, j+2, j+3, j+4, j+5, j+6, j+7);
        int limit = std::min(8, size2 - j + 1);
        for (int k = 0; k < limit; k++) {
            verif[0][j + k] = vec_j[k];
        }
    }

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

    cout << "The number of modifications needed to make one word equal to the other is: " << quickenshteinDist(word1, word2) << endl;

    return 0;
}
