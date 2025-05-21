package com.ticketsys.userManager;

import com.ticketsys.generalAdmin.Manager;
import com.ticketsys.utils.*;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class UserManager extends Manager {
    private String userManagerName;
    private boolean isLogged;
    private boolean isRegistered;
    private boolean isRemoved;

    @Override
    public boolean login(String userManagerName, String password) throws IOException {
        System.out.println("\nSystem: Login Process Started:");
        this.userManagerName = CaseFixer.fixCase(userManagerName);
        try {
            String userManagerDataPath = FilePathReader.getPathFromResources(8);
            if (userManagerDataPath != null) {
                File file = new File(userManagerDataPath);
                System.out.println("\tSystem: User Manager data file path loaded...");
                isLogged = DBSearcher.dbReadAndSearch(file,this.userManagerName,password,5,0,4);
            }
            else {
                System.err.println("\tSystem: User Manager data file path could not be loaded...");
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


    public boolean addUser(String userName, String password, String email, String phoneNo) throws IOException {
        System.out.println("\nSystem: Register Process Started...");
        // Get the current date and time
        LocalDateTime now = LocalDateTime.now();

        // Define the desired format without colons for the time
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH.mm.ss");

        // Format the current date and time as a string
        String formattedDateTime = now.format(formatter);

        String Credential = userName + ":" + password + ":" + email + ":" + phoneNo + ":" + formattedDateTime;
        try {
            System.out.println( "System: Registering User...");
            String userDataPath = FilePathReader.getPathFromResources(3);

            if (userDataPath != null) {
                System.out.println("\tSystem: User data file path loaded...");

                this.isRegistered = DBElementAdder.addElementToEnd(new File(userDataPath), Credential);
            }
            else {
                System.out.println("\tSystem: User data file path could not be loaded...");
                this.isRegistered = false;
            }

            if (this.isRegistered) {
                System.out.println("\tSystem: User Analyze DB Finding...");
                String userAnalyzeDataPath = FilePathReader.getPathFromResources(11);

                if (userAnalyzeDataPath != null) {
                    System.out.println("\tSystem: User Analyze DB data file path loaded...");
                    File file2 = new File(userAnalyzeDataPath);
                    Credential = userName + ":" + 00 + ":" + 00;
                    this.isRegistered = DBElementAdder.addElementToEnd(file2, Credential);
                }
                else {
                    System.out.println("\tSystem: User Analyze DB data file path could not be loaded...");
                    this.isRegistered = false;
                }
                System.out.println("System: Registration Successful...");
                return isRegistered;
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


    public boolean removeUser(String username) throws IOException {
        System.out.println("\nSystem: Remove Process Started...");

        try {
            String userDataPath = FilePathReader.getPathFromResources(3);
            if (userDataPath != null) {
                System.out.println("\tSystem: User data file path loaded...");

                this.isRemoved = DBElementRemover.removeWholeElement(new File(userDataPath), CaseFixer.fixCase(username), 0);
            }
            else {
                System.out.println("\tSystem: User data file path could not be loaded...");
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
