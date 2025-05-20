package com.ticketsys.eventManager;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/EventManagerLoginServlet")
public class EventManagerLoginServlet extends HttpServlet {
    private String username = null;
    private String password = null;
    private boolean isLogged = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // get username & password from the request body
            this.username = request.getParameter("userName");
            this.password = request.getParameter("password");

            // access User-data resource file
            EventManager eventManager = new EventManager();

            isLogged = eventManager.login(username, password);

            HttpSession session = request.getSession();
            if (isLogged) {
                System.out.println("* Import System: Loggin successfull...");
                session.setAttribute("eventManagerName", username);
                session.setAttribute("success", "Login Successful...");
                session.removeAttribute("error"); // Clear previous errors
                response.sendRedirect("eventManager/eventManagerDashboard.jsp");
            }
            else {
                System.out.println("* Import System: Loggin failed...");
                session.setAttribute("error", "Invalid credentials. Please try again.");
                response.sendRedirect("eventManager/eventManagerLogin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

