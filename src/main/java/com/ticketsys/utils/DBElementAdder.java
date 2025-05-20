package com.ticketsys.utils;

import java.io.*;

public class DBElementAdder {
    public static boolean addElementToEnd(File dbPath, String element) throws Exception{
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(dbPath, true))) {
            writer.newLine();// add new line
            writer.write(element.trim()); // write register data

            System.out.println("\t\t\tSystem (DBElementAdder): New Data Written Successfully...");
            return true;
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println("\t\t\tSystem (DBElementAdder): Error in writing new data to file...");
            return false;
        }
    }
    
    public static boolean addElement_circularQueue(File dbPath, String element) throws Exception{
        System.out.println( "\t\t\tSystem (DBElementUpdater): Updating element...");
        boolean isUpdate = false;

        BufferedReader reader = null;
        BufferedWriter writer = null;
        StringBuilder sb = new StringBuilder();

        CircularQueueArray queue = new CircularQueueArray();
        queue.CircularQueueArrayCreate(10);

        try {
            System.out.println("\t\t\tSystem (DBElementUpdater): Reading file...");
            // Read the file
            reader = new BufferedReader(new FileReader(dbPath));
            String line;

            //Queue

            System.out.println( "\t\t\tSystem (DBElementUpdater): Updating file...");
            while ((line = reader.readLine()) != null) {

                System.out.println("\t\t\tSystem (DBElementUpdater): Checking credentials...");
                queue.insert(line);
            }

            sb.append(element).append("\n");

            for (int i = 0; i < 9; i++) {
                sb.append(queue.remove()).append("\n");
            }

            // Write back to the file
            System.out.println( "\t\t\tSystem (DBElementUpdater): Writing file...");
            writer = new BufferedWriter(new FileWriter(dbPath));
            writer.write(sb.toString().trim());

            isUpdate = true;

            System.out.println("\t\t\tSystem (DBElementUpdater): Element Write successfully!");

        }
        catch (Exception e)  {
            System.out.println( "\t\t\tSystem (DBElementUpdater): Error in updating file...");
            e.printStackTrace();
            isUpdate = false;
        }
        finally {
            try {
                if (reader != null) {
                    System.out.println( "\t\t\tSystem (DBElementUpdater): Closing file reader...");
                    reader.close();
                }
                if (writer != null) {
                    System.out.println( "\t\t\tSystem (DBElementUpdater): Closing file writer...");
                    writer.close();
                }
            }
            catch (IOException e) {
                e.printStackTrace();
                System.out.println( "\t\t\tSystem (DBElementUpdater): Error closing file reader/writer...");
                isUpdate = false;
            }
        }

        if (isUpdate) {
            System.out.println( "\t\tSystem (DBElementUpdater): Element updated successfully!");
            return true;
        }
        else {
            System.out.println( "\t\tSystem (DBElementUpdater): Element update failed!");
            return false;
        }
    }
}
