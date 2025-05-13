<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .register-header {
            text-align: center;
            margin-bottom: 25px;
        }
        .register-header h2 {
            color: #333;
            margin: 0;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-register {
            width: 100%;
            padding: 12px;
            background-color: #4a6fa5;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn-register:hover {
            background-color: #3a5a80;
        }
        .error-message {
            color: #d9534f;
            margin-bottom: 15px;
        }
        .error-message ul {
            margin: 0;
            padding-left: 20px;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #777;
        }
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
        .login-link a {
            color: #4a6fa5;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <h2>Create Account</h2>
        </div>
        
        <%-- Display error messages if any --%>
        <c:if test="${not empty errors}">
            <div class="error-message">
                <ul>
                    <c:forEach items="${errors}" var="error">
                        <li>${error}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        
        <form action="../RegisterServlet" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label for="phoneNo">Phone Number</label>
                <input type="number" id="phoneNo" name="phoneNo" required>
            </div>
            
            <button type="submit" class="btn-register">Register</button>
        </form>
        
        <div class="login-link">
            Already have an account? <a href="login.jsp">Sign in</a>
        </div>
        
        <div class="footer">
            <p>Ticket Management System</p>
        </div>
    </div>
</body>
</html>