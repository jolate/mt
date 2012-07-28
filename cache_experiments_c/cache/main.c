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
int matrix_size = 12247; /*Size of the matrix 179,358,1000,12247,16770*/
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
    unsigned thread_seeda; /*A thread seed for random numbers*/
    unsigned thread_seedb; /*A thread seed for random numbers*/
    int** thread_matrix; /*A pointer to the matrix this thread should use*/
    long state; /*A thread state*/
};

/*
 * Random Number Generator
 */

unsigned get_rand(int lim, unsigned *a, unsigned *b) {
  unsigned res;
  b[0] = 36969 * (b[0] & 65535) + (b[0] >> 16);
  a[0] = 18000 * (a[0] & 65535) + (a[0] >> 16);
  res = (b[0] << 16) + a[0];
  res = res%lim;
  return res;
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
        for (int i = 0; i < 20000; i++) {
            for (int j = 0; j < 20000; j++) {
                sum = sum + this_thread_data->thread_matrix[get_rand(matrix_size,&this_thread_data->thread_seeda,&this_thread_data->thread_seedb)][get_rand(matrix_size,&this_thread_data->thread_seeda,&this_thread_data->thread_seedb)];
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
            data[i].thread_seeda = (unsigned) rand();
            data[i].thread_seedb = ~data[i].thread_seeda;
            data[i].thread_seeda <<= 1;
            data[i].thread_seedb <<= 1;
            data[i].thread_seeda += 1;
            data[i].thread_seedb += 1;
            data[i].thread_seeda *= 2019164533u, data[i].thread_seedb *= 1000632769u;
            pthread_create(&threads[i], NULL, sum_elements, (void *) &data[i]);
        }
        for (int i = 0; i < number_of_workers; i++) {
            pthread_join(threads[i], NULL);
        }
    }/*If we are not sharing the matrix give a copy to each thread!*/
    else {
        for (int i = 0; i < number_of_workers; i++) {
            data[i].thread_id = i;
            data[i].thread_matrix = matrixes[i];
            data[i].thread_seeda = (unsigned) rand();
            data[i].thread_seedb = ~data[i].thread_seeda;
            data[i].thread_seeda <<= 1;
            data[i].thread_seedb <<= 1;
            data[i].thread_seeda += 1;
            data[i].thread_seedb += 1;
            data[i].thread_seeda *= 2019164533u, data[i].thread_seedb *= 1000632769u;
            pthread_create(&threads[i], NULL, sum_elements, (void *) &data[i]);
        }
        for (int i = 0; i < number_of_workers; i++) {
            pthread_join(threads[i], NULL);
        }
    }
    return (EXIT_SUCCESS);
}

