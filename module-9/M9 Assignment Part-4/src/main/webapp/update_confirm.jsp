<!--
    Jose Franco
    07/06/25
    Assignment 8
    Project Part 3
-->

<%@ page import="java.sql.*, beans.MovieBean" %> 
<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" /> 

<%
    // get updated movie information from the form submission
    int id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("title");
    String director = request.getParameter("director");
    int year = Integer.parseInt(request.getParameter("year"));
    String genre = request.getParameter("genre");
    double rating = Double.parseDouble(request.getParameter("rating"));

    // call method in JavaBean to update movie record in the database
    String message = movieBean.updateMovie(id, title, director, year, genre, rating);

    // retrieve the updated record to display it
    ResultSet rs = movieBean.getRecordById(id);
    rs.next(); // Move cursor to the first record
%>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Updated</title>
    <link rel="stylesheet" href="styles.css" /> <!-- External CSS for styling -->
</head>
<body>
    <!-- Display message returned from update operation -->
    <h2><%= message %></h2>

    <!-- Display the updated movie record in a table -->
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
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("director") %></td>
                <td><%= rs.getInt("year_released") %></td>
                <td><%= rs.getString("genre") %></td>
                <td><%= rs.getDouble("rating") %></td>
            </tr>
        </tbody>
    </table>

    <!-- Navigation links -->
    <div class="nav-links">
        <a href="index.jsp">Back to Index Page</a>
        <a href="update_select.jsp">Update Another Movie</a>
    </div>
    <footer>
        <p>Jose Franco | CSD-430</p>
    </footer>
</body>
</html>
