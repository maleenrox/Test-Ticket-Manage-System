package com.ticketsys.ticket;

import com.ticketsys.utils.*;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Ticket {
    private String username;
    private String eventName;
    private int ticketSoldCount;
    private int ticketSoldValue;
    private boolean isFind = false;
    private boolean isUpdated = false;

    public Ticket() {
        this.username = null;
        this.eventName = null;
        this.ticketSoldCount = 0;
        this.ticketSoldValue = 0;
        System.out.println("\nSystem: Ticket class initialized...");
    }

    public Ticket(String username, String eventName, int ticketSoldCount, int ticketSoldValue) {
        this.username = CaseFixer.fixCase(username);
        this.eventName = CaseFixer.fixCase(eventName);
        this.ticketSoldCount = ticketSoldCount;
        this.ticketSoldValue = ticketSoldValue;
        System.out.println("\nSystem: Ticket class initialized...");
    }

    public boolean updateUserAnalyzeDB() throws IOException {

        try {
            System.out.println("\nSystem: Start Update User Analyze DB...");

            String userAnalyzeDataPath = FilePathReader.getPathFromResources(7);
            System.out.println("System: User data file path loaded...");

            if (userAnalyzeDataPath != null) {
                File file = new File(userAnalyzeDataPath);
                System.out.println("\tSystem: User data file path loaded...");
                this.isFind = DBSearcher.dbReadAndSearch(file ,this.username ,3,0);

                if (isFind) {
                    System.out.println("\tSystem: User found...");
                    int updateValue = ValueUpdater.valueAdder(DBElementGetter.getElement(file,this.username,3,0,1),ticketSoldCount);
                    isUpdated = DBElementUpdater.updateElement(file, this.username, updateValue, 3, 0, 1);
                    System.out.println("\tSystem: Ticket count update opened successfully...");

                    if (isUpdated) {
                        updateValue = ValueUpdater.valueAdder(DBElementGetter.getElement(file,this.username,3,0,2),ticketSoldValue);
                        isUpdated = DBElementUpdater.updateElement(file, this.username, updateValue, 3, 0, 2);
                        System.out.println("\tSystem: Ticket value update opened successfully...");
                        this.isUpdated = true;
                    }
                    else {
                        System.err.println("\tSystem: Ticket count update failed...");
                        this.isUpdated = false;
                    }
                }
                else {
                    System.err.println("\tSystem: User not found...");
                    this.isUpdated = false;
                }

            }
            else {
                System.out.println("\tSystem: User data file path could not be loaded...");
                this.isUpdated = false;
            }


        }
        catch (Exception e) {
            System.out.println( "System: Error in Anywhere change process...");
            e.printStackTrace();
        }

        if (isUpdated) {
            System.out.println("System: Password changed successfully...");
            return true;
        }
        else {
            System.out.println("System: Password change failed...");
            return false;
        }
    }

    public boolean updateEventAnalyzeDB() throws IOException {

        try {
            System.out.println("\nSystem: Start Update User Analyze DB...");

            String eventAnalyzeDataPath = FilePathReader.getPathFromResources(8);
            System.out.println("System: User data file path loaded...");

            if (eventAnalyzeDataPath != null) {
                File file = new File(eventAnalyzeDataPath);
                System.out.println("\tSystem: User data file path loaded...");
                this.isFind = DBSearcher.dbReadAndSearch(file ,this.eventName ,6,0);

                if (isFind) {
                    System.out.println("\tSystem: User found...");
                    int updateValue = ValueUpdater.valueSubstractor(DBElementGetter.getElement(file,this.eventName,5,0,2),ticketSoldCount);
                    isUpdated = DBElementUpdater.updateElement(file, this.eventName, updateValue, 5, 0, 2);
                    System.out.println("\tSystem: Ticket count update opened successfully...");

                    if (isUpdated) {
                        updateValue = ValueUpdater.valueAdder(DBElementGetter.getElement(file,this.eventName,5,0,3),ticketSoldCount);
                        isUpdated = DBElementUpdater.updateElement(file, this.eventName, updateValue, 5, 0, 3);
                        System.out.println("\tSystem: Ticket value update opened successfully...");
                        this.isUpdated = true;

                        if (isUpdated) {
                            updateValue = ValueUpdater.valueAdder(DBElementGetter.getElement(file,this.eventName,5,0,4),ticketSoldValue);
                            isUpdated = DBElementUpdater.updateElement(file, this.eventName, updateValue, 5, 0, 4);
                            System.out.println("\tSystem: Ticket value update opened successfully...");
                            this.isUpdated = true;
                        }
                        else {
                            System.err.println("\tSystem: Ticket count update failed...");
                            this.isUpdated = false;
                        }
                    }
                    else {
                        System.err.println("\tSystem: Ticket count update failed...");
                        this.isUpdated = false;
                    }
                }
                else {
                    System.err.println("\tSystem: User not found...");
                    this.isUpdated = false;
                }

            }
            else {
                System.out.println("\tSystem: User data file path could not be loaded...");
                this.isUpdated = false;
            }


        }
        catch (Exception e) {
            System.out.println( "System: Error in Anywhere change process...");
            e.printStackTrace();
        }

        if (isUpdated) {
            System.out.println("System: Password changed successfully...");
            return true;
        }
        else {
            System.out.println("System: Password change failed...");
            return false;
        }
    }

    public boolean addTicketToTicketDB() throws IOException {

        System.out.println("\nSystem: Register Process Started...");

        // Get the current date and time
        LocalDateTime now = LocalDateTime.now();

        // Define the desired format without colons for the time
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH.mm.ss");

        // Format the current date and time as a string
        String formattedDateTime = now.format(formatter);

        String Credential = eventName + ":" + ticketSoldCount + ":" + ticketSoldCount + ":" + ticketSoldValue + ":" + formattedDateTime;

        try {
            System.out.println( "System: Registering User...");
            String ticketDataPath = FilePathReader.getPathFromResources(6);

            if (ticketDataPath != null) {
                System.out.println("\tSystem: User data file path loaded...");

                this.isUpdated = DBElementAdder.addElementToEnd(new File(ticketDataPath), Credential);
            }
            else {
                System.out.println("\tSystem: User data file path could not be loaded...");
                this.isUpdated = false;
            }

            if (this.isUpdated) {
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

    public boolean isAvailable(String eventName, int ticketSoldCount, int ticketSoldValue) throws IOException {
        System.out.println("\nSystem: Check Process Started...");
        try {
            boolean isAvailable = false;
            String eventAnalyzeDataPath = FilePathReader.getPathFromResources(8);
            System.out.println("System: User data file path loaded...");
            if (eventAnalyzeDataPath != null) {
                File file = new File(eventAnalyzeDataPath);

                if(!((DBElementGetter.getElement(file,this.eventName,5,0,2) > 0) || (DBElementGetter.getElement(file,this.eventName,5,0,2) >= ticketSoldCount))){
                    isAvailable = true;
                }
                else if((DBElementGetter.getElement(file,this.eventName,5,0,2) <= 0) || (DBElementGetter.getElement(file,this.eventName,5,0,2) < ticketSoldCount)){
                    isAvailable = false;
                }
                else {
                    isAvailable = false;
                }

            }
            else {
                System.out.println("\tSystem: User data file path could not be loaded...");
                isAvailable =  false;
            }

            if (isAvailable) {
                System.out.println("System: Ticket is available...");
                return isAvailable;
            }
            else {
                System.out.println("System: Ticket is not available...");
                return isAvailable;
            }

        }
        catch (Exception e) {
            e.printStackTrace();
            System.err.println("System: Error in check process...");
            return false;
        }

    }
}
