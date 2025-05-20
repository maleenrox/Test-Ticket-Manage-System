<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Data Analyze - Event Ticket System</title>
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

        /* General event detail section */
        .event-info {
            margin-bottom: 30px;
            padding: 15px;
            background: rgba(255, 64, 129, 0.3);
            border-radius: 10px;
            box-shadow: 0px 2px 4px rgba(255, 64, 129, 0.5);
        }

        .event-info h3 {
            text-align: center;
            font-size: 22px;
            text-decoration: underline;
            margin-bottom: 20px;
        }

        /* Styling for unordered list */
        .event-info ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .event-info li {
            font-size: 18px;
            margin-bottom: 15px; /* Added space between list items */
        }

        /* Bold styling for question part */
        .event-info li span {
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

<div class="container">
    <header>
        <h1>Event Data Analyze</h1>
    </header>

    <!-- Description Section -->
    <div class="description">
        <p>Analyze event details in the event ticketing system. You can view the total ticket count, tickets remaining, tickets sold, and total income for each event.</p>
    </div>

    <!-- General Event Details Section -->
    <div class="event-info">
        <h3>General Event Details</h3>
        <ul>
            <li><span>Total Events:</span> 2</li>
            <li><span>Total Tickets Sold:</span> 6</li>
            <li><span>Total Revenue:</span> $150</li>
        </ul>
    </div>

    <!-- Event Data Section -->
    <div class="event-info">
        <h3>Event Data</h3>
        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>Event Name</th>
                    <th>Total Ticket Count</th>
                    <th>Tickets Remains</th>
                    <th>Tickets Sold</th>
                    <th>Total Income</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Conspirito 25</td>
                    <td>200</td>
                    <td>199</td>
                    <td>1</td>
                    <td>$50</td>
                </tr>
                <tr>
                    <td>CybrArt Exhibition</td>
                    <td>200</td>
                    <td>195</td>
                    <td>5</td>
                    <td>$100</td>
                </tr>
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
