package com.ticketsys.generalAdmin;

import com.ticketsys.utils.CaseFixer;
import com.ticketsys.utils.DBSearcher;
import com.ticketsys.utils.FilePathReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;

@WebServlet("/RemoveUserManager")
public class RemoveUserManager extends HttpServlet {
    boolean isRemoved = false;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userManagerName = request.getParameter("userManagerName");
            ManagerSettings userManager = new ManagerSettings();
            System.out.println( "UserManager Name: " + userManagerName);

            isRemoved = userManager.removeUserManager(userManagerName);

            HttpSession session = request.getSession();
            String userManagerDataPath = FilePathReader.getPathFromResources(8);
            File file = new File(userManagerDataPath);
            if (!(DBSearcher.dbReadAndSearch(file, CaseFixer.fixCase(userManagerName),5,0))){
                request.setAttribute("error", "ID not found. Please try again.");
                session.removeAttribute("success");
                response.sendRedirect("generalAdmin/removeUserManager.jsp");
                System.out.println( "ID NOT FOUND. Please try again with a different username.");
                System.out.println("Faild to register user ");
                return;
            }

            if (isRemoved){
                session.setAttribute("success", "Remove Successful.");
                session.removeAttribute("error"); // clear previous errors
                response.sendRedirect("generalAdmin/userManagerSettings.jsp");
            }
            else {
                session.setAttribute("error", "Remove Failed");
                session.removeAttribute("success");
                response.sendRedirect("generalAdmin/removeUserManager.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
