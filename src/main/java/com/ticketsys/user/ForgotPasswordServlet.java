package com.ticketsys.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/ForgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    private String username = null;
    private String email = null;
    private String newPassword = null;
    private boolean isPassswordChange = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            this.username = request.getParameter("username");
            this.email = request.getParameter("email");
            this.newPassword = request.getParameter("newPassword");

            User user = new User();

            isPassswordChange = user.changePassword(username, email, newPassword);

            HttpSession session = request.getSession();
            if (isPassswordChange) {
                System.out.println("Password changed successfully!");
                response.sendRedirect("user/userLogin.jsp");
            }
            else {
                System.out.println("Password change failed!");
                response.sendRedirect("user/userPassWordChange.jsp");
            }

        }
        catch (Exception e) {
            System.out.println("System: Error in password change process...");
            e.printStackTrace();
        }
        finally {
            System.out.println("System: Password change process finished...");
        }
    }
}
