package com.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get login details from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Path to the users.txt file
        String filePath = "C:\\Users\\malee\\Desktop\\Group Project\\Ticket Management System\\src\\main\\java\\databases\\User Data Base.txt";
        File file = new File(filePath);
        BufferedReader br = null;
        boolean loggedIn = false;

        try {
            // Check if the file exists
            if (!file.exists()) {
                request.getSession().setAttribute("error", "User database not found. Please register.");
                response.sendRedirect("login.jsp");
                return;
            }

            br = new BufferedReader(new FileReader(file));
            String line;

            // Check if the username and password exist in the file
            while ((line = br.readLine()) != null) {
                String[] credentials = line.split(":");
                if (credentials.length == 2 && credentials[0].equals(username) && credentials[1].equals(password)) {
                    loggedIn = true;
                    break;
                }
            }

            HttpSession session = request.getSession();

            // If login is successful, create session and redirect to user dashboard
            if (loggedIn) {
                session.setAttribute("username", username);
                session.removeAttribute("error"); // Clear previous errors
                response.sendRedirect("events.jsp");
            }
            else {
                session.setAttribute("error", "Invalid credentials. Please try again.");
                response.sendRedirect("login.jsp");
            }
        }
        catch (IOException e) {
            request.getSession().setAttribute("error", "Error reading user database.");
            response.sendRedirect("login.jsp");
            e.printStackTrace();
        }
        finally {
            if (br != null) {
                try {
                    br.close();
                }
                catch (IOException e)
                { e.printStackTrace();
                }
            }
        }
    }
}