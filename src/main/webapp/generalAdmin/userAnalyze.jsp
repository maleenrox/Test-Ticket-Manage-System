<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="com.ticketsys.utils.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details Analyze - Event Ticket System</title>
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
        .user-info, .general-user-info {
            margin-bottom: 30px;
            padding: 15px;
            background: rgba(255, 64, 129, 0.3);
            border-radius: 10px;
            box-shadow: 0px 2px 4px rgba(255, 64, 129, 0.5);
        }

        .user-info h3, .general-user-info h3 {
            text-align: center;
            font-size: 22px;
            text-decoration: underline;
            margin-bottom: 20px;
        }

        /* Styling for unordered list */
        .user-info ul, .general-user-info ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .user-info li, .general-user-info li {
            font-size: 18px;
            margin-bottom: 15px; /* Added space between list items */
        }

        /* Bold styling for question part */
        .user-info li span, .general-user-info li span {
            font-weight: bold;
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

<%
    String userDBPath = FilePathReader.getPathFromResources(3);

    int userCount = 0;

    try (BufferedReader br = new BufferedReader(new FileReader(userDBPath))) {
        while (br.readLine() != null) {
            userCount++;
        }
    } catch (IOException e) {
        e.printStackTrace();
    }

%>

<div class="container">
    <header>
        <h1>User Details Analyze</h1>
    </header>

    <!-- Description Section -->
    <div class="description">
        <p>Analyze user details in the event ticketing system. You can view the total ticket count and total transaction amount for each user.</p>
    </div>

    <!-- General User Details Section -->
    <div class="general-user-info">
        <h3>General User Details</h3>
        <ul>
            <li><span>Total Users:</span> <%=userCount%></li>
            <li><span>Total Ticket Count:</span> 6</li>
            <li><span>Total Revenue:</span> $150</li>
        </ul>
    </div>

    <!-- User Details Section -->
    <div class="user-info">
        <h3>User Details</h3>
        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>User Name</th>
                    <th>Total Ticket Count</th>
                    <th>Total Transaction Amount</th>
                </tr>
                </thead>
                <tbody>
                <%
                BufferedReader reader = null;
                File file = new File(userDBPath);
                reader = new BufferedReader(new FileReader(file));
                String line;

                while ((line = reader.readLine()) != null) {
                  String[] parts = line.split(":");%>
                    <tr>
                        <td><%=parts[0]%></td>
                        <td><%=parts[1]%></td>
                        <td><%=parts[2]%></td>
                    </tr>
                <%}%>
                </tbody>

            </table>
        </div>
    </div>
</div>

<footer>
    <p>Event Ticket Management System</p>
</footer>

</body>
</html>
