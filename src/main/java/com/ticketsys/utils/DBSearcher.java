package com.ticketsys.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class DBSearcher {

    public static boolean dbReadAndSearch(File dbPath, String element, int elementCount, int elementPlace) throws Exception{
        boolean isFind = false;
        String searchString = "";
        System.out.println("\t\tSystem (DBSearcher): DataBase path loaded...");
        try (BufferedReader reader = new BufferedReader(new FileReader(dbPath))) {
            String line;
            System.out.println("\t\t\tSystem (DBSearcher): Data Base opened for reading...");

            while ((line = reader.readLine()) != null) {
                System.out.println("\t\t\tSystem (DBSearcher): Checking credentials...");
                String[] credentials = line.split(":");

                if (credentials.length == elementCount && CaseFixer.fixCase(credentials[elementPlace]).equals(CaseFixer.fixCase(element))) {
                    isFind = true;
                    searchString = line;
                    System.out.println("\t\t\tSystem (DBSearcher): element matched...");
                }
            }
        }
        catch (IOException e) {
            e.printStackTrace();
            System.err.println("\t\tSystem (DBSearcher): Error reading User data file...");
            isFind = false;
        }

        if (isFind) {
            System.out.println("\t\tSystem (DBSearcher): Element found...");
            return isFind;
        }
        else {
            System.out.println("\t\tSystem (DBSearcher): Element not found...");
            return isFind;
        }
    }

    public static boolean dbReadAndSearch(File dbPath, String element1, String element2, int elementCount, int elementPlace1, int elementPlace2) throws Exception{
        boolean isFind = false;
        System.out.println("\t\tSystem (DBSearcher): DataBase path loaded...");
        try (BufferedReader reader = new BufferedReader(new FileReader(dbPath))) {
            String line;
            System.out.println("\t\t\tSystem (DBSearcher): Data Base opened for reading...");

            while ((line = reader.readLine()) != null) {
                System.out.println("\t\t\tSystem (DBSearcher): Checking credentials...");
                String[] credentials = line.split(":");

                if (credentials.length == elementCount && CaseFixer.fixCase(credentials[elementPlace1]).equals(CaseFixer.fixCase(element1)) && credentials[elementPlace2].equals(element2)) {
                    isFind = true;
                    System.out.println("\t\t\tSystem (DBSearcher): element matched...");
                }
            }
        }
        catch (IOException e) {
            e.printStackTrace();
            System.err.println("\t\tSystem (DBSearcher): Error reading User data file...");
            isFind = false;
        }

        if (isFind) {
            System.out.println("\t\tSystem (DBSearcher): Element found...");
            return isFind;
        }
        else {
            System.out.println("\t\tSystem (DBSearcher): Element not found...");
            return isFind;
        }
    }
}
