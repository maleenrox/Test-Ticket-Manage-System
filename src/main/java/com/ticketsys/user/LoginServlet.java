package com.ticketsys.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // get username & password from request body
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // init local variables
            boolean isLogged = false;

            // access user-data resource file
            InputStream isUserData = getClass().getClassLoader().getResourceAsStream("data/db_user_data.txt");
            if (isUserData != null) {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(isUserData))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] credentials = line.split(":");
                        if (credentials.length == 4 && credentials[0].equals(username) && credentials[1].equals(password)) {
                            isLogged = true;
                            break;
                        }
                    }

                    // if login successful; create session and redirect to user dashboard
                    HttpSession session = request.getSession();
                    if (isLogged) {
                        session.setAttribute("username", username);
                        session.removeAttribute("error"); // Clear previous errors
                        response.sendRedirect("events.jsp");
                    }
                    else {
                        session.setAttribute("error", "Invalid credentials. Please try again.");
                        response.sendRedirect("auth/login.jsp");
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}