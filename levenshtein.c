#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_LENGTH 1000000

char* read_file(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "Error opening file %s\n", filename);
        exit(1);
    }

    char* content = malloc(MAX_LENGTH * sizeof(char));
    if (content == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(1);
    }

    size_t n = fread(content, sizeof(char), MAX_LENGTH - 1, file);
    content[n] = '\0';

    fclose(file);
    return content;
}

int min(int a, int b, int c) {
    if (a <= b && a <= c) {
        return a;
    } else if (b <= a && b <= c) {
        return b;
    } else {
        return c;
    }
}

int levenshtein_distance(char *s1, char *s2) {
    unsigned int x, y, s1len, s2len;
    s1len = strlen(s1);
    s2len = strlen(s2);

    // // Allocate matrix on the stack
    // unsigned int matrix[s2len+1][s1len+1];

    // Allocate matrix on the heap
    unsigned int **matrix = (unsigned int **)malloc((s2len + 1) * sizeof(unsigned int *));
    if (matrix == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(1);
    }
    for (x = 0; x <= s2len; x++) {
        matrix[x] = (unsigned int *)malloc((s1len + 1) * sizeof(unsigned int));
        if (matrix[x] == NULL) {
            fprintf(stderr, "Memory allocation failed\n");
            // Free previously allocated memory
            for (unsigned int i = 0; i < x; i++) {
                free(matrix[i]);
            }
            free(matrix);
            exit(1);
        }
    }

    matrix[0][0] = 0;
    for (x = 1; x <= s2len; x++)
        matrix[x][0] = matrix[x-1][0] + 1;
    for (y = 1; y <= s1len; y++)
        matrix[0][y] = matrix[0][y-1] + 1;
    for (x = 1; x <= s2len; x++)
        for (y = 1; y <= s1len; y++)
            matrix[x][y] = min(matrix[x-1][y] + 1, matrix[x][y-1] + 1, matrix[x-1][y-1] + (s1[y-1] == s2[x-1] ? 0 : 1));

    int result = matrix[s2len][s1len];

    // Free the allocated memory
    for (x = 0; x <= s2len; x++) {
        free(matrix[x]);
    }
    free(matrix);
    
    return result;
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <file1> <file2>\n", argv[0]);
        return 1;
    }

    char* content1 = read_file(argv[1]);
    char* content2 = read_file(argv[2]);

    clock_t start = clock();
    int distance = levenshtein_distance(content1, content2);
    clock_t end = clock();

    double cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

    printf("Levenshtein distance: %d\n", distance);
    printf("Time taken: %f seconds\n", cpu_time_used);

    free(content1);
    free(content2);

    return 0;
}