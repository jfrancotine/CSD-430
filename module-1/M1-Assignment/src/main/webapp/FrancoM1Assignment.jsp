<%-- Jose Franco
     05/27/2025
     Module 1 Assignment
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>A Simple JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8; 
            color: #333;
            margin: 40px;
        }
        h1 {
            color: #1e3a8a; 
        }
        p {
            background-color: #ffffff;
            padding: 10px;
            border-left: 5px solid #60a5fa;
            margin-bottom: 10px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <h1>Welcome to My JSP Page!</h1>

    <p>My name is Jose Franco and I'm from Flower Mound, TX.</p>
    
    <p>Current date and time: <%= new Date() %></p>
    
    <p>Server hostname: <%= request.getServerName() %></p>
    
    <p>Server IP address: <%= request.getLocalAddr() %></p>
</body>
</html>
