package com.ticketsys.utils;

public class CircularQueueArray {
    private String[] queArray;
    private int maxSize;
    private int nItems;
    private int front;
    private int rear;

    public void CircularQueueArrayCreate(int size) {
        maxSize = size;
        queArray = new String[size];
        front = 0;
        rear = -1;
        nItems = 0;
    }

    public void insert(String item) {
        if (nItems >= maxSize) {
            System.out.println("Queue is full");
        }
        else {
            if(rear == (maxSize - 1)) {
                rear = -1;
            }
            queArray[++rear] = item;
            nItems++;
        }
    }

    public String remove() {
        if (nItems == 0) {
            System.out.println("Queue is empty");
            return "false";
        }
        else {
            String removing = queArray[front++];
            if (front == maxSize)
                front = 0;
            nItems--;
            return removing;
        }
    }

    public String peekFront() {
        if (nItems == 0) {
            System.out.println("Queue is empty");
            return "false";
        } else {
            return queArray[front];
        }
    }

    public boolean isEmpty() {
        return nItems == 0;
    }

    public boolean isFull() {
        return nItems == maxSize;
    }

    public int getCount(){
        return nItems;
    }

    public void display() {
        System.out.print("Queue Array: ");
        for (int i = 0; i < nItems; i++) {
            System.out.print(queArray[i] + " ");
        }
    }
}
