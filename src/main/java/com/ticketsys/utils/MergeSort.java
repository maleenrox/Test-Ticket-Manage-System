package com.ticketsys.utils;

public class MergeSort {

    // Main function that sorts the input array
    public static long[] mergeSort(long[] array) {
        if (array.length <= 1) {
            return array;
        }

        int mid = array.length / 2;
        long[] left = new long[mid];
        long[] right = new long[array.length - mid];

        // Copy data to temp arrays left[] and right[]
        System.arraycopy(array, 0, left, 0, mid);
        System.arraycopy(array, mid, right, 0, array.length - mid);

        // Recursively sort the left and right halves
        left = mergeSort(left);
        right = mergeSort(right);

        // Merge the sorted halves
        return merge(left, right);
    }

    // Merges two subarrays into a sorted array
    private static long[] merge(long[] left, long[] right) {
        long[] result = new long[left.length + right.length];
        int leftIndex = 0, rightIndex = 0, resultIndex = 0;

        // Merge the arrays while both have elements
        while (leftIndex < left.length && rightIndex < right.length) {
            if (left[leftIndex] <= right[rightIndex]) {
                result[resultIndex++] = left[leftIndex++];
            } else {
                result[resultIndex++] = right[rightIndex++];
            }
        }

        // Copy the remaining elements of left[] (if any)
        while (leftIndex < left.length) {
            result[resultIndex++] = left[leftIndex++];
        }

        // Copy the remaining elements of right[] (if any)
        while (rightIndex < right.length) {
            result[resultIndex++] = right[rightIndex++];
        }

        return result;
    }

    // Utility function to print the array
    private static void printArray(long[] array) {
        for (long i : array) {
            System.out.print(i + " ");
        }
        System.out.println();
    }
}
