<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - GJ Fox</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: url('../images/pexels-introspectivedsgn-4065806.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 0;
        }

        .form-container {
            z-index: 1;
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            color: #fff;
            width: 320px;
            box-shadow: 0 0 20px rgba(255, 64, 129, 0.8);
            backdrop-filter: blur(10px);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #ff4081;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            font-size: 14px;
        }

        input::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        button {
            width: 100%;
            padding: 12px;
            background: #ff4081;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
            margin-top: 10px;
        }

        a {
            color: #4fc3f7;
            text-decoration: none;
        }

        p {
            margin-top: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="overlay"></div>

<div class="form-container">
    <h2>Register</h2>
    <form action="../RegisterServlet" method="POST">
        <input type="text" name="username" placeholder="Full Name" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="tel" name="phoneNumber" placeholder="Phone Number" required />
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="userLogin.jsp">Login</a></p>
</div>
</body>
</html>

