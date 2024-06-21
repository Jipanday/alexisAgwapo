<%-- 
    Document   : admin
    Created on : Jun 5, 2024, 1:01:03 PM
    Author     : marxa
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css">
   <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #333;
            color: #fff;
            padding-top: 20px;
        }

        .header, .menu-item {
            padding: 10px 20px;
        }

        .header {
            font-size: 24px;
            font-weight: bold;
            border-bottom: 2px solid #fff;
        }

        .menu-item {
            border-bottom: 1px solid #555;
        }

        .menu-item a {
            color: #fff;
            text-decoration: none;
            display: block;
            padding: 10px 0;
        }

        .menu-item a:hover {
            background-color: #555;
        }

        .main-content {
            flex: 1;
            padding: 20px;
        }

        .header {
            font-size: 28px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="header">
                Admin Dashboard
            </div>
            <div class="menu">
                <div class="menu-item">
                    <a href="#">Users Dashboard</a>
                </div>
                <div class="menu-item">
                    <a href="progress.jsp">Workout Progress</a>
                </div>
                <div class="menu-item">
                    <a href="WorkRecord.jsp">Workout Records</a>
                </div>
                <div class="menu-item">
                    <a href="delete.jsp">Delete</a>
                </div>
            </div>
        </div>
        <div class="main-content">
            <div class="header">
                Welcome to the Admin Dashboard
            </div>
            <div class="content">
                <h2>User Information</h2>
                <table border="1" id="userTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>First Name</th>
                            <th>Middle Name</th>
                            <th>Last Name</th>
                            <th>Birth Month</th>
                            <th>Birth Day</th>
                            <th>Birth Year</th>
                            <th>Email</th>
                            <th>Password</th>
                            
                        </tr>
                    </thead>
                    <tbody id="userDataBody">
                       <% 
                            // Define your database connection details
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

                                // Execute select query to retrieve user data
                                String sql = "SELECT ID, first_name, middle_name, last_name, birth_month, birth_day, birth_year, email, password FROM user";
                                pstmt = conn.prepareStatement(sql);
                                rs = pstmt.executeQuery();

                                // Process the result set and populate the table
                                while (rs.next()) {
                                    out.println("<tr>");
                                    out.println("<td>" + rs.getInt("id") + "</td>");
                                    out.println("<td>" + rs.getString("first_name") + "</td>");
                                    out.println("<td>" + rs.getString("middle_name") + "</td>");
                                    out.println("<td>" + rs.getString("last_name") + "</td>");
                                    out.println("<td>" + rs.getString("birth_month") + "</td>");
                                    out.println("<td>" + rs.getInt("birth_day") + "</td>");
                                    out.println("<td>" + rs.getInt("birth_year") + "</td>");
                                    out.println("<td>" + rs.getString("email") + "</td>");
                                    out.println("<td>" + rs.getString("password") + "</td>");
                                    
                                    out.println("</tr>");
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                                out.println("<tr><td colspan='4'>Error fetching user data</td></tr>");
                            } finally {
                                // Close resources in a finally block
                                try {
                                    if (rs != null) rs.close();
                                    if (pstmt != null) pstmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException ex) {
                                    ex.printStackTrace();
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="footer">
                &copy; 2024 Admin Dashboard
            </div>
        </div>
    </div>

</body>
</html>

