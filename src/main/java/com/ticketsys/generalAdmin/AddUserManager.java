package com.ticketsys.generalAdmin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;

@WebServlet("/AddUserManager")
public class AddUserManager extends HttpServlet {
    private boolean isAdded = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // get userManagerName & password from request body
            String userManagerID = request.getParameter("userManagerID");
            String userManagerName = request.getParameter("userManagerName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phoneNo = request.getParameter("phoneNumber");

            ManagerSettings userManager = new ManagerSettings();
            isAdded = userManager.addUserManager(userManagerID,userManagerName,email,phoneNo,password);

            HttpSession session = request.getSession();

            if (isAdded) {
//                session.setAttribute("username", userManagerName);
//                session.setAttribute("success", "Registration Successful.");
//                session.removeAttribute("error"); // clear previous errors
                response.sendRedirect("generalAdmin/userManagerSettings.jsp");
            }
            else {
                session.setAttribute("error", "Register Failed");
//                session.removeAttribute("success");
                response.sendRedirect("generalAdmin/addUserManager.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
