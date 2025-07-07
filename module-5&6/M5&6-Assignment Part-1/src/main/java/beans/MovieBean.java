// Jose Franco
// 06/17/25
// Assignment 5 and 6
// Project Part 1

package beans;

import java.sql.*;
import java.util.ArrayList;

public class MovieBean implements java.io.Serializable {

    private static final long serialVersionUID = 1L; // required for serializable

    // database connection details
    private String dbUrl = "jdbc:mysql://localhost:3306/CSD430";
    private String dbUser = "student1";
    private String dbPass = "pass";

    // retrieves all movie IDs from the table
    public ArrayList<Integer> getAllIds() throws Exception {
        ArrayList<Integer> ids = new ArrayList<>();
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id FROM jose_movies_data");
        while (rs.next()) {
            ids.add(rs.getInt("id"));
        }
        rs.close();
        stmt.close();
        conn.close();
        return ids;
    }

    // retrieves one movie record by ID
    public ResultSet getRecordById(int id) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM jose_movies_data WHERE id = ?");
        ps.setInt(1, id);
        return ps.executeQuery();
    }

    // retrieves all movie records
    public ResultSet getAllRecords() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT * FROM jose_movies_data");
    }
}
