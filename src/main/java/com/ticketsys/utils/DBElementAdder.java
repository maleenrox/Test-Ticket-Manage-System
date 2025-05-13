package com.ticketsys.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

public class DBElementAdder {
    public static boolean addElementToEnd(File dbPath, String element) throws Exception{
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(dbPath, true))) {
            writer.newLine();// add new line
            writer.write(element); // write register data

            System.out.println("\t\t\tSystem (DBElementAdder): New Data Written Successfully...");
            return true;
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println("\t\t\tSystem (DBElementAdder): Error in writing new data to file...");
            return false;
        }
    }
}
