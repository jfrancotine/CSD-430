<!--
    Jose Franco
    06/24/25
    Assignment 7
    Project Part 2
-->
<%@ page import="beans.MovieBean" %> 
<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" /> 

<%
    String message = "";

    // handle form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String action = request.getParameter("action");

        // add movie action
        if ("add".equals(action)) {
            // retrieve form data
            String title = request.getParameter("title");
            String director = request.getParameter("director");
            int year = Integer.parseInt(request.getParameter("year"));
            String genre = request.getParameter("genre");
            double rating = Double.parseDouble(request.getParameter("rating"));

            // call JavaBean method to add movie to database
            message = movieBean.addMovie(title, director, year, genre, rating);

        } else if ("populate".equals(action)) {
            // populate database with predefined movie records
            message = movieBean.populateTable();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Movie</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <h2>Add a New Movie</h2>

    <!-- Form for adding a new movie -->
    <form method="post" action="add_movie.jsp">
        <input type="hidden" name="action" value="add" />

        <!-- Title field -->
        <div class="form-row">
            <label for="title">Title:</label>
            <input type="text" name="title" required />
        </div>

        <!-- Director field -->
        <div class="form-row">
            <label for="director">Director:</label>
            <input type="text" name="director" required />
        </div>

        <!-- Year dropdown -->
        <div class="form-row">
            <label for="year">Year Released:</label>
            <select name="year" required>
                <option value="">Select a year</option>
                <% for (int i = 2025; i >= 1900; i--) { %> <!-- loop to generate years -->
                    <option value="<%= i %>"><%= i %></option>
                <% } %>
            </select>
        </div>

        <!-- Genre field -->
        <div class="form-row">
            <label for="genre">Genre:</label>
            <input type="text" name="genre" required />
        </div>

        <!-- Rating field -->
        <div class="form-row">
            <label for="rating">Rating:</label>
            <input type="text" step="0.1" name="rating" required />
        </div>

        <!-- Submit button -->
        <div class="form-row" style="justify-content: flex-end;">
            <input type="submit" value="Add Movie" />
        </div>
    </form>

    <!-- Display success or error message after form submission -->
    <% if (!message.isEmpty()) { %>
        <p class="message"><%= message %></p>
    <% } %>

    <!-- Navigation links -->
    <div class="nav-links">
        <a href="list_updatedmovies.jsp">View All Movies</a>
        <a href="index.jsp">Back to Index Page</a>
    </div>

    <footer>
        <p>Jose Franco | CSD-430</p>
    </footer>
</body>
</html>

