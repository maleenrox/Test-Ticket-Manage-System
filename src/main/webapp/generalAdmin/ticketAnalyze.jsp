<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ticket Analyze - Event Ticket System</title>
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
    .ticket-info, .general-ticket-info {
      margin-bottom: 30px;
      padding: 15px;
      background: rgba(255, 64, 129, 0.3);
      border-radius: 10px;
      box-shadow: 0px 2px 4px rgba(255, 64, 129, 0.5);
    }

    .ticket-info h3, .general-ticket-info h3 {
      text-align: center;
      font-size: 22px;
      text-decoration: underline;
      margin-bottom: 20px;
    }

    /* Styling for unordered list */
    .ticket-info ul, .general-ticket-info ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
    }

    .ticket-info li, .general-ticket-info li {
      font-size: 18px;
      margin-bottom: 15px; /* Added space between list items */
    }

    /* Bold styling for question part */
    .ticket-info li span, .general-ticket-info li span {
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
    <h1>Ticket Analyze</h1>
  </header>

  <!-- Description Section -->
  <div class="description">
    <p>Analyze ticket purchases in the event ticketing system. You can view user purchase details, including event names, ticket count, total cost, and date and time.</p>
  </div>

  <!-- General Ticket Details Section -->
  <div class="general-ticket-info">
    <h3>General Ticket Details</h3>
    <ul>
      <li><span>Total Ticket Count:</span> 400</li>
      <li><span>Total Revenue:</span> $150</li>
      <li><span>Tickets Sold Today:</span> 5</li>
    </ul>
  </div>

  <!-- Ticket Purchase Section -->
  <div class="ticket-info">
    <h3>Ticket Purchases</h3>
    <div class="table-container">
      <table>
        <thead>
        <tr>
          <th>User Name</th>
          <th>Event Name</th>
          <th>Ticket Count</th>
          <th>Total Cost</th>
          <th>Date and Time</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>Ranil</td>
          <td>Conspirito 25</td>
          <td>1</td>
          <td>$50</td>
          <td>2025-05-05 19:34</td>
        </tr>
        <tr>
          <td>user</td>
          <td>CybrArt Exhibition</td>
          <td>4</td>
          <td>$80</td>
          <td>2025-05-04 22:30</td>
        </tr>
        <tr>
          <td>user</td>
          <td>CybrArt Exhibition</td>
          <td>1</td>
          <td>$20</td>
          <td>2025-05-04 22:26</td>
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
