<!-- Jose Franco -->
<!-- 06/17/25 -->
<!-- Assignment 5 & 6 -->
<!-- Project Part 1 -->

<%@ page import="java.util.*, beans.MovieBean" %> 
<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" /> 

<%
    // Get the list of all movie IDs to populate the dropdown select box
    ArrayList<Integer> ids = movieBean.getAllIds(); 
%>

<!DOCTYPE html>
<html>
<head>
    <title>Select Movie</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Select a Movie by ID</h2>

    <!-- Form to select a movie ID and submit -->
    <form method="post" action="display_movie.jsp">
        <label for="movieId">Movie ID:</label>

        <!-- dropdown select populated with IDs from the database -->
        <select name="movieId">
            <% 
                // Loop through all movie IDs to create <option> tags
                for (int id : ids) { 
            %>
                <option value="<%= id %>"><%= id %></option>
            <% } %>
        </select>

        <!-- submit button to send selected movie ID -->
        <input type="submit" value="View Details" />
    </form>

    <!-- navigation links -->
    <p><a href="index.jsp">Back to index page</a></p>

    <footer>
        <p>Jose Franco | CSD-430</p>
    </footer>
</body>
</html>
