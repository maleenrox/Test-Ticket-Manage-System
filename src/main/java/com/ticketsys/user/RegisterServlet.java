package com.ticketsys.user;

import com.ticketsys.utils.FilePathReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // get username & password from request body
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phoneNo = request.getParameter("phoneNo");

            String Credential = username + ":" + password + ":" + email + ":" + phoneNo;
            String userDataPath = FilePathReader.getPathFromResources(1);

            if (userDataPath != null) {
                HttpSession session = request.getSession();

                try (BufferedWriter writer = new BufferedWriter(new FileWriter(userDataPath, true))) {
                    writer.newLine(); // add new line
                    writer.write(Credential); // write register data

                    session.setAttribute("username", username);
                    session.setAttribute("success", "Registration Successful.");
                    session.removeAttribute("error"); // clear previous errors
                    // response.sendRedirect("eventList.jsp");
                    response.sendRedirect("auth/login.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                    session.setAttribute("error", "Register Failed");
                    session.removeAttribute("success");
                    response.sendRedirect("auth/register.jsp");
                }
            } else {
                System.err.println("User data file path could not be loaded.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
