<!-- 
    Jose Franco
    06/10/2025
    Module 4 Assignment
    Creating a dynamic Web page using JavaBeans.
-->

<%@ page import="beans.CountryBean" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Favorite Visited Countries</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

    <h1>My Favorite Visited Countries and Their Highlights</h1>
    <p>
        This table displays detailed information about five countries I’ve visited, 
        including cultural highlights, locations, estimated population (in millions), 
        and the primary languages spoken.
    </p>

    <%
        // Create an array of CountryBean objects
        CountryBean[] countries = {
            new CountryBean("France", "Paris", "Eiffel Tower and Louvre Museum", 67000000L, "French"),
            new CountryBean("Italy", "Venice", "Grand Canal and Gondolas", 60000000L, "Italian"),
            new CountryBean("Venezuela", "Canaima", "Angel Falls, world's tallest waterfall", 28000000L, "Spanish"),
            new CountryBean("Peru", "Cusco", "Gateway to Machu Picchu and Incan heritage", 33000000L, "Spanish"),
            new CountryBean("United States", "New York City", "Statue of Liberty and Times Square", 331000000L, "English")
        };
    %>

    <table>
        <thead>
            <tr>
                <th>Country</th>
                <th>Location</th>
                <th>Highlight</th>
                <th>Population (Millions)</th>
                <th>Primary Language</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (CountryBean c : countries) {
            %>
                <tr>
                    <td><%= c.getCountry() %></td>
                    <td><%= c.getLocation() %></td>
                    <td><%= c.getHighlight() %></td>
                    <td><%= String.format("%.1f M", c.getPopulation() / 1_000_000.0) %></td>
                    <td><%= c.getLanguage() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <footer>
        <p>Jose Franco | CSD-430 Module 4 Assignment</p>
    </footer>

</body>
</html>
