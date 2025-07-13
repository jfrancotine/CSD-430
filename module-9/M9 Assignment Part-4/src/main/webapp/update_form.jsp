<!--
    Jose Franco
    07/06/25
    Assignment 8
    Project Part 3
-->

<%@ page import="java.sql.*, beans.MovieBean" %> 
<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" /> 

<%
    // get the movie ID from the request parameter
    int movieId = Integer.parseInt(request.getParameter("movieId"));

    // fetch the movie record using the MovieBean method
    ResultSet rs = movieBean.getRecordById(movieId);
    rs.next(); // Move to the first record
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Movie</title>
    <link rel="stylesheet" href="styles.css" /> 
</head>
<body>
    <h2>Update Movie Record</h2>

    <!-- Form for updating movie details -->
    <form method="post" action="update_confirm.jsp">
        
        <!-- Display Movie ID and send hidden input for form submission -->
        <div class="form-row">
            <label>ID:</label>
            <input type="text" value="<%= rs.getInt("id") %>" readonly />
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>" />
        </div>

        <!-- Editable Title -->
        <div class="form-row">
            <label>Title:</label>
            <input type="text" name="title" value="<%= rs.getString("title") %>" required />
        </div>

        <!-- Editable Director -->
        <div class="form-row">
            <label>Director:</label>
            <input type="text" name="director" value="<%= rs.getString("director") %>" required />
        </div>

        <!-- Editable Year -->
        <div class="form-row">
            <label>Year:</label>
            <input type="number" name="year" value="<%= rs.getInt("year_released") %>" required />
        </div>

        <!-- Editable Genre -->
        <div class="form-row">
            <label>Genre:</label>
            <input type="text" name="genre" value="<%= rs.getString("genre") %>" required />
        </div>

        <!-- Editable Rating -->
        <div class="form-row">
            <label>Rating:</label>
            <input type="number" step="0.1" name="rating" value="<%= rs.getDouble("rating") %>" required />
        </div>

        <!-- Submit button -->
        <div class="form-row" style="justify-content: flex-end;">
            <input type="submit" value="Update Movie" />
        </div>
    </form>

    <!-- Navigation link back to home page -->
    <div class="nav-links">
        <a href="index.jsp">Back to Index Page</a>
    </div>
    <footer>
        <p>Jose Franco | CSD-430</p>
    </footer>
</body>
</html>
