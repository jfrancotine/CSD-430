<!-- Jose Franco -->
<!-- 06/24/25 -->
<!-- Assignment 7 -->
<!-- Project Part 2 -->

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Movies</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <h2>Displaying All Movies in the Database</h2>
	
    <table border="1">
        <thead>
            <tr>
                <th>ID</th><th>Title</th><th>Director</th>
                <th>Year Released</th><th>Genre</th><th>Rating</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM jose_movies_data");

                while (rs.next()) {
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

                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
        %>
            <tr><td colspan="6">Error loading movies: <%= e.getMessage() %></td></tr>
        <%
            }
        %>
        </tbody>
    </table>

   <div class="nav-links">
    <a href="add_movie.jsp">Add Another Movie</a>
    <a href="index.jsp">Back to Index Page</a>
   </div>
   <footer>
        <p>Jose Franco | CSD-430</p>
   </footer>
    
</body>
</html>
