<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="com.ticketsys.utils.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Management - Event Ticket System</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('../images/a (2).jpg'); /* Replace with correct path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
        }

        /* Container for content */
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 30px 40px;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 15px;
            box-shadow: 0px 4px 8px rgba(255, 64, 129, 0.8); /* Pink shadow only for the title */
        }

        /* Title styling with shadow */
        header {
            text-align: center;
            padding: 10px 0;
        }

        h1 {
            font-size: 40px;
            color: rgba(255, 64, 129, 0.8);
            text-shadow: 2px 2px 5px rgba(255, 64, 129, 0.8); /* Pink shadow for title */
        }

        /* Description between title and event details */
        .description {
            margin-top: 20px;
            font-size: 18px;
            color: white;
            text-align: center;
        }

        /* General detail section with more space between items */
        .event-info {
            margin-bottom: 30px;
            padding: 15px;
            background: rgba(255, 64, 129, 0.3);
            border-radius: 10px;
            box-shadow: 0px 2px 4px rgba(255, 64, 129, 0.5);
        }

        .event-info ul {
            list-style-type: disc;
            margin-left: 20px;
        }

        .event-info li {
            font-size: 18px;
            margin: 10px 0; /* Increased margin between list items */
        }

        /* General Event Details Title */
        .event-info h3 {
            text-align: center;
            font-size: 22px;
            text-decoration: underline;
            margin-bottom: 20px;
        }

        /* Buttons styling */
        .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .buttons button {
            padding: 10px 25px;
            background-color: rgba(255, 64, 129, 0.8);
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .buttons button:hover {
            background-color: rgba(255, 64, 129, 1);
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        th, td {
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: rgba(255, 64, 129, 0.8);
        }

        tr:nth-child(even) {
            background-color: rgba(255, 64, 129, 0.1);
        }

        tr:hover {
            background-color: rgba(255, 64, 129, 0.2);
        }

        .table-container {
            margin-top: 20px;
            overflow-x: auto;
        }

        /* Footer */
        footer {
            text-align: center;
            margin-top: 20px;
            color: white;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="container">
    <header>
        <h1>Event Management</h1>
    </header>

    <!-- Description Section -->
    <div class="description">
        <p>Manage and monitor all events in the event ticketing system. You can add new events, remove events, and view their details and activity in this section.</p>
    </div>

    <%
        String eventDBPath = FilePathReader.getPathFromResources(16);

        int eventCount = 0;

        try (BufferedReader br = new BufferedReader(new FileReader(eventDBPath))) {
            while (br.readLine() != null) {
                eventCount++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    %>

    <!-- General Event Detail Section -->
    <div class="event-info">
        <h3>General Event Details</h3>
        <ul>
            <li>Active Event Count: <strong><%=eventCount%></strong></li>
<%--            <li>Total Active Ticket Count: <strong>6</strong></li>--%>
        </ul>
    </div>

    <!-- Buttons to Add/Remove Events -->
    <div class="buttons">
        <button onclick="window.location.href='addEvent.jsp'">Add Event</button>
        <button onclick="window.location.href='removeEvent.jsp'">Remove Event</button>
    </div>

    <!-- Table displaying event data -->
    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>Event Name</th>
                <th>Event Description</th>
                <th>Ticket Count</th> <!-- Ticket Count Column added here -->
                <th>Ticket Value</th>
                <th>Event Date</th>
            </tr>
            </thead>
            <tbody>
            <%
                BufferedReader reader = null;
                File file = new File(eventDBPath);
                reader = new BufferedReader(new FileReader(file));
                String line;

                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(":");%>
            <tr>
                <td><%=parts[0]%></td>
                <td><%=parts[1]%></td>
                <td><%=parts[2]%></td>
                <td><%=parts[3]%></td>
                <td><%=parts[4]%></td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>

<footer>
    <p>Event Ticket Management System</p>
</footer>

</body>
</html>
