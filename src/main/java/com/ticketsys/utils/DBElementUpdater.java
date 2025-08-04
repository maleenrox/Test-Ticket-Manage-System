package com.ticketsys.utils;

import java.io.*;

public class DBElementUpdater {

    public static boolean updateElement(File dbPath, String keyElement, String updateElement, int elementCount, int keyElementPlace, int updateElementPlace) throws Exception{

        System.out.println( "\t\t\tSystem (DBElementUpdater): Updating element...");
        boolean isUpdated = false;

        BufferedReader reader = null;
        BufferedWriter writer = null;
        StringBuilder sb = new StringBuilder();


        try {
            System.out.println("\t\t\tSystem (DBElementUpdater): Reading file...");
            // Read the file
            reader = new BufferedReader(new FileReader(dbPath));
            String line;

            System.out.println( "\t\t\tSystem (DBElementUpdater): Updating file...");
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(":");

                System.out.println( "\t\t\tSystem (DBElementUpdater): Checking credentials...");

                if (updateElementPlace == 0){
                    System.out.println( "\t\t\tSystem (DBElementUpdater): Checking key element...");
                    if ((CaseFixer.fixCase(parts[keyElementPlace])).equals(CaseFixer.fixCase(keyElement))) {
                        System.out.println( "\t\t\tSystem (DBElementUpdater): Updating element...");
                        sb.append(updateElement);
                        isUpdated = true;
                        for (int i = 1; i < elementCount; i++) {
                            sb.append(":").append(parts[i]);
                        }
                        sb.append("\n");
                    }
                    else {
                        System.out.println( "\t\t\tSystem (DBElementUpdater): Element not found...");
                        sb.append(line).append("\n");
                    }
                }
                else {
                    System.out.println( "\t\t\tSystem (DBElementUpdater): Checking key element...");
                    if ((CaseFixer.fixCase(parts[keyElementPlace])).equals(CaseFixer.fixCase(keyElement))) {
                        sb.append(parts[0]);
                        for (int i = 1; i < elementCount; i++) {
                            if (i == updateElementPlace) {
                                sb.append(":").append(updateElement);
                                isUpdated = true;

                            } else {

                                sb.append(":").append(parts[i]);
                            }
                        }
                        sb.append("\n");
                    }
                    else {
                        System.out.println( "\t\t\tSystem (DBElementUpdater): Element not found...");
                        sb.append(line).append("\n");
                    }
                }

            }

            // Write back to the file
            System.out.println( "\t\t\tSystem (DBElementUpdater): Writing file...");
            writer = new BufferedWriter(new FileWriter(dbPath));
            writer.write(sb.toString().trim());

            System.out.println("\t\t\tSystem (DBElementUpdater): Element Write successfully!");

        }
        catch (IOException e) {
            System.out.println( "\t\t\tSystem (DBElementUpdater): Error in updating file...");
            e.printStackTrace();
            isUpdated = false;
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
                isUpdated = false;
            }
        }

        if (isUpdated) {
            System.out.println( "\t\tSystem (DBElementUpdater): Element updated successfully!");
            return true;
        }
        else {
            System.out.println( "\t\tSystem (DBElementUpdater): Element update failed!");
            return false;
        }
    }

    public static boolean updateElement(File dbPath, String keyElement, int updateElement, int elementCount, int keyElementPlace, int updateElementPlace) throws Exception{

        System.out.println( "\t\t\tSystem (DBElementUpdater): Updating element...");
        boolean isUpdated = false;

        BufferedReader reader = null;
        BufferedWriter writer = null;
        StringBuilder sb = new StringBuilder();


        try {
            System.out.println("\t\t\tSystem (DBElementUpdater): Reading file...");
            // Read the file
            reader = new BufferedReader(new FileReader(dbPath));
            String line;

            System.out.println( "\t\t\tSystem (DBElementUpdater): Updating file...");
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(":");

                System.out.println( "\t\t\tSystem (DBElementUpdater): Checking credentials...");

                if (updateElementPlace == 0){
                    System.out.println( "\t\t\tSystem (DBElementUpdater): Checking key element...");
                    if (parts[keyElementPlace].equals(keyElement)) {
                        System.out.println( "\t\t\tSystem (DBElementUpdater): Updating element...");
                        sb.append(updateElement);
                        isUpdated = true;
                        for (int i = 1; i < elementCount; i++) {
                            sb.append(":").append(parts[i]);
                        }
                        sb.append("\n");
                    }
                    else {
                        System.out.println( "\t\t\tSystem (DBElementUpdater): Element not found...");
                        sb.append(line).append("\n");
                    }
                }
                else {
                    System.out.println( "\t\t\tSystem (DBElementUpdater): Checking key element...");
                    if ((CaseFixer.fixCase(parts[keyElementPlace])).equals(CaseFixer.fixCase(keyElement))) {
                        sb.append(parts[0]);
                        for (int i = 1; i < elementCount; i++) {
                            if (i == updateElementPlace) {
                                sb.append(":").append(updateElement);
                                isUpdated = true;

                            } else {

                                sb.append(":").append(parts[i]);
                            }
                        }
                        sb.append("\n");
                    }
                    else {
                        System.out.println( "\t\t\tSystem (DBElementUpdater): Element not found...");
                        sb.append(line).append("\n");
                    }
                }

            }

            // Write back to the file
            System.out.println( "\t\t\tSystem (DBElementUpdater): Writing file...");
            writer = new BufferedWriter(new FileWriter(dbPath));
            writer.write(sb.toString().trim());

            System.out.println("\t\t\tSystem (DBElementUpdater): Element Write successfully!");

        }
        catch (IOException e) {
            System.out.println( "\t\t\tSystem (DBElementUpdater): Error in updating file...");
            e.printStackTrace();
            isUpdated = false;
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
                isUpdated = false;
            }
        }

        if (isUpdated) {
            System.out.println( "\t\tSystem (DBElementUpdater): Element updated successfully!");
            return true;
        }
        else {
            System.out.println( "\t\tSystem (DBElementUpdater): Element update failed!");
            return false;
        }
    }
}
