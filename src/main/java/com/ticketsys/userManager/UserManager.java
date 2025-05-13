package com.ticketsys.userManager;

import com.ticketsys.generalAdmin.Manager;
import com.ticketsys.user.User;
import com.ticketsys.utils.*;

import java.io.File;
import java.io.IOException;

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
            String userManagerDataPath = FilePathReader.getPathFromResources(2);
            if (userManagerDataPath != null) {
                File file = new File(userManagerDataPath);
                System.out.println("\tSystem: User Manager data file path loaded...");
                isLogged = DBSearcher.dbReadAndSearch(file,userManagerName,password,4,0,1);
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


    public boolean addUser(String username, String password, String email, String phoneNo) throws IOException {

        System.out.println("\nSystem: Register Process Started...");
        String Credential = username + ":" + password + ":" + email + ":" + phoneNo;

        try {
            System.out.println( "System: Registering User...");
            String userDataPath = FilePathReader.getPathFromResources(1);

            if (userDataPath != null) {
                System.out.println("\tSystem: User data file path loaded...");

                this.isRegistered = DBElementAdder.addElementToEnd(new File(userDataPath), Credential);
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

    public boolean removeUser(String username) throws IOException {
        System.out.println("\nSystem: Remove Process Started...");

        try {
            String userDataPath = FilePathReader.getPathFromResources(1);
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
