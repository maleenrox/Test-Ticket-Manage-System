package com.ticketsys.events;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/Event1Buying")
public class Event1BuyingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String TicketPurchaseDBpath = "D:\\User - Maleen\\Documents\\Ticket Management System\\Backend\\DataBases\\db_ticket_purchase.txt";
        String eventTicketPurchaseCountDBpath = "D:\\User - Maleen\\Documents\\Ticket Management System\\Backend\\DataBases\\db_ticket_count.txt";

        // Get the current date and time
        LocalDateTime now = LocalDateTime.now();

        // Define the desired format without colons for the time
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH.mm.ss");

        // Format the current date and time as a string
        String formattedDateTime = now.format(formatter);

        File file1 = new File(TicketPurchaseDBpath);
        BufferedReader br1 = null;
        BufferedWriter bw1 = null;
        StringBuilder updatedFileContent1 = new StringBuilder();

        String Element = username + ":" + "Event1" + ":" + formattedDateTime;

        CircularQueueArray queue = new CircularQueueArray();
        queue.CircularQueueArrayCreate(10);

        try {
            if (!file1.exists()) {
                request.getSession().setAttribute("error", "Event ticket database not found.");
                response.sendRedirect("error.jsp"); /////////////////////////////
                return;
            }

            br1 = new BufferedReader(new FileReader(file1));
            String line;

            // Reading the file line by line and modifying the ticket count for "Event1"
            while ((line = br1.readLine()) != null) {
                queue.insert(line);

                if (queue.isFull()){
                    queue.remove();
                    queue.insert(Element);
                }
                else{
                    queue.insert(Element);
                }
            }

            for (int i = 0; i < queue.getCount(); i++) {
                updatedFileContent1.append(queue.remove()).append(System.lineSeparator());
            }

            // Writing the updated content back to the file
            bw1 = new BufferedWriter(new FileWriter(file1));
            bw1.write(updatedFileContent1.toString());

        }
        catch (IOException e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Error updating ticket count.");
            response.sendRedirect("error.jsp");
            return;
        }
        finally {
            if (br1 != null) br1.close();
            if (bw1 != null) bw1.close();
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(TicketPurchaseDBpath, true))) {
            writer.write(Element);
            writer.newLine();
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        //////////////////////////////////////====================================

        File file2 = new File(eventTicketPurchaseCountDBpath);
        BufferedReader br = null;
        BufferedWriter bw = null;
        StringBuilder updatedFileContent = new StringBuilder();
        boolean eventFound = false;

        try {
            if (!file2.exists() || !file2.canWrite()) {
                request.getSession().setAttribute("error", "Event ticket database not found or not writable.");
                response.sendRedirect("error.jsp");
                return;
            }

            br = new BufferedReader(new FileReader(file2));
            String line;

            // Reading the file line by line and modifying the ticket count for "Event1"
            while ((line = br.readLine()) != null) {
                String[] eventTicketPurchaseCountDBElements = line.split(":");
                if (eventTicketPurchaseCountDBElements.length == 2 && eventTicketPurchaseCountDBElements[0].equals("Event1")) {
                    // Found Event1, increment the ticket count
                    int eventCount = Integer.parseInt(eventTicketPurchaseCountDBElements[1]);
                    eventCount++;
                    eventTicketPurchaseCountDBElements[1] = Integer.toString(eventCount);
                    line = eventTicketPurchaseCountDBElements[0] + ":" + eventTicketPurchaseCountDBElements[1]; // Update the line
                    eventFound = true;
                }
                updatedFileContent.append(line).append(System.lineSeparator()); // Add the line to the updated content
            }

            if (!eventFound) {
                // If "Event1" was not found, append it with a count of 1
                updatedFileContent.append("Event1:0").append(System.lineSeparator());
            }

            // Writing the updated content back to the file
            bw = new BufferedWriter(new FileWriter(file2));
            bw.write(updatedFileContent.toString());

        } catch (IOException e)
        {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Error updating ticket count.");
            response.sendRedirect("error.jsp");
            return;
        }
        finally {
            if (br != null) br.close();
            if (bw != null) bw.close();
        }

        // Redirect to confirmation page after successful ticket purchase
        response.sendRedirect("confirmation.jsp");
    }
}
