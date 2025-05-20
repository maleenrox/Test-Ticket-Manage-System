package com.ticketsys.utils;

import java.io.*;

public class DBElementRemover {
    public static boolean removeWholeElement(File dbPath, String keyElement, int keyElementPlace) throws IOException {
        System.out.println( "\t\t\tSystem (DBElementUpdater): Updating element...");
        boolean isRemoved = false;

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

                System.out.println("\t\t\tSystem (DBElementUpdater): Checking credentials...");

                if ((CaseFixer.fixCase(parts[keyElementPlace])).equals(CaseFixer.fixCase(keyElement))) {
                    System.out.println("\t\t\tSystem (DBElementUpdater): Removing element...");
                    isRemoved = true;
                }
                else {
                    System.out.println("\t\t\tSystem (DBElementUpdater): Element not found...");
                    sb.append(line).append("\n");
                }
            }

            StringBuilder cleaned = new StringBuilder();
            String[] lines = sb.toString().split("\\R");
            for (String l : lines) {
                if (!l.trim().isEmpty()) {
                    cleaned.append(l).append(System.lineSeparator());
                }
            }

            // Write back to the file
            System.out.println("\t\t\tSystem (DBElementUpdater): Writing file...");
            writer = new BufferedWriter(new FileWriter(dbPath));
            writer.write(cleaned.toString().trim());

            System.out.println("\t\t\tSystem (DBElementUpdater): Element Write successfully!");

        }
        catch (Exception e)  {
            System.out.println( "\t\t\tSystem (DBElementUpdater): Error in updating file...");
            e.printStackTrace();
            isRemoved = false;
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
                isRemoved = false;
            }
        }

        if (isRemoved) {
            System.out.println( "\t\tSystem (DBElementUpdater): Element updated successfully!");
            return true;
        }
        else {
            System.out.println( "\t\tSystem (DBElementUpdater): Element update failed!");
            return false;
        }

    }
}
