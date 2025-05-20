<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="com.ticketsys.utils.*"%>

<%
    // Get session details
    HttpSession sessionObj = request.getSession();
    String userName = (String) sessionObj.getAttribute("username");

    if (userName == null) {
        response.sendRedirect("user/userLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event - Buy Tickets</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('../images/a (5).jpg'); /* Replace with your background image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            padding: 30px;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(255, 64, 129, 0.8); /* Pink shadow */
        }

        .header-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(255, 64, 129, 0.6);
        }

        h1 {
            font-size: 40px;
            color: rgba(255, 64, 129, 0.8);
            text-shadow: 2px 2px 5px rgba(255, 64, 129, 0.8);
        }

        .user-header {
            font-size: 18px;
        }

        .user-header button {
            background-color: #ff3366;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .user-header button:hover {
            background-color: #cc2d56;
        }

        .event-details {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(255, 64, 129, 0.5);
        }

        .event-details h2 {
            font-size: 1.8rem;
            color: #ff3366;
            margin-bottom: 20px;
        }

        .event-details ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .event-details ul li {
            margin: 12px 0;
            font-size: 18px;
        }

        .ticket-container {
            text-align: center;
            margin-top: 20px;
        }

        .ticket-container input[type="number"] {
            padding: 10px;
            font-size: 16px;
            width: 60px;
            margin-right: 10px;
            border-radius: 5px;
            border: none;
        }

        .ticket-container button {
            background-color: #ff3366;
            color: white;
            padding: 10px 20px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .ticket-container button:hover {
            background-color: #cc2d56;
        }

        footer {
            padding: 15px;
            text-align: center;
            color: white;
            margin-top: 40px;
            font-size: 16px;
        }

        /* Confirmation Modal */
        .confirmation-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
            justify-content: center;
            align-items: center;
            font-size: 18px;
        }

        .confirmation-content {
            background-color: rgba(0, 0, 0, 0.9);
            padding: 30px;
            border-radius: 10px;
            text-align: center;
        }

        .confirmation-content button {
            background-color: #ff3366;
            color: white;
            padding: 10px 20px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
        }

        .confirmation-content button:hover {
            background-color: #cc2d56;
        }
    </style>
</head>
<body>

<%
    String eventName = request.getParameter("eventName");
    session.setAttribute("eventName", eventName);
    // Use this eventName to fetch event details from the database

    if (eventName == null){
        response.sendRedirect("event/eventList1.jsp");
        return;
    }
%>


<div class="container">
    <!-- Header Section with Title and User Info -->
    <div class="header-box">
        <h1>Event - Buy Tickets</h1>
        <div class="user-header">
            <span>Welcome, <strong><%=userName%></strong></span>
            <button onclick="window.location.href='../user/userLogOut.jsp'">Logout</button>
        </div>
    </div>

    <%
        BufferedReader reader = null;
        String eventDBPath = FilePathReader.getPathFromResources(16);
        File file = new File(eventDBPath);
        String eventAnalyzeDBPath = FilePathReader.getPathFromResources(24);
        File file1 = new File(eventAnalyzeDBPath);
        reader = new BufferedReader(new FileReader(file));
        String line;
    %>

    <%
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(":");
            int ticketReminingCount = DBElementGetter.getElement(file1, CaseFixer.fixCase(parts[0]), 5, 0, 2);
            int ticketSoldCount = DBElementGetter.getElement(file1, CaseFixer.fixCase(parts[0]), 5, 0, 3);
        }
    %>

    <%eventName = DBElementGetter.getElement(file,CaseFixer.fixCase(eventName), 5, 0, 0, 69);%>
    <%String eventDescription = DBElementGetter.getElement(file,CaseFixer.fixCase(eventName), 5, 0, 1, 69);%>
    <%String eventDate = DBElementGetter.getElement(file,CaseFixer.fixCase(eventName), 5, 0, 4, 69);%>
    <%int TicketRemine = DBElementGetter.getElement(file1,CaseFixer.fixCase(eventName), 5, 0, 2);%>
    <%int TicketSold = DBElementGetter.getElement(file1,CaseFixer.fixCase(eventName), 5, 0, 3);%>
    <%int TicketPrice = DBElementGetter.getElement(file,CaseFixer.fixCase(eventName), 5, 0, 3);%>

    <!-- Event Details -->
    <div class="event-details">
        <h2><%=eventName%></h2>
        <ul>
            <li><strong>Description: </strong><%=eventDescription%></li>
            <li><strong>Event Date & Time: </strong><%=eventDate%></li>
            <li><strong>Tickets Remaining: </strong><%=TicketRemine%></li>
            <li><strong>Tickets Sold: </strong><%=TicketSold%></li>
            <li><strong>Ticket Price: </strong><%=TicketPrice%></li>
        </ul>
    </div>

    <!-- Ticket Purchase Section -->
    <div class="ticket-container">
        <form action="../TicketServlet" method="post">
        <input type="number" id="ticketCount" name="ticketCount" min="1" max="10" value="1" />
            <button type="submit">Buy Ticket</button>
        </form>
    </div>

</div>

<!-- Confirmation Modal -->
<div id="confirmation-modal" class="confirmation-modal">
    <div class="confirmation-content">
        <p>Are you sure you want to buy <span id="ticket-count-text">1</span> ticket(s) for $50 each?</p>
        <button onclick="confirmPurchase()">Confirm</button>
        <button onclick="closeConfirmation()">Cancel</button>
    </div>
</div>

<footer>
    <p>&copy; 2025 Event Management System</p>
</footer>

<script>
    // Show Confirmation Modal
    function showConfirmation() {
        var ticketCount = document.getElementById("ticket-count").value;
        document.getElementById("ticket-count-text").textContent = ticketCount;
        document.getElementById("confirmation-modal").style.display = "flex";
    }

    // Confirm Purchase
    function confirmPurchase() {
        var ticketCount = document.getElementById("ticket-count").value;
        alert("You have successfully purchased " + ticketCount + " ticket(s).");
        closeConfirmation();
    }

    // Close Confirmation Modal
    function closeConfirmation() {
        document.getElementById("confirmation-modal").style.display = "none";
    }
</script>

</body>
</html>

