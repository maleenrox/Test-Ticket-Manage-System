package com.ticketsys.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private String username = null;
    private String password = null;
    private boolean isLogged = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // get username & password from the request body
            this.username = request.getParameter("username");
            this.password = request.getParameter("password");

            // access User-data resource file
            User user = new User();

            isLogged = user.login(username, password);

            HttpSession session = request.getSession();
            if (isLogged) {
                System.out.println("* Import System: Loggin successfull...");
                session.setAttribute("username", username);
                session.setAttribute("success", "Login Successful...");
                session.removeAttribute("error"); // Clear previous errors
                response.sendRedirect("event/eventList1.jsp");
            }
            else {
                System.out.println("* Import System: Loggin failed...");
                session.setAttribute("error", "Invalid credentials. Please try again.");
                response.sendRedirect("user/userLogin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}