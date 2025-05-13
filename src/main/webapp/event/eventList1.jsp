<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="com.ticketsys.utils.FilePathReader" %>
<%@ page import="com.ticketsys.utils.DBElementGetter" %>
<%@ page import="com.ticketsys.utils.CaseFixer" %>

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
    <title>Event List - Sorted by Date</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('../images/a (2).jpg'); /* Replace with your background image */
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

        /* Sort By Section */
        .sortby-container {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin-bottom: 30px;
            padding: 15px;
            border-radius: 10px;
            background-color: rgba(0, 0, 0, 0.6);
        }

        .sortby-container button {
            padding: 12px 30px;
            margin: 0 10px;
            border-radius: 25px;
            font-size: 16px;
            background-color: #ff3366; /* Pink color */
            border: none;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .sortby-container button:hover {
            background-color: #cc2d56; /* Darker pink on hover */
            transform: scale(1.05);
        }

        .event-box {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px;
            margin: 20px 0;
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(255, 64, 129, 0.5);
        }

        .event-box h2 {
            font-size: 1.8rem;
            color: #ff3366;
            margin-bottom: 20px;
        }

        .event-box ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .event-box ul li {
            margin: 12px 0;
            font-size: 18px;
        }

        .event-box ul li button {
            background-color: #ff3366;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            margin-top: 15px;
            transition: background-color 0.3s;
        }

        .event-box ul li button:hover {
            background-color: #cc2d56;
        }

        footer {
            padding: 15px;
            text-align: center;
            color: white;
            margin-top: 40px;
            font-size: 16px;
        }

    </style>
</head>
<body>

<div class="container">
    <!-- Header Section with Title and User Info -->
    <div class="header-box">
        <h1>Event List (Sorted by Date)</h1>
        <div class="user-header">
            <span>Welcome, <strong><%=userName%></strong></span>
            <button>Logout</button>
        </div>
    </div>

    <!-- Sort By Buttons -->
    <div class="sortby-container">
        <button onclick="window.location.href='eventList1.html'">Sort by Date</button>
        <button onclick="window.location.href='eventList2.html'">Sort by Popularity</button>
    </div>

    <%
        BufferedReader reader = null;
        String eventDBPath = FilePathReader.getPathFromResources(9);
        File file = new File(eventDBPath);
        String eventAnalyzeDBPath = FilePathReader.getPathFromResources(8);
        File file1 = new File(eventAnalyzeDBPath);
        reader = new BufferedReader(new FileReader(file));
        String line;
    %>

    <%
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(":");
            int ticketReminingCount = DBElementGetter.getElement(file1, CaseFixer.fixCase(parts[0]),5,0,2);
            int ticketSoldCount = DBElementGetter.getElement(file1, CaseFixer.fixCase(parts[0]),5,0,3);

    %>
    <div class="event-box">
        <h2><%=parts[0]%></h2>
        <ul>
            <li><strong>Description:</strong><%=parts[1]%></li>
            <li><strong>Event Date:</strong><%=parts[4]%></li>
            <li><strong>Tickets Remaining:</strong> <%= ticketReminingCount%> </li>
            <li><strong>Tickets Sold:</strong> <%= ticketSoldCount%> </li>
        </ul>
        <ul>
            <li><button>Buy Ticket</button></li>
        </ul>
    </div>
    <%}%>

    <!-- Event 2 -->
    <div class="event-box">
        <h2>CybrArt Exhibition</h2>
        <ul>
            <li><strong>Description:</strong>Display of contemporary cyber art from various artists.</li>
            <li><strong>Event Date:</strong>2025-07-15</li>
            <li><strong>Tickets Remaining:</strong> 195</li>
            <li><strong>Tickets Sold:</strong> 5</li>
        </ul>
        <ul>
            <li><button>Buy Ticket</button></li>
        </ul>
    </div>

</div>

<footer>
    <p>&copy; 2025 Event Management System</p>
</footer>

</body>
</html>

