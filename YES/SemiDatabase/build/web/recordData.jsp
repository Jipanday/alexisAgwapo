<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("email") == null) {
        response.sendRedirect("index.jsp");
    } else {
        String email = (String) session.getAttribute("email");
        String gender = request.getParameter("gender");
        String level = request.getParameter("level");
        String goal = request.getParameter("goal");
        String redirectUrl = request.getParameter("redirectUrl");

        if (gender != null && level != null && goal != null) {
            String url = "jdbc:mysql://localhost:3306/client";
            String dbUsername = "root";
            String dbPassword = ""; // Your MySQL password

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                // Fetch the user id based on email
                String fetchUserIdSql = "SELECT id FROM user WHERE email = ?";
                pstmt = conn.prepareStatement(fetchUserIdSql);
                pstmt.setString(1, email);
                rs = pstmt.executeQuery();

                int userId = -1;
                if (rs.next()) {
                    userId = rs.getInt("id");
                }

                // Close the previous statement
                pstmt.close();

                if (userId != -1) {
                    // Prepare the SQL statement to insert the fitness data
                    String insertFitnessDataSql = "INSERT INTO filter_connections (user_id, gender, fitness_level, fitness_goal, selection_time) VALUES (?, ?, ?, ?, ?)";
                    pstmt = conn.prepareStatement(insertFitnessDataSql);
                    pstmt.setInt(1, userId);
                    pstmt.setString(2, gender);
                    pstmt.setString(3, level);
                    pstmt.setString(4, goal);

                    // Set the selection_time to the current timestamp
                    java.sql.Timestamp selectionTime = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
                    pstmt.setTimestamp(5, selectionTime);

                    // Execute the statement
                    pstmt.executeUpdate();

                    // Redirect to success page or wherever you want
                    response.sendRedirect(redirectUrl);
                } else {
                    out.println("<p>Error: User not found.</p>");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } else {
            out.println("<p>Invalid data submitted.</p>");
        }
    }
%>
