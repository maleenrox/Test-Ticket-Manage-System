package com.ticketsys.userManager;

import com.ticketsys.utils.CaseFixer;
import com.ticketsys.utils.DBSearcher;
import com.ticketsys.utils.FilePathReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;

@WebServlet("/AddUser")
public class AddUserServlet extends HttpServlet {
    private boolean isAdded = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // get username & password from request body
            String username = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phoneNo = request.getParameter("phoneNumber");

            HttpSession session = request.getSession();

            String userDataPath = FilePathReader.getPathFromResources(3);
            File file = new File(userDataPath);
            if (DBSearcher.dbReadAndSearch(file, CaseFixer.fixCase(username),5,0)){
                request.setAttribute("error", "Username already exists. Please try again with a different username.");
                session.removeAttribute("success");
                response.sendRedirect("userManager/addUser.jsp");
                System.out.println( "Username already exists. Please try again with a different username.");
                System.out.println("Faild to register user ");
                return;
            }

            UserManager userManager = new UserManager();
            this.isAdded = userManager.addUser(username, password, email, phoneNo);


            if (isAdded) {
                session.setAttribute("username", username);
                session.setAttribute("success", "Registration Successful.");
                session.removeAttribute("error"); // clear previous errors
                response.sendRedirect("userManager/userManagerDashboard.jsp");
            }
            else {
                session.setAttribute("error", "Register Failed");
                session.removeAttribute("success");
                response.sendRedirect("userManager/addUser.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
