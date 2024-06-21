<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update User Information</title>
</head>
<body>
<%
    // Retrieve form data
    int userID = Integer.parseInt(request.getParameter("userID"));
    String firstName = request.getParameter("firstName");
    String middleName = request.getParameter("middleName");
    String lastName = request.getParameter("lastName");
    String birthMonth = request.getParameter("birthMonth");
    int birthDay = Integer.parseInt(request.getParameter("birthDay"));
    int birthYear = Integer.parseInt(request.getParameter("birthYear"));
    String password = request.getParameter("password");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/client";
    String dbUsername = "root";
    String dbPassword = ""; // Set this to your MySQL password

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Register JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Open a connection
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // SQL query to update user information
        String sql = "UPDATE user SET first_name=?, middle_name=?, last_name=?, birth_month=?, birth_day=?, birth_year=?, password=? WHERE ID=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, firstName);
        pstmt.setString(2, middleName);
        pstmt.setString(3, lastName);
        pstmt.setString(4, birthMonth);
        pstmt.setInt(5, birthDay);
        pstmt.setInt(6, birthYear);
        pstmt.setString(7, password);
        pstmt.setInt(8, userID);
        
        int rowsAffected = pstmt.executeUpdate();

        // Check if update was successful
        if (rowsAffected > 0) {
            // Redirect to settings page after successful update
            response.sendRedirect("settings.jsp");
        } else {
            out.println("<p>Failed to update user information.</p>");
        }
    } catch (ClassNotFoundException | SQLException e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        // Close resources
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            out.println("<p>Error closing resources: " + ex.getMessage() + "</p>");
        }
    }
%>
</body>
</html>
