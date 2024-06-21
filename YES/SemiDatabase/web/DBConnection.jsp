<%@ page import="java.sql.*" %>

<%
    // Database connection details
    String dbUrl = "jdbc:mysql://localhost:3306/client";
    String dbUsername = "root";
    String dbPassword = "";

    Connection conn = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Return the connection object
    out.print(conn);
%>
