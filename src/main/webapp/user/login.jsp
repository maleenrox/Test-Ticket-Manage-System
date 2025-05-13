<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Retrieve error message from session
    HttpSession sessionObj = request.getSession();
    String error = (String) sessionObj.getAttribute("error");
    String success = (String) sessionObj.getAttribute("success");
    sessionObj.removeAttribute("success"); // clear success after displaying
    sessionObj.removeAttribute("error"); // Clear error after displaying
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Inventory Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #00bcd4, #008cba);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        .hero i {
            font-size: 50px;
            color: #00bcd4;
            margin-bottom: 20px;
        }
        h2 {
            font-size: 28px;
            font-weight: 500;
            color: #333;
            margin-bottom: 20px;
        }
        .error-box {
            background: #ffdddd;
            color: #d8000c;
            border-left: 5px solid #d8000c;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 14px;
            border-radius: 5px;
        }
        .success-box {
            background: #b6f3aa;
            color: #179117;
            border-left: 5px solid #07ff31;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 14px;
            border-radius: 5px;
        }
        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .input-group label {
            font-size: 16px;
            color: #333;
            font-weight: 600;
            display: block;
            margin-bottom: 5px;
        }
        .input-group input {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 16px;
            outline: none;
            transition: all 0.3s ease;
        }
        .input-group input:focus {
            border-color: #00bcd4;
        }
        .button {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #00bcd4;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #008cba;
        }
        .back-btn {background-color: #00bcd4; color: #fff;text-decoration: none; }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
        .footer a {
            color: #008cba;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="hero">
        <i class="bi bi-person-circle"></i>
        <h2>Login to Your Account</h2>
    </div>

    <!-- Display error message if exists -->
    <% if (error != null) { %>
        <div class="error-box"><%= error %></div>
    <% } %>

    <!-- Display success message if exists -->
    <% if (success != null) { %>
        <div class="success-box"><%= success %></div>
    <% } %>

    <form action="../LoginServlet" method="post">
        <div class="input-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required placeholder="Enter your username">
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required placeholder="Enter your password">
        </div>
        <button type="submit" class="button">Login</button>
    </form>
    <div class="footer">
        <p>Need help? <a href="../event/contact.jsp">Contact Us</a></p>
    </div>

    <div class="footer">
        <p>Don't have an account? <a href="register.jsp">Register</a></p>
    </div>
    <a href="loginSelection.jsp" class="button back-btn" >Back</a>

</body>
</html>
