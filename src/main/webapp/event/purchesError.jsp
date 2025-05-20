<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="com.ticketsys.utils.*" %>

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
    <title>Purchase Unsuccessful</title>
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

        .error-details {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(255, 64, 129, 0.5);
        }

        .error-details h2 {
            font-size: 1.8rem;
            color: #ff3366;
            margin-bottom: 20px;
        }

        .error-details ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .error-details ul li {
            margin: 12px 0;
            font-size: 18px;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .button-container a {
            background-color: #ff3366;
            color: white;
            padding: 12px 30px;
            font-size: 18px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
        }

        .button-container a:hover {
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
        <h1>Purchase Unsuccessful</h1>
        <div class="user-header">
            <span>Welcome, <strong><%=userName%></strong></span>
            <button onclick="window.location.href='../user/userLogOut.jsp'">Logout</button>
        </div>
    </div>

    <%
        String eventName = (String) sessionObj.getAttribute("eventName");
        // Use this eventName to fetch event details from the database

        if (eventName == null){
            response.sendRedirect("event/eventList1.jsp");
            return;
        }

        String ticketCount = (String) sessionObj.getAttribute("ticketCount");
        String error = (String) sessionObj.getAttribute("error");

    %>

    <!-- Error Message -->
    <div class="error-details">
        <h2>There was an issue with your ticket purchase</h2>
        <ul>
            <li><strong>Reason: </strong><%=error%></li>
            <li><strong>Event Name: </strong><%=eventName%></li>
            <li><strong>Tickets Requested: </strong><%=ticketCount%></li>
        </ul>
    </div>

    <!-- Return to Event List -->
    <div class="button-container">
        <a href="eventList1.jsp">Return to Event List</a>
    </div>

</div>

<footer>
    <p>&copy; 2025 Event Management System</p>
</footer>

</body>
</html>
