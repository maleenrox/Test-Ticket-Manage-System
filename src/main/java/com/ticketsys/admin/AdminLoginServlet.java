package com.ticketsys.admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get login details from the form
        String username = request.getParameter("adminUsername");
        String password = request.getParameter("adminPassword");

        // Path to the users.txt file
        String filePath = "C:\\Users\\malee\\Desktop\\Group Project\\Ticket Management System\\src\\main\\java\\databases\\db_admin_data.txt";
        File file = new File(filePath);
        BufferedReader br = null;
        boolean loggedIn = false;

        try {
            // Check if the file exists
            if (!file.exists()) {
                request.getSession().setAttribute("error", "User database not found. Please register.");
                response.sendRedirect("adminLogin.jsp");
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
                session.setAttribute("adminUsername", username);
                session.removeAttribute("error"); // Clear previous errors
                response.sendRedirect("adminPage.jsp");
            }
            else {
                session.setAttribute("error", "Invalid credentials. Please try again.");
                response.sendRedirect("acessdenied.jsp");
            }
        }
        catch (IOException e) {
            request.getSession().setAttribute("error", "Error reading user database.");
            response.sendRedirect("adminLogin.jsp");
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
