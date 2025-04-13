<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .dashboard {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        .card {
            background: #fff;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .card h3 {
            margin-top: 0;
            color: #333;
        }
        .stats-container {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            flex: 1;
            background: #4a6fa5;
            color: white;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }
        .stat-card h2 {
            margin: 0;
            font-size: 2.5em;
        }
        .stat-card p {
            margin: 5px 0 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4a6fa5;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <div class="header">
            <h1>Admin Dashboard</h1>
            <p>Welcome, Admin</p>
        </div>
        
        <div class="stats-container">
            <div class="stat-card">
                <h2>${totalTickets}</h2>
                <p>Tickets Sold</p>
            </div>
            <div class="stat-card">
                <h2>${userCount}</h2>
                <p>Logged-in Users</p>
            </div>
        </div>
        
        <div class="card">
            <h3>Ticket Sales by Event</h3>
            <table>
                <thead>
                    <tr>
                        <th>Event Type</th>
                        <th>Tickets Sold</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ticketSales}" var="entry">
                        <tr>
                            <td>${entry.key}</td>
                            <td>${entry.value}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <div class="card">
            <h3>Currently Logged-in Users</h3>
            <table>
                <thead>
                    <tr>
                        <th>Username</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${loggedInUsers}" var="user">
                        <tr>
                            <td>${user}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <div class="card">
            <h3>User Ticket Purchases</h3>
            <table>
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Tickets Purchased</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${userTickets}" var="entry">
                        <tr>
                            <td>${entry.key}</td>
                            <td>
                                <ul>
                                    <c:forEach items="${entry.value}" var="ticket">
                                        <li>${ticket}</li>
                                    </c:forEach>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>