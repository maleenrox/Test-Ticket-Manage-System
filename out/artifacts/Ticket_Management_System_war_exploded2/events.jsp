<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Events</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        .date-selector {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
            gap: 10px;
            align-items: center;
        }
        .date-selector select, .date-selector input, .date-selector button {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        .date-selector button {
            background-color: #4a6fa5;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .date-selector button:hover {
            background-color: #3a5a80;
        }
        .events-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 25px;
        }
        .event-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .event-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }
        .event-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .event-details {
            padding: 20px;
        }
        .event-title {
            margin: 0 0 10px 0;
            font-size: 1.5em;
            color: #2c3e50;
        }
        .event-meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            color: #7f8c8d;
            font-size: 0.9em;
        }
        .event-description {
            margin-bottom: 15px;
            line-height: 1.5;
        }
        .event-price {
            font-weight: bold;
            font-size: 1.2em;
            color: #27ae60;
        }
        .book-button {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #e74c3c;
            color: white;
            text-align: center;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
            margin-top: 15px;
        }
        .book-button:hover {
            background-color: #c0392b;
        }
        .no-events {
            text-align: center;
            grid-column: 1 / -1;
            padding: 40px;
            color: #7f8c8d;
            font-size: 1.2em;
        }
        .current-date {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.3em;
            color: #4a6fa5;
            font-weight: bold;
        }
        .error-message {
            color: #e74c3c;
            text-align: center;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Upcoming Events</h1>
        </div>
        
        <c:if test="${not empty error}">
            <div class="error-message">
                ${error}
            </div>
        </c:if>
        
        <form action="EventServlet" method="get" class="date-selector">
            <select name="date" onchange="this.form.submit()">
                <option value="">Select a date</option>
                <c:forEach items="${availableDates}" var="availableDate">
                    <option value="<fmt:formatDate value="${availableDate}" pattern="yyyy-MM-dd" />" 
                            ${selectedDate eq fmt:formatDate(value=availableDate, pattern='yyyy-MM-dd') ? 'selected' : ''}>
                        <fmt:formatDate value="${availableDate}" pattern="EEEE, MMMM d" />
                    </option>
                </c:forEach>
            </select>
            <input type="date" name="date" id="datePicker" 
                   value="${selectedDate}" onchange="this.form.submit()">
            <button type="submit">Filter</button>
        </form>
        
        <c:if test="${not empty selectedDate}">
            <div class="current-date">
                <fmt:parseDate value="${selectedDate}" pattern="yyyy-MM-dd" var="parsedDate" />
                <fmt:formatDate value="${parsedDate}" pattern="EEEE, MMMM d, yyyy" />
            </div>
        </c:if>
        
        <div class="events-container">
            <c:choose>
                <c:when test="${not empty events}">
                    <c:forEach items="${events}" var="event">
                        <div class="event-card">
                            <img src="images/${event.image}" alt="${event.name}" class="event-image">
                            <div class="event-details">
                                <h3 class="event-title">${event.name}</h3>
                                <div class="event-meta">
                                    <span>${event.venue}</span>
                                    <span>${event.time}</span>
                                </div>
                                <p class="event-description">${event.description}</p>
                                <div class="event-price">${event.formattedPrice}</div>
                                <a href="BookServlet?event=${event.name}&date=<fmt:formatDate value="${event.date}" pattern="yyyy-MM-dd" />" 
                                   class="book-button">Book Now</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="no-events">
                        No events scheduled for this date. Please check another date.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <script>
        
        document.getElementById('datePicker').addEventListener('change', function() {
            const select = document.querySelector('select[name="date"]');
            select.value = this.value;
        });
        
        document.querySelector('select[name="date"]').addEventListener('change', function() {
            const dateInput = document.getElementById('datePicker');
            dateInput.value = this.value;
        });
    </script>
</body>
</html>