/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cachejavatest;

/**
 *
 * @author Jota
 */
public class CacheJavaTest {

    /**
     * @param args the command line arguments
     */
    private static int max = 100;
    private static int min = 0;
    private static int size = 12000;

    public static int myRandom() {
        int random = min + (int) (Math.random() * ((max - min) + 1));
        return random;
    }

    public static int rowSum(int[][] bigArray) {
        int sum = 0;
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                sum = sum + bigArray[i][j];
            }
        }
        return sum;
    }

    public static int columnSum(int[][] bigArray) {
        int sum = 0;
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                sum = sum + bigArray[j][i];
            }
        }
        return sum;
    }

    public static void main(String[] args) {
        StopWatch sw = new StopWatch();
        int[][] bigArray = new int[size][size];
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                bigArray[i][j] = myRandom();
            }
        }
        sw.start();
        System.out.println(rowSum(bigArray));
        sw.stop();
        System.out.println(sw.getElapsedTime());
    }
}
