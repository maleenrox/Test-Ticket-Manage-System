package com.ticketsys.eventManager;

import com.ticketsys.generalAdmin.Manager;
import com.ticketsys.utils.*;

import java.io.File;
import java.io.IOException;

public class EventManager extends Manager {
    private String eventManagerName;
    private boolean isLogged;
    private boolean isRegistered;
    private boolean isUpdate;
    private boolean isRemoved;

    @Override
    public boolean login(String eventManagerName, String password) throws IOException {
        System.out.println("\nSystem: Login Process Started:");
        this.eventManagerName = CaseFixer.fixCase(eventManagerName);
        try {
            String eventManagerNameDataPath = FilePathReader.getPathFromResources(21);
            if (eventManagerNameDataPath != null) {
                File file = new File(eventManagerNameDataPath);
                System.out.println("\tSystem: Event Manager data file path loaded...");
                isLogged = DBSearcher.dbReadAndSearch(file,eventManagerName,password,5,0,4);
            }
            else {
                System.err.println("\tSystem: Event Manager data file path could not be loaded...");
                isLogged = false;
            }

            if (isLogged) {
                System.out.println("System: Login Check Pass...");
                return true;
            }
            else {
                System.out.println("System: Login Check Fail...");
                return false;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println("System: Error in login process...");
            return false;
        }
    }

    public boolean addEvent(String eventname, String eventDescripton, int ticketCount, int ticketValue, String dateAndTime) throws IOException {

        System.out.println("\nSystem: Register Process Started...");
        String Credential = eventname + ":" + eventDescripton + ":" + ticketCount + ":" + ticketValue + ":" + dateAndTime;

        try {
            System.out.println( "System: Registering User...");
            String eventDataPath = FilePathReader.getPathFromResources(16);

            if (eventDataPath != null) {
                System.out.println("\tSystem: User data file path loaded...");
                File file = new File(eventDataPath);
                this.isUpdate = DBElementAdder.addElementToEnd(file, Credential);
                if (this.isUpdate) {

                    System.out.println("\tSystem: User Analyze DB Finding...");
                    String eventAnalyzeDataPath = FilePathReader.getPathFromResources(24);

                    if (eventAnalyzeDataPath != null) {
                        System.out.println("\tSystem: User Analyze DB data file path loaded...");
                        File file2 = new File(eventAnalyzeDataPath);
                        Credential = eventname + ":" + ticketCount + ":" + ticketCount + ":" + 00 + ":" + 00;
                        this.isUpdate = DBElementAdder.addElementToEnd(file2, Credential);

                        System.out.println("\tSystem: User Analyze DB Finding...");
                        String eventSortDataPath = FilePathReader.getPathFromResources(38);

                        if (eventSortDataPath != null) {
                            System.out.println("\tSystem: User Analyze DB data file path loaded...");
                            File file3 = new File(eventSortDataPath);
                            String fixedDateAndTime = dateAndTime.replace(".", "");
                            fixedDateAndTime = fixedDateAndTime.replace("/", "");
                            fixedDateAndTime = fixedDateAndTime.replace(" ", "");
                            Credential = eventname + ":" + fixedDateAndTime;
                            this.isUpdate = DBElementAdder.addElementToEnd(file3, Credential);

                            System.out.println("\tSystem: User Analyze DB Finding...");
                            String eventSortPopularity = FilePathReader.getPathFromResources(42);

                            if (eventSortPopularity != null) {
                                System.out.println("\tSystem: User Analyze DB data file path loaded...");
                                File file4 = new File(eventSortPopularity);
                                Credential = eventname + ":" + 00;
                                this.isUpdate = DBElementAdder.addElementToEnd(file4, Credential);
                            }
                            else {
                                System.out.println("\tSystem: User Analyze DB data file path could not be loaded...");
                                this.isUpdate = false;
                            }
                        }
                        else {
                            System.out.println("\tSystem: User Analyze DB data file path could not be loaded...");
                            this.isUpdate = false;
                        }
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

    public boolean removeEvent(String eventname) throws IOException {
        System.out.println("\nSystem: Remove Process Started...");

        try {
            String eventDataPath = FilePathReader.getPathFromResources(16);
            if (eventDataPath != null) {
                System.out.println("\tSystem: User data file path loaded...");

                this.isRemoved = DBElementRemover.removeWholeElement(new File(eventDataPath), CaseFixer.fixCase(eventname), 0);

                String eventSortPathDate = FilePathReader.getPathFromResources(38);
                if (eventSortPathDate != null) {
                    System.out.println("\tSystem: User data file path loaded...");

                    this.isRemoved = DBElementRemover.removeWholeElement(new File(eventSortPathDate), CaseFixer.fixCase(eventname), 0);

                    String eventSortPathPopularity = FilePathReader.getPathFromResources(42);
                    if (eventSortPathPopularity != null) {
                        System.out.println("\tSystem: User data file path loaded...");

                        this.isRemoved = DBElementRemover.removeWholeElement(new File(eventSortPathPopularity), CaseFixer.fixCase(eventname), 0);
                    }
                    else {
                        System.out.println("\tSystem: Event data file path could not be loaded...");
                        this.isRemoved = false;
                    }
                }
                else {
                    System.out.println("\tSystem: Event data file path could not be loaded...");
                    this.isRemoved = false;
                }
            }
            else {
                System.out.println("\tSystem: Event data file path could not be loaded...");
                this.isRemoved = false;
            }

            if (this.isRemoved) {
                System.out.println("System: Remove Successful...");
                return true;
            }
            else {
                System.out.println("System: Remove Failed...");
                return false;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            System.err.println("System: Error in remove process...");
            return false;
        }
    }


}
