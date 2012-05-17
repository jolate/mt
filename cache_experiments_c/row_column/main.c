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
    //int matrix_size = 86; /*L1*/
    int matrix_size = 255; /*L2*/
    //int matrix_size = 1322; /*L3*/
    //int matrix_size = 31000; /*MM*/
    int sum_number = 31000;
    unsigned int total_sum =0;
    int order; /* 0 = row, 1 = column, 2 = random sum */
    
    /*get order from input*/
    if(argv[1][0] == '0') order = 0;
    if(argv[1][0] == '1') order = 1;
    if(argv[1][0] == '2') order = 2;
    /*create matrix*/
    matrix = malloc(matrix_size * sizeof (int *));
    for (int i = 0; i < matrix_size; i++) {
        matrix[i] = malloc(matrix_size * sizeof (int));
        for (int j = 0; j < matrix_size; j++) {
            matrix[i][j] = 1;
        }
    }
    if (order == 0) {
        for (int i = 0; i < matrix_size; i++) {
            for (int j = 0; j < matrix_size; j++) {
                total_sum = total_sum + matrix[i][j];
            }
        }
    } else if(order == 1) {
        for (int i = 0; i < matrix_size; i++) {
            for (int j = 0; j < matrix_size; j++) {
                total_sum = total_sum + matrix[j][i];
            }
        }
    } else if(order == 2) {
        for (int i = 0; i < sum_number; i++) {
            for (int j = 0; j < sum_number; j++) {
                total_sum = total_sum + matrix[rand()%(matrix_size)][rand()%(matrix_size)];
            }
        }
    }
    printf("Total sum is %u",total_sum);
    return (EXIT_SUCCESS);
}

