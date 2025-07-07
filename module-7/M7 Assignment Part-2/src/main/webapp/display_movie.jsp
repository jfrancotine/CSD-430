<!-- Jose Franco -->
<!-- 06/24/25 -->
<!-- Assignment 7 -->
<!-- Project Part 2 -->

<%@ page import="java.sql.*, beans.MovieBean" %> 
<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" />

<%
    // Retrieve the selected movie ID from the form POST request
    int movieId = Integer.parseInt(request.getParameter("movieId"));

    // Fetch the movie record matching the selected ID
    ResultSet rs = movieBean.getRecordById(movieId);

    // Fetch all movie records from the database
    ResultSet allMovies = movieBean.getAllRecords();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Details</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

    <h2>Selected Movie</h2>

    <!-- Table showing only the selected movie -->
    <table border="1">
        <thead>
            <tr>
                <!-- Table headers matching database columns -->
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
            // Display the selected movie details if found
            if (rs.next()) { 
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
            } else { 
                // Show message if no record was found for that ID
        %>
            <tr><td colspan="6">No data found for ID: <%= movieId %></td></tr>
        <% } %>
        </tbody>
    </table>

    <h2>All Movies in Database</h2>

    <!-- Table showing all movies -->
    <table border="1">
        <thead>
            <tr>
                <!-- Table headers same as above -->
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
            // Loop through all movies and display each in a table row
            while (allMovies.next()) { 
        %>
            <tr>
                <td><%= allMovies.getInt("id") %></td>
                <td><%= allMovies.getString("title") %></td>
                <td><%= allMovies.getString("director") %></td>
                <td><%= allMovies.getInt("year_released") %></td>
                <td><%= allMovies.getString("genre") %></td>
                <td><%= allMovies.getDouble("rating") %></td>
            </tr>
        <% 
            } 

            // Close database connections to avoid leaks
            rs.getStatement().getConnection().close();
            allMovies.getStatement().getConnection().close();
        %>
        </tbody>
    </table>

    <!-- Navigation links -->
 	<<div class="nav-links">
    	<a href="index.jsp">Back to Index Page</a>
	</div>

    <footer>
        <p>Jose Franco | CSD-430</p>
    </footer>

</body>
</html>
