/* 
 * File:   main.c
 * Author: jota
 *
 * Created on May 15, 2012, 12:23 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
 * 
 */
int main(int argc, char** argv) {
    int **matrix;
    int seed = 0;
    int matrix_size = 31000;
    unsigned int total_sum =0;
    bool order; /* false = row, true = column */
    
    /*get order from input*/
    if(argv[1][0] == '0') order = false;
    if(argv[1][0] == '1') order = true;
    /*create matrix*/
    matrix = malloc(matrix_size * sizeof (int *));
    for (int i = 0; i < matrix_size; i++) {
        matrix[i] = malloc(matrix_size * sizeof (int));
        for (int j = 0; j < matrix_size; j++) {
            matrix[i][j] = 1;
        }
    }
    if (order == false) {
        for (int i = 0; i < matrix_size; i++) {
            for (int j = 0; j < matrix_size; j++) {
                total_sum = total_sum + matrix[i][j];
            }
        }
    } else if(order == true) {
        for (int i = 0; i < matrix_size; i++) {
            for (int j = 0; j < matrix_size; j++) {
                total_sum = total_sum + matrix[j][i];
            }
        }
    }
    printf("Total sum is %u",total_sum);
    return (EXIT_SUCCESS);
}

