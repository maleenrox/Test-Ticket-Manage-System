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
    <title>Login Selection - GJ Fox</title>
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

        .overlay {
            position: absolute;
            top: 0;
            right: 0;
            height: 100%;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 0;
        }

        .form-container {
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

        button {
            width: 100%;
            padding: 15px;
            background: #ff4081;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
            transition: background 0.3s ease;
        }

        button:hover {
            background: #e8366d;
        }

        .admin-login {
            margin-top: 20px;
        }

        .admin-login a {
            color: #ff4081;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
            display: block;
            margin: 10px 0;
        }

        .divider {
            margin: 20px 0;
            border-top: 1px solid rgba(255, 255, 255, 0.3);
            height: 1px;
            width: 100%;
        }

        .error-box {
            width: fit-content;
            margin: 10px;
            padding: 10px;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            border: 1px solid #ff4081;
            border-radius: 5px;
            background-color: #ff4081;
            z-index: 100;
        }
    </style>
</head>
<body>
<div class="overlay"></div>

<div class="alert-box">
    <% if (error != null) { %>
    <div class="error-box" id="alert-box">
        <div class="error-container">
            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 50 50">
                <path d="M25,2C12.297,2,2,12.297,2,25s10.297,23,23,23s23-10.297,23-23S37.703,2,25,2z M25,11c1.657,0,3,1.343,3,3s-1.343,3-3,3 s-3-1.343-3-3S23.343,11,25,11z M29,38h-2h-4h-2v-2h2V23h-2v-2h2h4v2v13h2V38z"></path>
            </svg>
            <%= error %>
        </div>
    </div>
    <% } %>
</div>

<div class="form-container">
    <h2>Select Your Role</h2>
        <button onclick="window.location.href='../userManager/userManagerLogin.jsp'">User Manager</button>
        <button onclick="window.location.href='../eventManager/eventManagerLogin.jsp'">Event Manager</button>
        <button onclick="window.location.href='../generalAdmin/generalAdminLogin.jsp'">General Admin</button>

    <div class="divider"></div>
    <div class="admin-login">
        <p><a href="userLogin.jsp">Back to Login</a></p>
    </div>
</div>

<script>
    setTimeout(function () {
        document.getElementById("alert-box").style.display = "none";
    }, 5000);
</script>
</body>
</html>
