<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Invalidate the session to log out the user
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj != null) {
        sessionObj.invalidate();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logout - GJ Fox</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: url('../images/a(8).jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        /* Transparent overlay */
        .overlay {
            position: absolute;
            top: 0;
            right: 0;
            height: 100%;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 0;
        }

        .logout-container {
            z-index: 1;
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 15px;
            color: #fff;
            width: 350px;
            box-shadow: 0 0 30px rgba(255, 64, 129, 0.8);
            backdrop-filter: blur(15px);
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #ff4081;
            font-size: 24px;
        }

        p.message {
            font-size: 16px;
            margin-bottom: 25px;
        }

        a.button {
            display: inline-block;
            width: 100%;
            padding: 15px;
            background: #ff4081;
            color: white;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        a.button:hover {
            background: #e8366d;
        }
    </style>
</head>
<body>
<div class="overlay"></div>

<div class="logout-container">
    <h2>Logout</h2>
    <p class="message">You have been logged out successfully.</p>
    <a href="../user/userLogin.jsp" class="button">Login Again</a>
</div>

</body>
</html>
