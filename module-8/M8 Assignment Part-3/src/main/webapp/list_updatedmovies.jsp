<!--
    Jose Franco
    06/24/25
    Assignment 7
    Project Part 2
-->

<%@ page import="java.sql.*, beans.MovieBean" %> 
<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" /> 

<%
    ResultSet rs = null; // will hold the result set from the database query
    try {
        // call JavaBean method to get all movie records
        rs = movieBean.getAllRecords();
    } catch (Exception e) {
        // handle any exceptions during database access
        out.println("<p>Error loading records: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Movies</title>
    <link rel="stylesheet" href="styles.css" /> <!-- External CSS file -->
</head>
<body>
    <h2>Displaying All Movies in the Database</h2>

    <!-- Table to display movie records -->
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Director</th>
                <th>Year Released</th>
                <th>Genre</th>
                <th>Rating</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // check if result set is not null before iterating
                if (rs != null) {
                    while (rs.next()) { // Loop through each record
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("director") %></td>
                <td><%= rs.getInt("year_released") %></td>
                <td><%= rs.getString("genre") %></td>
                <td><%= rs.getDouble("rating") %></td>
            </tr>
            <% 
                    }
                    // Close database connection after reading all records
                    rs.getStatement().getConnection().close();
                } 
            %>
        </tbody>
    </table>

    <!-- Navigation links -->
    <div class="nav-links">
        <a href="add_movie.jsp">Add Another Movie</a>
        <a href="index.jsp">Back to Index Page</a>
    </div>
</body>
</html>
