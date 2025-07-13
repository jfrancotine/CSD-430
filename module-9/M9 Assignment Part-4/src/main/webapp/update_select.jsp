<!--
    Jose Franco
    07/06/25
    Assignment 8
    Project Part 3
-->

<%@ page import="java.util.*, beans.MovieBean" %> 
<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" /> 

<%
    // retrieve all movie IDs from the database to populate the dropdown list
    ArrayList<Integer> ids = movieBean.getAllIds();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Select Movie to Update</title>
    <link rel="stylesheet" href="styles.css" /> 
</head>
<body>
    <h2>Select a Movie to Update</h2>

    <!-- form to select a movie ID and submit it to update_form.jsp -->
    <form method="post" action="update_form.jsp">
        <label for="movieId">Movie ID:</label>
        <select name="movieId" required>
            <% 
                // loop through movie IDs and create an option for each
                for (int id : ids) { 
            %>
                <option value="<%= id %>"><%= id %></option>
            <% } %>
        </select>
        <input type="submit" value="Edit Movie" />
    </form>

    <!-- Navigation link -->
    <div class="nav-links">
        <a href="index.jsp">Back to Index Page</a>
    </div>
    <footer>
        <p>Jose Franco | CSD-430</p>
    </footer>
</body>
</html>
