<!--
    Jose Franco
    07/12/25
    Assignment 9
    Project Part 4
-->

<%@ page import="java.util.*, beans.MovieBean" %>

<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" />

<%
    // retrieve a list of all movie IDs from the database
    ArrayList<Integer> ids = movieBean.getAllIds();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Select Movie to Delete</title>
    <link rel="stylesheet" href="styles.css" />
    <!-- Link to external CSS file for styling -->
</head>
<body>
    <h2>Select a Movie to Delete</h2>

    <!-- form to select a movie ID to delete -->
    <form method="post" action="delete_confirm.jsp">
        <label for="movieId">Movie ID:</label>
        
        <!-- dropdown populated dynamically with movie IDs -->
        <select name="movieId" required>
            <% for (int id : ids) { %>
                <option value="<%= id %>"><%= id %></option>
            <% } %>
        </select>
        
        <!-- Submit button to confirm deletion -->
        <input type="submit" value="Delete Movie" />
    </form>

    <div class="nav-links">
        <a href="index.jsp">Back to Index Page</a>
        <p>Want to review the movies first? <a href="list_updatedmovies.jsp">View All Movies</a></p>
        
    </div>

    <footer>
        <p>Jose Franco | CSD-430</p>
    </footer>
</body>
</html>
