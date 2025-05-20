package com.ticketsys.ticket;

import com.ticketsys.utils.CaseFixer;
import com.ticketsys.utils.DBElementGetter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/TicketServlet")
public class TicketServlet extends HttpServlet {

    private String username = null;
    private String eventName = null;
    private int ticketCount = 0;
    private int ticketValue = 0;
    private boolean isDone1 = false;
    private boolean isDone2 = false;
    private boolean isDone3 = false;
    private boolean isAllDone = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            // get username & password from the request body
            this.username = CaseFixer.fixCase((String) session.getAttribute("username"));
            this.eventName = CaseFixer.fixCase((String) session.getAttribute("eventName"));
            this.ticketCount = Integer.parseInt(request.getParameter("ticketCount"));

            // access User-data resource file
            Ticket ticket = new Ticket(username,eventName,ticketCount);

            if (ticket.isAvailable(ticketCount)) {
                isDone1 = ticket.updateUserAnalyzeDB();
                isDone2 = ticket.updateEventAnalyzeDB();
                isDone3 = ticket.addTicketToTicketDB();

                if (isDone1 && isDone2 && isDone3) {
                    isAllDone = true;
                }
                else {
                    isAllDone = false;
                }
            }
            else {
                session.setAttribute("error", "Ticket count is not available.");
                session.setAttribute("ticketCount", Integer.toString(ticketCount));
                response.sendRedirect("event/purchesError.jsp");
                return;
            }



            if (isAllDone) {
                session.removeAttribute("error"); // Clear previous errors
                session.setAttribute("ticketCount", Integer.toString(ticketCount));
                session.setAttribute("ticketValue", Integer.toString(ticket.ticketSoldValue));
                response.sendRedirect("event/purchesDone.jsp");
            }
            else {
                System.out.println("* Import System: Loggin failed...");
                session.setAttribute("error", "Ticket Sold Unsuccessfully. Please try again.");
                session.setAttribute("ticketCount", Integer.toString(ticketCount));
                response.sendRedirect("event/purchesError.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}