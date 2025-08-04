package com.ticketsys.eventManager;

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

@WebServlet("/RemoveEvent")
public class RemoveEventServlet extends HttpServlet {
    boolean isRemoved = false;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String eventName = request.getParameter("eventName");
            EventManager eventManager = new EventManager();

            HttpSession session = request.getSession();
            String eventDataPath = FilePathReader.getPathFromResources(16);
            File file = new File(eventDataPath);
            if (!(DBSearcher.dbReadAndSearch(file, CaseFixer.fixCase(eventName),5,0))){
                request.setAttribute("error", "Event Not Found. Please try again");
                session.removeAttribute("success");
                response.sendRedirect("eventManager/removeEvent.jsp");
                System.out.println( "Event not Found. Please try again with a different username.");
                System.out.println("Faild to register user ");
                return;
            }

            isRemoved = eventManager.removeEvent(eventName);

            if (isRemoved){
//                session.setAttribute("eventName", eventName);
//                session.setAttribute("success", "Remove Successful.");
                session.removeAttribute("error"); // clear previous errors
                response.sendRedirect("eventManager/eventManagerDashboard.jsp");
            }
            else {
                session.setAttribute("error", "Remove Failed");
                session.removeAttribute("success");
                response.sendRedirect("eventManager/removeEvent.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
