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

@WebServlet("/RemoveUser")
public class RemoveUserServlet extends HttpServlet {
    boolean isRemoved = false;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("userName");
            UserManager userManager = new UserManager();

            isRemoved = userManager.removeUser(username);

            HttpSession session = request.getSession();
            String userDataPath = FilePathReader.getPathFromResources(3);
            File file = new File(userDataPath);
            if (!(DBSearcher.dbReadAndSearch(file, CaseFixer.fixCase(username),5,0))){
                request.setAttribute("error", "Username Not Found. Please try again with a different username.");
                session.removeAttribute("success");
                response.sendRedirect("userManager/removeUser.jsp");
                System.out.println( "Username already exists. Please try again with a different username.");
                System.out.println("Faild to register user ");
                return;
            }

            if (isRemoved){
                session.setAttribute("username", username);
                session.setAttribute("success", "Remove Successful.");
                session.removeAttribute("error"); // clear previous errors
                response.sendRedirect("userManager/userManagerDashboard.jsp");
            }
            else {
                session.setAttribute("error", "Remove Failed");
                session.removeAttribute("success");
                response.sendRedirect("userManager/removeUser.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
