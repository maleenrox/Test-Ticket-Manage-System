package com.ticketsys.user;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;

public class RegisterServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get login details from the form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String tpNo = request.getParameter("tpNo");
        String password = request.getParameter("password1");

        boolean isRegistered = false;

        // Path to the users.txt file
        String filePath = "D:\\User - Maleen\\Documents\\Ticket Management System\\Backend\\DataBases\\db_user_data.txt";

        HttpSession session = request.getSession();

        String Credential = username + ":" + password + ":" + email + ":" + tpNo;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(Credential);
            writer.newLine();
            isRegistered = true;
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        if (isRegistered) {
            session.setAttribute("username", username);
            session.removeAttribute("error"); // Clear previous errors
            response.sendRedirect("eventList.jsp");
        }
        else {
            session.setAttribute("error", "Register Failed");
            response.sendRedirect("register.jsp");
        }


    }
}
