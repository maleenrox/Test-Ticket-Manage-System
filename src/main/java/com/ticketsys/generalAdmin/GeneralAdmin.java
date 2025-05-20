package com.ticketsys.generalAdmin;

import com.ticketsys.utils.CaseFixer;
import com.ticketsys.utils.DBSearcher;
import com.ticketsys.utils.FilePathReader;

import java.io.File;
import java.io.IOException;

public class GeneralAdmin {
    private String generalAdminName;
    private boolean isLogged;

    public boolean login(String generalAdminName, String password) throws IOException {
        System.out.println("\nSystem: Login Process Started:");
        this.generalAdminName = CaseFixer.fixCase(generalAdminName);
        try {
            String eventManagerNameDataPath = FilePathReader.getPathFromResources(34);
            if (eventManagerNameDataPath != null) {
                File file = new File(eventManagerNameDataPath);
                System.out.println("\tSystem: General Admin data file path loaded...");
                isLogged = DBSearcher.dbReadAndSearch(file,generalAdminName,password,5,0,4);
            }
            else {
                System.err.println("\tSystem: General Admin data file path could not be loaded...");
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
