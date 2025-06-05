<!-- Jose Franco
 06/04/2025 
 Module 3 Assignment 
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Feedback Results</title>
    
    <!-- link to external CSS -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- page header -->
    <h1>Thank You for Your Feedback!</h1>
    <p>We appreciate you taking the time to let us know about your experience.</p>

    <!-- retrieving submitted form data from request parameters -->
    <%
        String name = request.getParameter("name");           // Gets the "name" value from the form
        String email = request.getParameter("email");         // Gets the "email" value
        String rating = request.getParameter("rating");       // Gets the "rating" value
        String visitDate = request.getParameter("visitDate"); // Gets the "visitDate" value
        String comments = request.getParameter("comments");   // Gets the "comments" value
    %>

    <!-- section header for submitted data -->
    <h2>Submitted Information</h2>

    <!-- Table to display submitted feedback -->
    <table>
        <tr>
            <th>Field</th>
            <th>Submitted Value</th>
        </tr>
        <tr>
            <td>Name</td>
            <td><%= name %></td> <!-- displays the submitted name -->
        </tr>
        <tr>
            <td>Email</td>
            <td><%= email %></td> <!-- displays the submitted email -->
        </tr>
        <tr>
            <td>Rating</td>
            <td><%= rating %></td> <!-- displays the selected rating -->
        </tr>
        <tr>
            <td>Date of Visit</td>
            <td><%= visitDate %></td> <!-- displays the submitted visit date -->
        </tr>
        <tr>
            <td>Comments</td>
            <td><%= comments %></td> <!-- displays the submitted comments -->
        </tr>
    </table>
</body>
</html>

