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
  <title>User Manager Login - GJ Fox</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background: url('../images/a (7).jpg') no-repeat center center fixed;
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
      left: 0;
      height: 100%;
      width: 100%;
      background-color: rgba(0, 0, 0, 0.6); /* dark transparent overlay */
      z-index: 0;
    }

    .form-container {
      z-index: 1;
      background: rgba(255, 255, 255, 0.1); /* transparent white */
      padding: 40px;
      border-radius: 15px;
      color: #fff;
      width: 350px;
      box-shadow: 0 0 30px #ff1837;
      backdrop-filter: blur(15px);
      text-align: center;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    h2 {
      margin-bottom: 20px;
      color: #ff1837;
      font-size: 24px;
    }

    input {
      width: 100%;
      padding: 15px;
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
      padding: 15px;
      background: #ff1837;
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

    a {
      color: #4fc3f7;
      text-decoration: none;
    }

    .options {
      margin-top: 15px;
      font-size: 14px;
    }

    .options a {
      display: inline-block;
      margin-top: 5px;
    }
    .alert-box {
      position: absolute;
      top: 0;
      right: 0;
      /*height: 100%;*/
      /*width: 100%;*/
      z-index: 50;
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
    .error-container {
      width: 90%;
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .close-btn {
      width: fit-content;
      height: fit-content;
      padding: 5px 10px;
      border-radius: 5px;
    }
    .close-btn:hover {
      background-color: rgba(0, 0, 0, 0.1);
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
    <div class="close-btn" onclick="document.getElementById('alert-box').style.display = 'none';">
      <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="10" height="10" viewBox="0 0 50 50">
        <path d="M 7.71875 6.28125 L 6.28125 7.71875 L 23.5625 25 L 6.28125 42.28125 L 7.71875 43.71875 L 25 26.4375 L 42.28125 43.71875 L 43.71875 42.28125 L 26.4375 25 L 43.71875 7.71875 L 42.28125 6.28125 L 25 23.5625 Z"></path>
      </svg>
    </div>
  </div>
  <% } %>
</div>

<div class="form-container">
  <h2>User Manager Login</h2>
  <form action="../UserManagerLoginServlet" method="POST">
    <input type="text" name="username" placeholder="User Manager ID" required />
    <input type="password" name="password" placeholder="Password" required />
    <button type="submit">Login</button>
  </form>
</div>

<script>
  setTimeout(function () {
    document.getElementById("alert-box").style.display = "none";
  }, 5000);
</script>
</body>
</html>
