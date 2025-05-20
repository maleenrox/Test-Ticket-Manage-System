<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="com.ticketsys.utils.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Manager Settings - Event Ticket System</title>
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

        /* Description between title and user details */
        .description {
            margin-top: 20px;
            font-size: 18px;
            color: white;
            text-align: center;
        }

        /* General detail section with more space between items */
        .user-info {
            margin-bottom: 30px;
            padding: 15px;
            background: rgba(255, 64, 129, 0.3);
            border-radius: 10px;
            box-shadow: 0px 2px 4px rgba(255, 64, 129, 0.5);
        }

        .user-info ul {
            list-style-type: disc;
            margin-left: 20px;
        }

        .user-info li {
            font-size: 18px;
            margin: 10px 0; /* Increased margin between list items */
        }

        /* General User Details Title */
        .user-info h3 {
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
        <h1>User Manager Settings</h1>
    </header>

    <!-- Description Section -->
    <div class="description">
        <p>Manage and monitor all user managers in the event ticketing system. You can add new user managers, remove user managers, and view their details and activity in this section.</p>
    </div>
    <%
        String userManagerDBPath = FilePathReader.getPathFromResources(8);

        int userManagerCount = 0;

        try (BufferedReader br = new BufferedReader(new FileReader(userManagerDBPath))) {
            while (br.readLine() != null) {
                userManagerCount++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    %>


    <!-- General Detail Section (User Count) -->
    <div class="user-info">
        <h3>General User Manager Details</h3>
        <ul>
            <li>User Manager Count: <strong> <%= userManagerCount %></strong></li>
        </ul>
    </div>

    <!-- Buttons to Add/Remove Users -->
    <div class="buttons">
        <button onclick="window.location.href='addUserManager.jsp'">Add User Manager</button>
        <button onclick="window.location.href='removeUserManager.jsp'">Remove User Manager</button>
    </div>

    <!-- Table displaying user data -->
    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>User Manager ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Contact Number</th>
            </tr>
            </thead>
            <tbody>
            <%
                BufferedReader reader = null;
                File file = new File(userManagerDBPath);
                reader = new BufferedReader(new FileReader(file));
                String line;

                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(":");%>
            <tr>
                <td><%=parts[0]%></td>
                <td><%=parts[1]%></td>
                <td><%=parts[2]%></td>
                <td><%=parts[3]%></td>
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

