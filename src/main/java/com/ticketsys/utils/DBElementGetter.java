package com.ticketsys.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class DBElementGetter {
    public static int getElement(File dbPath, String key, int elementCount, int keyPlace, int elementPlace) throws IOException{

        boolean isFind = false;
        int searchInt = 0;
        System.out.println("\t\tSystem (DBSearcher): DataBase path loaded...");
        try (BufferedReader reader = new BufferedReader(new FileReader(dbPath))) {
            String line;
            System.out.println("\t\t\tSystem (DBSearcher): Data Base opened for reading...");

            while ((line = reader.readLine()) != null) {
                System.out.println("\t\t\tSystem (DBSearcher): Checking credentials...");
                String[] credentials = line.split(":");

                if (credentials.length == elementCount && CaseFixer.fixCase(credentials[keyPlace]).equals(CaseFixer.fixCase(key))) {
                    isFind = true;
                    searchInt = Integer.parseInt(credentials[elementPlace]);
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
            return searchInt;
        }
        else {
            System.out.println("\t\tSystem (DBSearcher): Element not found...");
            return searchInt;
        }

    }

    public static String getElement(File dbPath, String key, int elementCount, int keyPlace, int elementPlace, int returnString) throws IOException{

        boolean isFind = false;
        String search = "";
        System.out.println("\t\tSystem (DBSearcher): DataBase path loaded...");
        try (BufferedReader reader = new BufferedReader(new FileReader(dbPath))) {
            String line;
            System.out.println("\t\t\tSystem (DBSearcher): Data Base opened for reading...");

            while ((line = reader.readLine()) != null) {
                System.out.println("\t\t\tSystem (DBSearcher): Checking credentials...");
                String[] credentials = line.split(":");

                if (credentials.length == elementCount && CaseFixer.fixCase(credentials[keyPlace]).equals(CaseFixer.fixCase(key))) {
                    isFind = true;
                    search = credentials[elementPlace];
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
            return search;
        }
        else {
            System.out.println("\t\tSystem (DBSearcher): Element not found...");
            return search;
        }

    }
}
