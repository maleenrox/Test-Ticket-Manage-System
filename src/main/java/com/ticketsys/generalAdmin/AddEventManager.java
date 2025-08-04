package com.ticketsys.generalAdmin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;

@WebServlet("/AddEventManager")
public class AddEventManager extends HttpServlet {
    private boolean isAdded = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // get eventManagerName & password from request body
            String eventManagerID = request.getParameter("eventManagerID");
            String eventManagerName = request.getParameter("eventManagerName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phoneNo = request.getParameter("phoneNumber");

            ManagerSettings eventManager = new ManagerSettings();
            isAdded = eventManager.addEventManager(eventManagerID,eventManagerName,email,phoneNo,password);

            HttpSession session = request.getSession();

            if (isAdded) {
//                session.setAttribute("username", eventManagerName);
//                session.setAttribute("success", "Registration Successful.");
//                session.removeAttribute("error"); // clear previous errors
                response.sendRedirect("generalAdmin/eventManagerSettings.jsp");
            }
            else {
                session.setAttribute("error", "Register Failed");
//                session.removeAttribute("success");
                response.sendRedirect("generalAdmin/addEventManager.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

