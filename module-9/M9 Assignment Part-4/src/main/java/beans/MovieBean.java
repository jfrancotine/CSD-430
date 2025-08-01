// Jose Franco
// 07/12/25
// Assignment 9


package beans;

import java.sql.*;
import java.util.ArrayList;

public class MovieBean implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    // Database configuration
    private String dbUrl = "jdbc:mysql://localhost:3306/CSD430";
    private String dbUser = "student1";
    private String dbPass = "pass";

    private Connection connection;
    private Statement statement;

    // Constructor: Establishes a persistent connection
    public MovieBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            statement = connection.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Create or recreate the movies table
    public String createTable() {
        StringBuilder sb = new StringBuilder();
        try {
            statement.executeUpdate("DROP TABLE IF EXISTS jose_movies_data");
            sb.append("Table jose_movies_data dropped if existed.<br>");

            String createSQL = "CREATE TABLE jose_movies_data (" +
                    "id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, " +
                    "title VARCHAR(255) NOT NULL, " +
                    "director VARCHAR(255) NOT NULL, " +
                    "year_released INT NOT NULL, " +
                    "genre VARCHAR(100) NOT NULL, " +
                    "rating DOUBLE NOT NULL)";
            statement.executeUpdate(createSQL);
            sb.append("Table jose_movies_data created successfully.<br>");
        } catch (SQLException e) {
            sb.append("Error creating table: ").append(e.getMessage()).append("<br>");
        }
        return sb.toString();
    }

    // Populate the table with sample movies
    public String populateTable() {
        StringBuilder sb = new StringBuilder();
        try {
            String insertSQL = "INSERT INTO jose_movies_data (title, director, year_released, genre, rating) VALUES " +
                    "('Inception', 'Christopher Nolan', 2010, 'Sci-Fi', 8.8)," +
                    "('The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 9.2)," +
                    "('Interstellar', 'Christopher Nolan', 2014, 'Sci-Fi', 8.6)," +
                    "('The Matrix', 'The Wachowskis', 1999, 'Sci-Fi', 8.7)," +
                    "('Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 8.9)," +
                    "('The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 9.3)," +
                    "('Gladiator', 'Ridley Scott', 2000, 'Action', 8.5)," +
                    "('Titanic', 'James Cameron', 1997, 'Romance', 7.9)," +
                    "('Avatar', 'James Cameron', 2009, 'Fantasy', 7.8)," +
                    "('The Dark Knight', 'Christopher Nolan', 2008, 'Action', 9.0)";
            int rows = statement.executeUpdate(insertSQL);
            sb.append("Inserted ").append(rows).append(" sample movies.<br>");
        } catch (SQLException e) {
            sb.append("Error populating table: ").append(e.getMessage()).append("<br>");
        }
        return sb.toString();
    }

    // Get all movie IDs for dropdowns
    public ArrayList<Integer> getAllIds() throws Exception {
        ArrayList<Integer> ids = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT id FROM jose_movies_data ORDER BY id")) {
            while (rs.next()) {
                ids.add(rs.getInt("id"));
            }
        }
        return ids;
    }

    // Get a single movie by ID
    public ResultSet getRecordById(int id) throws Exception {
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM jose_movies_data WHERE id = ?");
        ps.setInt(1, id);
        return ps.executeQuery();
    }

    // Get all movies
    public ResultSet getAllRecords() throws Exception {
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT * FROM jose_movies_data ORDER BY id");
    }

    // JavaBean to adding a movie
    public String addMovie(String title, String director, int year, String genre, double rating) {
        String message = "";
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO jose_movies_data (title, director, year_released, genre, rating) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, title);
            ps.setString(2, director);
            ps.setInt(3, year);
            ps.setString(4, genre);
            ps.setDouble(5, rating);

            int rows = ps.executeUpdate();
            message = (rows > 0) ? "Your movie was added successfully! Have a nice day!"
                                 : "Failed to add movie. Please, try again.";
            ps.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
        return message;
    }
    
    
    // JavaBean to updating a movie
    public String updateMovie(int id, String title, String director, int year, String genre, double rating) {
        String message = "";
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE jose_movies_data SET title=?, director=?, year_released=?, genre=?, rating=? WHERE id=?");
            ps.setString(1, title);
            ps.setString(2, director);
            ps.setInt(3, year);
            ps.setString(4, genre);
            ps.setDouble(5, rating);
            ps.setInt(6, id);

            int rows = ps.executeUpdate();
            message = (rows > 0) ? "Movie updated successfully!" : "No changes were made.";
            ps.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
        return message;
    }
   
    //JavaBean to delete a movie by ID
    public String deleteMovieById(int id) {
        String message = "";
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM jose_movies_data WHERE id = ?");
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            message = (rows > 0) ? "Movie deleted successfully." : "No movie found with that ID.";
            ps.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
        return message;
    }


    // Close open resources
    public void close() {
        try {
            if (statement != null && !statement.isClosed()) statement.close();
            if (connection != null && !connection.isClosed()) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
