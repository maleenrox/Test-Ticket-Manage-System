<%@ page import="com.ticketsys.utils.FilePathReader" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>General Admin - Event Ticket System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('../images/a (5).jpg'); /* Replace with correct path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            padding: 30px 40px;
            background: rgba(0, 0, 0, 0.7);
            border-radius: 15px;
            box-shadow: 0px 4px 8px rgba(255, 64, 129, 0.8); /* Pink shadow */
        }

        header {
            text-align: center;
            padding: 10px 0;
        }

        h1 {
            font-size: 40px;
            color: rgba(255, 64, 129, 0.8);
            text-shadow: 2px 2px 5px rgba(255, 64, 129, 0.8); /* Pink shadow */
        }

        .container .section {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
        }

        /* Expanded size for User Managers and Event Managers div boxes */
        .user-managers-box, .event-managers-box {
            background-color: rgba(0, 0, 0, 0.6); /* Slightly transparent background */
            padding: 30px; /* Increased padding for more space */
            margin: 15px; /* Increased margin */
            border-radius: 8px;
            flex: 1;
            min-width: 400px; /* Increased min-width for larger boxes */
            max-width: 450px; /* Increased max-width for larger boxes */
            box-sizing: border-box;
            box-shadow: 0px 4px 8px rgba(255, 64, 129, 0.5); /* Pink shadow for the boxes */
        }

        .box {
            background-color: rgba(0, 0, 0, 0.6); /* Slightly transparent background */
            padding: 20px;
            margin: 10px;
            border-radius: 8px;
            flex: 1;
            min-width: 250px;
            max-width: 300px;
            box-sizing: border-box;
            box-shadow: 0px 2px 4px rgba(255, 64, 129, 0.5); /* Pink shadow for the boxes */
        }

        .box h2 {
            font-size: 1.5rem;
            color: #ff3366;
        }

        .box ul {
            list-style-type: none;
            padding: 0;
        }

        .box ul li {
            margin: 10px 0;
        }

        .box ul li button {
            background-color: #ff3366;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        .box ul li button:hover {
            background-color: #cc2d56;
        }

        .general-user-details {
            background-color: rgba(255, 64, 129, 0.3); /* Keeping the "Important" message box unchanged */
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .general-user-details h3 {
            text-align: center;
            font-size: 22px;
            text-decoration: underline;
            margin-bottom: 20px;
        }

        .general-user-details ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .general-user-details li {
            font-size: 18px;
            margin: 10px 0;
        }

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

        footer {
            padding: 10px;
            text-align: center;
            color: white;
            margin-top: 30px;
        }

    </style>
</head>
<body>

<div class="container">
    <header>
        <h1>General Admin Dashboard</h1>
    </header>

    <div class="general-user-details">
        <h3>Important !</h3>
        <p>As a General Admin, you have full access to sensitive data including user, event, ticket, and manager information. Please ensure that data is handled with the highest level of confidentiality, access is limited to authorized personnel only, and all activities are monitored and logged. Be cautious when managing user, event, ticket, and manager data to ensure privacy and integrity are maintained. Failure to comply with these guidelines could result in a breach of system security.</p>
    </div>

    <div class="section">
        <!-- Users Management Section -->
        <div class="box">
            <h2>Users</h2>
            <ul class="user-count-list">
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
                <li><strong>User Count:</strong> <%=userCount%></li>
                <br>
            </ul>
            <ul>
                <li><button onclick="window.location.href='../userManager/userManagerDashboard.jsp'">Users Manage</button></li>
                <li><button onclick="window.location.href='userAnalyze.jsp'">Analyze</button></li>
            </ul>
        </div>

        <!-- Event Management Section -->
        <div class="box">
            <h2>Event</h2>
            <ul class="user-count-list">
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
                <li><strong>User Count:</strong> <%=eventCount%></li>
                <br>
            </ul>
            <ul>
                <li><button onclick="window.location.href='../eventManager/eventManagerDashboard.jsp'">Event Manage</button></li>
                <li><button onclick="window.location.href='eventAnalyze.jsp'">Analyze</button></li>
            </ul>
        </div>

        <!-- Ticket Management Section -->
        <div class="box">
            <h2>Ticket</h2>
            <ul class="user-count-list">
                <li><strong>Total Ticket Solds:</strong> 6</li>
                <li><strong>New Ticket Solds:</strong> 5</li>
                <li><strong>Today Income:</strong> $130</li>
                <li><strong>Total Income:</strong> $150</li>
            </ul>
            <ul>
                <li><button onclick="window.location.href='ticketAnalyze.jsp'">Ticket Analyze</button></li>
            </ul>
        </div>
    </div>

    <div class="section">
        <!-- User Managers Section (Larger Size) -->
        <div class="box user-managers-box">
            <h2>User Managers</h2>
            <ul class="user-count-list">
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
                <li><strong>User Count:</strong> <%=userManagerCount%></li>
                <br>
            </ul>
            <ul>
                <li><button onclick="window.location.href='userManagerSettings.jsp'">Manage User Roles</button></li>
            </ul>
        </div>

        <!-- Event Managers Section (Larger Size) -->
        <div class="box event-managers-box">
            <h2>Event Managers</h2>
            <ul class="user-count-list">
                <%
                    String eventManagerDBPath = FilePathReader.getPathFromResources(3);

                    int eventManagerCount = 0;

                    try (BufferedReader br = new BufferedReader(new FileReader(eventManagerDBPath))) {
                        while (br.readLine() != null) {
                            eventManagerCount++;
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                %>
                <li><strong>User Count:</strong> <%=eventManagerCount%></li>
                <br>
            </ul>
            <ul>
                <li><button onclick="window.location.href='eventManagerSettings.jsp'">Manage Event Roles</button></li>
            </ul>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2025 Event Management System</p>
</footer>

</body>
</html>
