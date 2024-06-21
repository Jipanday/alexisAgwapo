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
        <!-- Sidebar code -->
        <!-- Main content code -->
        <div class="main-content">
            <div class="header">
                Welcome to the Admin Dashboard
            </div>
            <div class="content">
                <h2>Workout Records</h2>
                <table border="1" id="userTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User Id</th>
                            <th>Fitness Level/Goal</th>
                            <th>Day</th>
                            <th>Day Finished</th>
                        </tr>
                    </thead>
                    <tbody id="userDataBody">
                        <% 
                            String url = "jdbc:mysql://localhost:3306/client";
                            String dbUsername = "root";
                            String dbPassword = ""; // Set this to your MySQL password
                            
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;

                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                                String sql = "SELECT Id, user_id, `fitness_level/goal`, Day, DayFinished FROM workout_records"; // Properly escape the column name
                                pstmt = conn.prepareStatement(sql);
                                rs = pstmt.executeQuery();

                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("Id") %></td>
                            <td><%= rs.getInt("user_id") %></td>
                            <td><%= rs.getInt("fitness_level/goal") %></td>
                            <td><%= rs.getDate("Day") %></td>
                            <td><%= (rs.getBoolean("DayFinished") ? "Finished" : "Not Finished") %></td> <!-- Convert boolean to string -->
                        </tr>
                        <% 
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                        %>
                        <tr><td colspan='5'>Error fetching workout records</td></tr>
                        <% 
                            } finally {
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