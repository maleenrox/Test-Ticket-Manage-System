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

@WebServlet("/AddEvent")
public class AddEventServlet extends HttpServlet{
    private boolean isAdded = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // get eventName & ticketCount from request body
            String eventName = request.getParameter("eventName");
            String eventDescription = request.getParameter("eventDescription");
            String ticketCount = request.getParameter("ticketCount");
            String ticketValue = request.getParameter("ticketValue");
            String eventDate = request.getParameter("eventDate");

            eventDate = eventDate.replace(":", ".");
            eventDate = eventDate.replace("-", "/");
            eventDate = eventDate.replace("T", " ");

            HttpSession session = request.getSession();

            String eventDataPath = FilePathReader.getPathFromResources(16);
            File file = new File(eventDataPath);
            if (DBSearcher.dbReadAndSearch(file, CaseFixer.fixCase(eventName),5,0)){
                request.setAttribute("error", "EventName already exists. Please try again with a different username.");
                session.removeAttribute("success");
                response.sendRedirect("eventManager/addEvent.jsp");
                System.out.println( "EventName already exists. Please try again with a different EventName.");
                System.out.println("Faild to register user ");
                return;
            }

            EventManager eventManager = new EventManager();
            this.isAdded = eventManager.addEvent(eventName, eventDescription, Integer.parseInt(ticketCount), Integer.parseInt(ticketValue),eventDate);

            if (isAdded) {
//                session.setAttribute("username", eventName);
//                session.setAttribute("success", "Registration Successful.");
                session.removeAttribute("error"); // clear previous errors
                response.sendRedirect("eventManager/eventManagerDashboard.jsp");
            }
            else {
                session.setAttribute("error", "Register Failed");
//                session.removeAttribute("success");
                response.sendRedirect("eventManager/addEvent.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
