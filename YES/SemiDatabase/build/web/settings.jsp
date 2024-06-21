<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Information</title>
    <style>
        body {
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        .container {
            text-align: center;
            padding: 20px;
        }
        
        h1 {
            border-bottom: 2px solid red;
        }
        
        .form-container {
            display: inline-block;
            background-color: black;
            padding: 20px;
            border: 2px solid red;
            border-radius: 10px;
            text-align: left;
        }
        
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 22px);
            padding: 5px;
            margin: 5px 0;
            border-radius: 5px;
            border: 1px solid red;
        }
        
        input[type="submit"] {
            width: 100%;
            padding: 10px 20px;
            margin-top: 10px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: darkred;
        }
        
        .return-button {
            position: fixed;
            top: 10px;
            right: 10px;
            width: 50px;
            height: 50px;
            background-image: url('/SemiDatabase/arrow.png'); /* replace with the path to your image */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            cursor: pointer;
        }
        
        .logout-button {
            display: block;
            width: calc(100% - 41px);
            text-align: center;
            padding: 10px 20px;
            margin-top: 10px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        
        .logout-button:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <div class="return-button" onclick="window.location.href='home.jsp';">
        <img src="/SemiDatabase/img/arrow.svg" alt="arrow"/>
    </div>
<%
    // Retrieve the user's email from the session
    session = request.getSession(false);
    String userEmail = null;
    if (session != null) {
        userEmail = (String) session.getAttribute("email");
    }

    // Check if the user is logged in
    if (userEmail != null) {
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/client";
        String dbUsername = "root";
        String dbPassword = ""; // Set this to your MySQL password

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // SQL query to retrieve user information
            String sql = "SELECT ID, first_name, middle_name, last_name, birth_month, birth_day, birth_year, email, password FROM user WHERE email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userEmail);
            rs = pstmt.executeQuery();

            // Display user information
            if (rs.next()) {
%>
              <div class="container">
    <h1>User Information</h1>
<div class="form-container">
    <form action="updateUserInfo.jsp" method="post">
        <!-- User information fields -->
        <input type="hidden" name="userID" value="<%= rs.getInt("ID") %>">
        First Name: <input type="text" name="firstName" value="<%= rs.getString("first_name") %>"><br>
        Middle Name: <input type="text" name="middleName" value="<%= rs.getString("middle_name") %>"><br>
        Last Name: <input type="text" name="lastName" value="<%= rs.getString("last_name") %>"><br>
        Birth Month: <input type="text" name="birthMonth" value="<%= rs.getString("birth_month") %>"><br>
        Birth Day: <input type="text" name="birthDay" value="<%= rs.getInt("birth_day") %>"><br>
        Birth Year: <input type="text" name="birthYear" value="<%= rs.getInt("birth_year") %>"><br>
        Email: <%= rs.getString("email") %> <br>
        Password: <input type="password" name="password" value="<%= rs.getString("password") %>"><br>
        <input type="submit" value="Update">
    </form>
    
    <!-- Log Out button -->
    <a href="logout.jsp" class="logout-button">Log Out</a>
</div>
</div>
        
<%
            } else {
                out.println("<p>User information not found.</p>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                out.println("<p>Error closing resources: " + ex.getMessage() + "</p>");
            }
        }
    } else {
        out.println("<p>User not logged in.</p>");
    }
%>
<script>
    function confirmUpdate() {
        return confirm("Do you want to save changes?");
    }
</script>
</body>
</html>
