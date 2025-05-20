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

@WebServlet("/RemoveEventManager")
public class RemoveEventManager extends HttpServlet {
    boolean isRemoved = false;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String eventManagerName = request.getParameter("eventManagerName");
            ManagerSettings eventManager = new ManagerSettings();

            isRemoved = eventManager.removeEventManager(eventManagerName);

            HttpSession session = request.getSession();
            String eventManagerDataPath = FilePathReader.getPathFromResources(21);
            File file = new File(eventManagerDataPath);
            if (!(DBSearcher.dbReadAndSearch(file, CaseFixer.fixCase(eventManagerName),5,0))){
                request.setAttribute("error", "ID not found. Please try again.");
                session.removeAttribute("success");
                response.sendRedirect("generalAdmin/removeEventManager.jsp");
                System.out.println( "Username already exists. Please try again with a different username.");
                System.out.println("Faild to register user ");
                return;
            }

            if (isRemoved){
//                session.setAttribute("eventManagerName", eventManagerName);
//                session.setAttribute("success", "Remove Successful.");
//                session.removeAttribute("error"); // clear previous errors
                response.sendRedirect("generalAdmin/eventManagerSettings.jsp");
            }
            else {
                session.setAttribute("error", "Remove Failed");
                session.removeAttribute("success");
                response.sendRedirect("generalAdmin/removeEventManager.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
