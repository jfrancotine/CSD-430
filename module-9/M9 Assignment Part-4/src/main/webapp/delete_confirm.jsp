<!--
    Jose Franco
    07/12/25
    Assignment 9
    Project Part 4
-->

<%@ page import="java.sql.*, java.util.*, beans.MovieBean" %>


<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" />

<%
    String message = "";
    int deletedId = -1;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String selectedId = request.getParameter("movieId"); 
        if (selectedId != null && !selectedId.isEmpty()) {
            deletedId = Integer.parseInt(selectedId); 
            message = movieBean.deleteMovieById(deletedId); // call bean method to delete movie
        }
    }

    // get updated list of all movie records after deletion
    ResultSet rs = movieBean.getAllRecords();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Deleted</title>
    <link rel="stylesheet" href="styles.css" />
    <!-- External CSS for styling -->
</head>
<body>
    <!-- Display deletion confirmation message -->
    <h2><%= message %></h2>

    <h3 class="section-heading">Remaining Movies</h3>
    <!-- Table to show all remaining movie records -->
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
                boolean hasRecords = false;
                // iterate through the sesultset and display movie rows
                while (rs.next()) {
                    hasRecords = true;
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("director") %></td>
                <td><%= rs.getInt("year_released") %></td>
                <td><%= rs.getString("genre") %></td>
                <td><%= rs.getDouble("rating") %></td>
            </tr>
            <% } 

                // close the ResultSet's connection 
                rs.getStatement().getConnection().close();

                // if no records remain show a message
                if (!hasRecords) {
            %>
            <tr><td colspan="6">No movies found.</td></tr>
            <% } %>
        </tbody>
    </table>

    
    <div class="nav-links">
        <a href="delete_select.jsp">Delete Another Movie</a>
        <a href="index.jsp">Back to Index Page</a>
    </div>

    <footer>
        <p>Jose Franco | CSD-430</p>
    </footer>
</body>
</html>
