<!--
    Jose Franco
    06/24/25
    Assignment 7
    Project Part 2
-->

<%@ page import="java.sql.*" %> 
<%
 
    String message = "";

    // check if method is POST 
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve form parameters
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        int year = Integer.parseInt(request.getParameter("year"));
        String genre = request.getParameter("genre");
        double rating = Double.parseDouble(request.getParameter("rating"));

        try {
            // load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // establish a connection to the database
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

            // prepare SQL INSERT statement
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO jose_movies_data (title, director, year_released, genre, rating) VALUES (?, ?, ?, ?, ?)");
            
            // bind form input values to the SQL query
            ps.setString(1, title);
            ps.setString(2, director);
            ps.setInt(3, year);
            ps.setString(4, genre);
            ps.setDouble(5, rating);

            // execute the query and check if insert was successful
            int rows = ps.executeUpdate();
            message = (rows > 0) ? "Your movie was added successfully! Have a nice day!" 
                                 : "Failed to add movie. Please, try again.";

            // close resources
            ps.close();
            conn.close();
        } catch (Exception e) {
            // catch and display any exceptions
            message = "Error: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Movie</title>
    <link rel="stylesheet" href="styles.css" /> <!-- Link to external CSS -->
</head>
<body>
    <h2>Add a New Movie</h2>

    <!-- Form to collect movie details from the user -->
    <form method="post" action="add_movie.jsp">
        <div class="form-row">
            <label for="title">Title:</label>
            <input type="text" name="title" required />
        </div>
        <div class="form-row">
            <label for="director">Director:</label>
            <input type="text" name="director" required />
        </div>
        
        
        <div class="form-row">
   			 <label for="year">Year Released:</label>
    		 <select name="year" required>
        		<option value="">Select a year</option>
        		<% for (int i = 2025; i >= 1900; i--) { %>
            		<option value="<%= i %>"><%= i %></option>
        		<% } %>
    		</select>
		</div>
		

        <div class="form-row">
            <label for="genre">Genre:</label>
            <input type="text" name="genre" required />
        </div>
        <div class="form-row">
            <label for="rating">Rating:</label>
            <input type="text" step="0.1" name="rating" required />
        </div>
        <div class="form-row" style="justify-content: flex-end;">
            <input type="submit" value="Add Movie" />
        </div>
    </form>

    <!-- display message if form was submitted -->
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
