package com.ticketsys.events;

import com.ticketsys.utils.DBElementAdder;
import com.ticketsys.utils.FilePathReader;

import java.io.File;
import java.io.IOException;

public class Event {
    private boolean isUpdate = false;
    public boolean addEvent(String eventname, String eventDescripton, int ticketCount, int ticketValue, String dateAndTime) throws IOException {

        System.out.println("\nSystem: Register Process Started...");
        String Credential = eventname + ":" + eventDescripton + ":" + ticketCount + ":" + dateAndTime;

        try {
            System.out.println( "System: Registering User...");
            String eventDataPath = FilePathReader.getPathFromResources(9);

            if (eventDataPath != null) {
                System.out.println("\tSystem: User data file path loaded...");
                File file = new File(eventDataPath);
                this.isUpdate = DBElementAdder.addElementToEnd(file, Credential);
                if (this.isUpdate) {

                    System.out.println("\tSystem: User Analyze DB Finding...");
                    String eventAnalyzeDataPath = FilePathReader.getPathFromResources(8);

                    if (eventAnalyzeDataPath != null) {
                        System.out.println("\tSystem: User Analyze DB data file path loaded...");
                        File file2 = new File(eventAnalyzeDataPath);
                        Credential = null;
                        Credential = eventname + ":" + 00 + ":" + 00 + ":" + 00 + ":" + 00;
                        this.isUpdate = DBElementAdder.addElementToEnd(file2, Credential);
                    }
                    else {
                        System.out.println("\tSystem: User Analyze DB data file path could not be loaded...");
                        this.isUpdate = false;
                    }
                }
                else {
                    System.out.println("\tSystem: User Registration Failed...");
                    this.isUpdate = false;
                }
            }
            else {
                System.out.println("\tSystem: User data file path could not be loaded...");
                this.isUpdate = false;
            }

            if (this.isUpdate) {
                System.out.println("System: Registration Successful...");
                return true;
            }
            else {
                System.out.println("System: Registration Failed...");
                return false;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            System.err.println("System: Error in register process...");
            return false;
        }

    }
}
