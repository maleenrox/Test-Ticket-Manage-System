package com.ticketsys.generalAdmin;

import com.ticketsys.utils.CaseFixer;
import com.ticketsys.utils.DBElementAdder;
import com.ticketsys.utils.DBElementRemover;
import com.ticketsys.utils.FilePathReader;

import java.io.File;
import java.io.IOException;

public class ManagerSettings extends Manager{

    private boolean isRegistered = false;
    private boolean isRemoved = false;

    public boolean addUserManager(String userManagerID, String userManagerName, String email, String phoneNo, String password) throws IOException {

        System.out.println("\nSystem: Register Process Started...");
        String Credential = userManagerID + ":" + userManagerName + ":" + email + ":" + phoneNo + ":" + password;

        try {
            System.out.println( "System: Registering User Manager...");
            String userManagerDataPath = FilePathReader.getPathFromResources(8);

            if (userManagerDataPath != null) {
                System.out.println("\tSystem: User Manager data file path loaded...");

                this.isRegistered = DBElementAdder.addElementToEnd(new File(userManagerDataPath), Credential);
            }
            else {
                System.out.println("\tSystem: User Manager file path could not be loaded...");
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

    public boolean addEventManager(String eventManagerID, String eventManagerName, String email, String phoneNo, String password) throws IOException {

        System.out.println("\nSystem: Register Process Started...");
        String Credential = eventManagerID + ":" + eventManagerName + ":" + email + ":" + phoneNo;

        try {
            System.out.println( "System: Registering Event Manager...");
            String eventManagerDataPath = FilePathReader.getPathFromResources(21);

            if (eventManagerDataPath != null) {
                System.out.println("\tSystem: Event Manager data file path loaded...");

                this.isRegistered = DBElementAdder.addElementToEnd(new File(eventManagerDataPath), Credential);
            }
            else {
                System.out.println("\tSystem: Event Manager file path could not be loaded...");
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

    public boolean removeUserManager(String usermanagername) throws IOException {
        System.out.println("\nSystem: Remove Process Started...");

        try {
            String userManagerDataPath = FilePathReader.getPathFromResources(8);
            if (userManagerDataPath != null) {
                System.out.println("\tSystem: User data file path loaded...");
                File file = new File(userManagerDataPath);
                String userManagerID = CaseFixer.fixCase(usermanagername);
                System.out.println(userManagerID);
                this.isRemoved = DBElementRemover.removeWholeElement(file, userManagerID, 0);
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

    public boolean removeEventManager(String eventmanagername) throws IOException {
        System.out.println("\nSystem: Remove Process Started...");

        try {
            String eventManagerDataPath = FilePathReader.getPathFromResources(21);
            if (eventManagerDataPath != null) {
                System.out.println("\tSystem: User data file path loaded...");

                this.isRemoved = DBElementRemover.removeWholeElement(new File(eventManagerDataPath), CaseFixer.fixCase(eventmanagername), 0);
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
