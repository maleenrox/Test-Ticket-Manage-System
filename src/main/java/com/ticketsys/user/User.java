package com.ticketsys.user;

import com.ticketsys.utils.*;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class User {
    private String username;
    private boolean isLogged = false;
    private boolean isRegistered = false;
    private boolean isFind = false;
    private boolean isUpdated = false;

    public User() {
        this.username = null;
        System.out.println("\nSystem: User class initialized...");
    }


    public boolean login(String username, String password) throws IOException{
        System.out.println("\nSystem: Login Process Started:");
        this.username = CaseFixer.fixCase(username);
        try {
            String userDataPath = FilePathReader.getPathFromResources(3);
            if (userDataPath != null) {
                File file = new File(userDataPath);
                System.out.println("\tSystem: User data file path loaded...");
                isLogged = DBSearcher.dbReadAndSearch(file,username,password,5,0,1);
            }
            else {
                System.err.println("\tSystem: User data file path could not be loaded...");
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


    public boolean addUser(String username, String password, String email, String phoneNo) throws IOException {

        // Get the current date and time
        LocalDateTime now = LocalDateTime.now();

        // Define the desired format without colons for the time
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH.mm.ss");

        // Format the current date and time as a string
        String formattedDateTime = now.format(formatter);

        System.out.println("\nSystem: Register Process Started...");
        String Credential = username + ":" + password + ":" + email + ":" + phoneNo + ":" + formattedDateTime;

        try {
            System.out.println( "System: Registering User...");
            String userDataPath = FilePathReader.getPathFromResources(3);

            if (userDataPath != null) {
                System.out.println("\tSystem: User data file path loaded...");
                File file = new File(userDataPath);
                this.isRegistered = DBElementAdder.addElementToEnd(file, Credential);
                if (this.isRegistered) {

                    System.out.println("\tSystem: User Analyze DB Finding...");
                    String userAnalyzeDataPath = FilePathReader.getPathFromResources(11);

                    if (userAnalyzeDataPath != null) {
                        System.out.println("\tSystem: User Analyze DB data file path loaded...");
                        File file2 = new File(userAnalyzeDataPath);
                        Credential = username + ":" + 00 + ":" + 00;
                        this.isRegistered = DBElementAdder.addElementToEnd(file2, Credential);
                    }
                    else {
                        System.out.println("\tSystem: User Analyze DB data file path could not be loaded...");
                        this.isRegistered = false;
                    }
                }
                else {
                    System.out.println("\tSystem: User Registration Failed...");
                    this.isRegistered = false;
                }
            }
            else {
                System.out.println("\tSystem: User data file path could not be loaded...");
                this.isRegistered = false;
            }

            if (this.isRegistered) {
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

    public boolean changePassword(String username, String email, String newPassword) throws IOException {

        try {
            this.username = CaseFixer.fixCase(username);
            System.out.println("\nSystem: Start Changing Password...");

            String userDataPath = FilePathReader.getPathFromResources(3);
            System.out.println("System: User data file path loaded...");

            if (userDataPath != null) {
                File file = new File(userDataPath);
                System.out.println("\tSystem: User data file path loaded...");
                this.isFind = DBSearcher.dbReadAndSearch(file ,this.username ,email ,5,0,2);
                System.out.println("\tSystem: User found...");

                if (isFind) {
                    isUpdated = DBElementUpdater.updateElement(file, this.username, newPassword, 5, 0, 1);
                    System.out.println("\tSystem: Password change Module opened successfully...");
                }
                else {
                    System.err.println("\tSystem: User not found...");
                    this.isUpdated = false;
                }

            }
            else {
                System.err.println("\tSystem: User data file path could not be loaded...");
                this.isUpdated = false;
            }


        }
        catch (Exception e) {
            System.out.println( "System: Error in password change process...");
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
}
