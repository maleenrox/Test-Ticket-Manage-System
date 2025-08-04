package com.ticketsys.userManager;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/UserManagerLoginServlet")
public class UserManagerLoginServlet extends HttpServlet{
    private String username = null;
    private String password = null;
    private boolean isLogged = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // get username & password from the request body
            this.username = request.getParameter("username");
            this.password = request.getParameter("password");

            // access User-data resource file
            UserManager userManager = new UserManager();

            isLogged = userManager.login(username, password);

            HttpSession session = request.getSession();
            if (isLogged) {
                System.out.println("* Import System: Loggin Successfull...");
                session.setAttribute("userManagerName", username);
                session.setAttribute("success", "Login Successful...");
                session.removeAttribute("error"); // Clear previous errors
                response.sendRedirect("userManager/userManagerDashboard.jsp");
            }
            else {
                System.out.println("* Import System: Loggin failed...");
                session.setAttribute("error", "Invalid credentials. Please try again.");
                response.sendRedirect("userManager/userManagerLogin.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
