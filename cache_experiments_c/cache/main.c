/* 
 * File:   main.c
 * Author: jota
 *
 * Created on May 7, 2012, 2:18 PM
 */

#include <assert.h>
//#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdbool.h>
#include <time.h>


/*
 * Global variables
 */
int number_of_workers; /*Number of threads*/
int matrix_size = 15810; /*Size of the matrix*/
int **matrix; /*The original matrix*/
int ***matrixes; /*To hold the original matrix and copies of it*/
unsigned int seed = 0; /*The seed used for random numbers*/
pthread_t *threads; /*The threads*/
bool share_matrix; /*Whether the matrix is shared or not */
int cycles = 1; /*Number of times to sum all matrix elements, for longer executions*/

/*
 *  Argument of a thread.
 */
struct thread_data {
    int thread_id; /*The number that identifies the thread*/
    int thread_seed; /*A thread seed for random numbers*/
    int** thread_matrix; /*A pointer to the matrix this thread should use*/
    long state; /*A thread state*/
};
/*
 * Random Number Generator
 */

int get_rand(int lim, long *a)
{
        //printf("%ld -> ",a[0]);
        a[0] = (a[0] * 32719 + 3) % 32749;
        //printf("%ld\n",a[0]);
        return ((a[0] % lim));
}

/*
 * Sum the elements of matrix
 */
void *sum_elements(void *data) {
    struct thread_data *this_thread_data;
    this_thread_data = (struct thread_data *) data;
    unsigned int sum = 0;
    for (int z = 0; z < cycles; z++) {
        sum = 0;
        for (int i = 0; i < matrix_size; i++) {
            for (int j = 0; j < matrix_size; j++) {
                sum = sum + this_thread_data->thread_matrix[j][i];
            }
        }
    }
    printf("Thread %i returned %u \n", this_thread_data->thread_id, sum);
}


int main(int argc, char** argv) {
    /*Get the number of workers as program input*/
    number_of_workers = argv[1][0] - '0';
    /*Get sharing matrix boolean as program input*/
    if (argv[2][0] - '0' == 0) {
        share_matrix = false;
    } else {
        share_matrix = true;
    }
    /*Create the matrix with random numbers*/
    matrix = malloc(matrix_size * sizeof (int*));
    for (int i = 0; i < matrix_size; i++) {
        matrix[i] = malloc(matrix_size * sizeof (int));
        for (int j = 0; j < matrix_size; j++) {
            matrix[i][j] = 1;
        }
    }
    /*If we don't want to share memory, make copies of the matrix*/
    if (share_matrix == false) {
        matrixes = malloc(number_of_workers * sizeof (int**));
        matrixes[0] = matrix;
        for (int k = 1; k < number_of_workers; k++) {
            matrixes[k] = malloc(matrix_size * sizeof (int*));
            for (int i = 0; i < matrix_size; i++) {
                matrixes[k][i] = malloc(matrix_size * sizeof (int));
                for (int j = 0; j < matrix_size; j++) {
                    matrixes[k][i][j] = matrix[i][j];
                }
            }
        }
    }
    /*Create pthreads and their data*/
    threads = malloc(number_of_workers * sizeof (pthread_t));
    struct thread_data *data;
    data = malloc(number_of_workers * sizeof (struct thread_data));
    /*If we are sharing the matrix use the same one for all threads!*/
    if (share_matrix == true) {
        for (int i = 0; i < number_of_workers; i++) {
            data[i].thread_id = i;
            data[i].thread_matrix = matrix;
            data[i].thread_seed = rand();
            srand(5);
            data[i].state = rand();
            pthread_create(&threads[i], NULL, sum_elements, (void *) &data[i]);
        }
        for (int i = 0; i < number_of_workers; i++) {
            pthread_join(threads[i], NULL);
        }
    }        /*If we are not sharing the matrix give a copy to each thread!*/
    else {
        for (int i = 0; i < number_of_workers; i++) {
            data[i].thread_id = i;
            data[i].thread_matrix = matrixes[i];
            data[i].thread_seed = rand();
            srand(5);
            data[i].state = rand();
            pthread_create(&threads[i], NULL, sum_elements, (void *) &data[i]);
        }
        for (int i = 0; i < number_of_workers; i++) {
            pthread_join(threads[i], NULL);
        }
    }
    return (EXIT_SUCCESS);
}

