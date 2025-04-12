<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Login Page</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            background-color: #f5f5f5;--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            display: flex;--%>
<%--            justify-content: center;--%>
<%--            align-items: center;--%>
<%--            height: 100vh;--%>
<%--        }--%>
<%--        .login-container {--%>
<%--            background: white;--%>
<%--            padding: 30px;--%>
<%--            border-radius: 8px;--%>
<%--            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);--%>
<%--            width: 350px;--%>
<%--        }--%>
<%--        .login-header {--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 25px;--%>
<%--        }--%>
<%--        .login-header h2 {--%>
<%--            color: #333;--%>
<%--            margin: 0;--%>
<%--        }--%>
<%--        .form-group {--%>
<%--            margin-bottom: 20px;--%>
<%--        }--%>
<%--        .form-group label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 5px;--%>
<%--            color: #555;--%>
<%--            font-weight: bold;--%>
<%--        }--%>
<%--        .form-group input {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            border: 1px solid #ddd;--%>
<%--            border-radius: 4px;--%>
<%--            box-sizing: border-box;--%>
<%--        }--%>
<%--        .btn-login {--%>
<%--            width: 100%;--%>
<%--            padding: 12px;--%>
<%--            background-color: #4a6fa5;--%>
<%--            color: white;--%>
<%--            border: none;--%>
<%--            border-radius: 4px;--%>
<%--            cursor: pointer;--%>
<%--            font-size: 16px;--%>
<%--            transition: background-color 0.3s;--%>
<%--        }--%>
<%--        .btn-login:hover {--%>
<%--            background-color: #3a5a80;--%>
<%--        }--%>
<%--        .error-message {--%>
<%--            color: #d9534f;--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 15px;--%>
<%--        }--%>
<%--        .footer {--%>
<%--            text-align: center;--%>
<%--            margin-top: 20px;--%>
<%--            color: #777;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <div class="login-container">--%>
<%--        <div class="login-header">--%>
<%--            <h2>Admin Login</h2>--%>
<%--        </div>--%>
<%--        --%>
<%--        &lt;%&ndash; Display error message if authentication fails &ndash;%&gt;--%>
<%--        <c:if test="${not empty errorMessage}">--%>
<%--            <div class="error-message">${errorMessage}</div>--%>
<%--        </c:if>--%>
<%--        --%>
<%--        <form action="LoginServlet" method="post">--%>
<%--            <div class="form-group">--%>
<%--                <label for="username">Username</label>--%>
<%--                <input type="text" id="username" name="username" required>--%>
<%--            </div>--%>
<%--            --%>
<%--            <div class="form-group">--%>
<%--                <label for="password">Password</label>--%>
<%--                <input type="password" id="password" name="password" required>--%>
<%--            </div>--%>
<%--            --%>
<%--            <button type="submit" class="btn-login">Login</button>--%>
<%--        </form>--%>
<%--        --%>
<%--		<div class="footer">--%>
<%--			<p>Don't have an account? <a href="register.jsp">Register here</a></p>--%>
<%--			<p>Ticket Management System</p>--%>
<%--		</div>--%>
<%--		--%>
<%--        <div class="footer">--%>
<%--            <p>Ticket Management System</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Retrieve error message from session
    HttpSession sessionObj = request.getSession();
    String error = (String) sessionObj.getAttribute("error");
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

    <form action="LoginServlet" method="post">
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
        <p>Need help? <a href="contact.jsp">Contact Us</a></p>
    </div>

    <div class="footer">
        <p>Don't have an account? <a href="register.jsp">Register</a></p>
    </div>
    <a href="loginSelection.jsp" class="button back-btn" >Back</a>

</body>
</html>
