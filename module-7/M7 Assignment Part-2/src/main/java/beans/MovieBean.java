// Jose Franco
// 06/24/25
// Assignment 7
// Project Part 2

package beans;

import java.sql.*;
import java.util.ArrayList;

public class MovieBean implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    // database connection
    private String dbUrl = "jdbc:mysql://localhost:3306/CSD430";
    private String dbUser = "student1";
    private String dbPass = "pass";

    private Connection connection;
    private Statement statement;

    // constructor initializes connection
    public MovieBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            statement = connection.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // create the movies table  and drops it first if exists
    public String createTable() {
        StringBuilder sb = new StringBuilder();
        try {
            // drop table if exists
            statement.executeUpdate("DROP TABLE IF EXISTS jose_movies_data");
            sb.append("Table jose_movies_data dropped if existed.<br>");

            // create new table
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

    // populate the table with sample movie data
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

    // get all movie IDs as ArrayList<Integer>
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

    // Get a single movie record by ID
    public ResultSet getRecordById(int id) throws Exception {
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM jose_movies_data WHERE id = ?");
        ps.setInt(1, id);
        return ps.executeQuery();
    }

    // Get all movie records
    public ResultSet getAllRecords() throws Exception {
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT * FROM jose_movies_data ORDER BY id");
    }

    // Close connection 
    public void close() {
        try {
            if (statement != null && !statement.isClosed()) statement.close();
            if (connection != null && !connection.isClosed()) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
