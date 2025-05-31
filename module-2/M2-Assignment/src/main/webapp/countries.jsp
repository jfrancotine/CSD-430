<!-- 
    Jose Franco
    05/30/2025
    Module 2 Assignment
    Creating a dynamic Web page using JSP and HTML with CSS styling.
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Favorite Visited Countries</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

    <h1>My Favorite Visited Countries and Their Highlights</h1>
    <p>This page displays cultural and historic highlights from five countries I’ve enjoyed visiting.</p>

    <%
        // Scriptlet for holding data
        class Place {
            String country;
            String location;
            String highlight;

            public Place(String country, String location, String highlight) {
                this.country = country;
                this.location = location;
                this.highlight = highlight;
            }
        }

    	// Scriptlet to create an array of place records
        Place[] places = {
            new Place("France", "Paris", "The Eiffel Tower and Louvre Museum"),
            new Place("Italy", "Venice", "Grand Canal and Gondolas"),
            new Place("Venezuela", "Canaima", "Angel Falls, world’s tallest waterfall"),
            new Place("Peru", "Cusco", "Gateway to Machu Picchu and Incan heritage"),
            new Place("United States", "New York City", "Statue of Liberty and Times Square")
        };
    %>
    
<!-- Table to display the data in a structured format -->
    <table>
        <thead>
            <tr>
                <th>Country</th>
                <th>Location</th>
                <th>Highlight</th>
            </tr>
        </thead>
        <tbody>
            <%
         		// Scriptlet to loop through the array and generate rows for each record
                for (Place p : places) {
            %>
                <tr>
                    <td><%= p.country %></td>
                    <td><%= p.location %></td>
                    <td><%= p.highlight %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <footer>
        <p>Jose Franco | CSD-430 Module 2 Assignment</p>
    </footer>

</body>
</html>
