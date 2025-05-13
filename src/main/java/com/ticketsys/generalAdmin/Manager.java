package com.ticketsys.generalAdmin;

import com.ticketsys.utils.CaseFixer;
import com.ticketsys.utils.DBSearcher;
import com.ticketsys.utils.FilePathReader;

import java.io.File;
import java.io.IOException;

public class Manager {
    private String ManagerName;
    private boolean isLogged;

    public boolean login(String ManagerName, String password) throws IOException {
        System.out.println("\nSystem: Login Process Started:");
        this.ManagerName = CaseFixer.fixCase(ManagerName);
        try {
            String userManagerDataPath = FilePathReader.getPathFromResources(2);
            if (userManagerDataPath != null) {
                File file = new File(userManagerDataPath);
                System.out.println("\tSystem: User Manager data file path loaded...");
                isLogged = DBSearcher.dbReadAndSearch(file,ManagerName,password,4,0,1);
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
}
