<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to Event Ticket System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url('images/a (2).jpg');
            background-size: cover;
            background-position: center;
            color: white;
            overflow: hidden;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.75);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
        }

        .container {
            position: relative;
            z-index: 2;
            text-align: center;
            padding: 100px 20px 60px;
        }

        h1 {
            font-size: 60px;
            color: rgba(255, 64, 129, 0.9);
            text-shadow: 3px 3px 8px rgba(255, 64, 129, 0.8);
            margin-bottom: 40px;
        }

        .slide-show {
            font-size: 30px;
            min-height: 50px;
            font-style: italic;
            color: white; /* <- changed to plain white */
            text-shadow:
                    0 0 5px white,
                    0 0 10px white,
                    0 0 20px white,
                    0 0 40px #aaa,
                    0 0 60px #999;
            animation: blinkNeon 1.5s infinite alternate, fadeInOut 4s ease-in-out infinite;
        }

        @keyframes blinkNeon {
            0% {
                opacity: 0.4;
                text-shadow:
                        0 0 2px white,
                        0 0 4px white,
                        0 0 8px white,
                        0 0 16px #aaa;
            }
            100% {
                opacity: 1;
                text-shadow:
                        0 0 5px white,
                        0 0 10px white,
                        0 0 20px white,
                        0 0 40px #aaa,
                        0 0 60px #999;
            }
        }

        @keyframes fadeInOut {
            0%, 100% { opacity: 0.9; }
            50% { opacity: 0.3; }
        }

        .buttons {
            margin-top: 50px;
        }

        .buttons button {
            background-color: #ff3366;
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 18px;
            margin: 10px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .buttons button:hover {
            background-color: #cc2d56;
            transform: scale(1.05);
        }

        footer {
            text-align: center;
            margin-top: 100px;
            color: #ccc;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="overlay"></div>
<div class="container">
    <h1>Welcome to Event World</h1>
    <div class="slide-show" id="slideText">Your next adventure awaits...</div>

    <div class="buttons">
        <button onclick="window.location.href='user/userLogin.jsp'">Login</button>
        <button onclick="window.location.href='user/userRegister.jsp'">Register</button>
    </div>

    <footer>&copy; 2025 Event Ticket System. All rights reserved.</footer>
</div>

<script>
    const phrases = [
        "Your next adventure awaits...",
        "Unforgettable nights. Just a ticket away.",
        "Discover events that spark your passion.",
        "Join the moments that matter most.",
        "Experience the thrill of live events.",
        "Create memories that last forever."
    ];

    let currentIndex = 0;
    const slideText = document.getElementById("slideText");

    function showNextPhrase() {
        slideText.style.opacity = 0;
        setTimeout(() => {
            slideText.textContent = phrases[currentIndex];
            slideText.style.opacity = 1;
            currentIndex = (currentIndex + 1) % phrases.length;
        }, 500);
    }

    setInterval(showNextPhrase, 4000);
</script>
</body>
</html>
