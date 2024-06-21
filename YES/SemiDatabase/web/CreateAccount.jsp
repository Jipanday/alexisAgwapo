<%-- 
    Document   : Create Account
    Created on : May 21, 2024, 3:35:28 PM
    Author     : marxa
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GYM BRO</title>
    <style>
        body {
            margin: 0;
            overflow: hidden;
            width: 100% !important;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }
        .backRight {
            position: absolute;
            right: 0;
            width: 50%;
            height: 100%;
            background-image: url('https://media1.tenor.com/m/iie1saLIMNUAAAAC/just-do-it-motivation.gif');
            background-size: 100% 100%;
            background-position: center;
        }
        #back {
            width: 100%;
            height: 100%;
            position: absolute;
            z-index: -999;
        }

        .canvas-back {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 10;
        }

        label {
            font-size: 0.8em;
            text-transform: uppercase;
        }

        input {
            background-color: transparent;
            border: 0;
            outline: 0;
            font-size: 1em;
            padding: 8px 1px;
            margin-top: 0.1em;
        }

        .left {
            width: 50%;
            height: 100%;
            overflow-y: scroll;
            background: black;
            left: 0;
            position: absolute;
        }
        .left label {
            color: #e3e3e3;
        }
        .left input {
            border-bottom: 1px solid #e3e3e3;
            color: #e3e3e3;
        }
        .left input:focus, .left input:active {
            border-color: red;
            color: red;
        }
        .left input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0 30px black inset;
            -webkit-text-fill-color: #e3e3e3;
        }
        .left a {
            color: red;
        }
        .content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            min-height: 100%;
            width: 80%;
            margin: 0 auto;
            position: relative;
        }

        .content h2 {
            font-weight: 300;
            font-size: 2.6em;
            margin: 0.2em 0 0.1em;
        }

        .left .content h2 {
            color: red;
        }
        .form-element {
            margin: 1.6em 0;
        }
        .form-stack {
            display: flex;
            flex-direction: column;
        }

        
       .button-container {
            display: flex;
            align-items: center;
        }

        button {
            padding: 0.8em 1.2em;
            width: auto;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 1em;
            color: #fff;
            line-height: 1em;
            letter-spacing: 0.6px;
            border-radius: 3px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1), 0 3px 6px rgba(0,0,0,0.1);
            border: 0;
            outline: 0;
            transition: all 0.25s;
            margin: 5px;
        }
        button.signup {
            background: red;
        }
        button.login {
            background: red;
        }
        button.signup:hover, button.signup:focus, button.signup:active {
            background: black;
        }
        button.login:hover, button.login:focus, button.login:active {
            background: red;
        }

        @media only screen and (max-width: 768px) {
            #slideBox {
                width: 80%;
                margin-left: 20%;
            }
            .signup-info, .login-info {
                display: none;
            }
        }
    </style>
</head>
<body>
     <div id="back">
        <canvas id="canvas" class="canvas-back"></canvas>
        <div class="backRight"></div>
    </div>
   
    <div class="left">
        <div class="content">
            <h2>Sign Up</h2>
            <form action="CreateAccount.jsp" id="form-signup" method="post" onsubmit="return validateForm();">
                <div class="form-element form-stack">
                    <label for="email" class="form-label">Email</label>
                    <input id="email" type="email" name="email">
                </div>
                <div class="form-element form-stack">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                <div class="form-element form-stack">
                    <label for="middleName" class="form-label">Middle Name</label>
                    <input type="text" id="middleName" name="middleName" required>
                </div>
                <div class="form-element form-stack">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>
                <div class="form-element form-stack">
                    <label for="birthMonth" class="form-label">Date of Birth</label>
                    <div class="birthDate">
                        <br>
                        <select id="birthMonth" name="birthMonth" required>
                            <% for (int month = 1; month <= 12; month++) { %>
                                <option value="<%= month %>"><%= String.format("%02d", month) %></option>
                            <% } %>
                        </select>
                        <select id="birthDay" name="birthDay" required>
                            <% for (int day = 1; day <= 31; day++) { %>
                                <option value="<%= day %>"><%= String.format("%02d", day) %></option>
                            <% } %>
                        </select>
                        <select id="birthYear" name="birthYear" required>
                            <% 
                                int currentYear = Calendar.getInstance().get(Calendar.YEAR);
                                int startYear = 1980;
                                for (int year = currentYear; year >= startYear; year--) {
                            %>
                                <option value="<%= year %>"><%= year %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="form-element form-stack">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-element form-stack">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
               <div class="form-element form-submit button-container">
                   <button id="signUp" class="signup" type="submit" name="signup">Sign up</button> <br>
                    <button id="goLeft" class="login" type="submit" onclick="window.location.href='index.jsp'">Log In</button>
                </div>
            </form>

            <% 
                // Define your database connection details
                String url = "jdbc:mysql://localhost:3306/client";
                String dbUsername = "root";
                String dbPassword = ""; // Set this to your MySQL password

                // Retrieve form data
                String email = request.getParameter("email");
                String firstName = request.getParameter("firstName");
                String middleName = request.getParameter("middleName");
                String lastName = request.getParameter("lastName");
                String birthMonthStr = request.getParameter("birthMonth");
                String birthDayStr = request.getParameter("birthDay");
                String birthYearStr = request.getParameter("birthYear");
                String password2 = request.getParameter("password");

                // Initialize birth month, day, and year with default values
                int birthMonth = (birthMonthStr != null && !birthMonthStr.isEmpty()) ? Integer.parseInt(birthMonthStr) : 0;
                int birthDay = (birthDayStr != null && !birthDayStr.isEmpty()) ? Integer.parseInt(birthDayStr) : 0;
                int birthYear = (birthYearStr != null && !birthYearStr.isEmpty()) ? Integer.parseInt(birthYearStr) : 0;

                if (email != null && !email.isEmpty()) {
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    try {
                        // Register JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Open a connection
                        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                        // Prepare the SQL statement
                        String sql = "INSERT INTO user (email, password, first_name, middle_name, last_name, birth_month, birth_day, birth_year) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, email);
                        pstmt.setString(2, password2);
                        pstmt.setString(3, firstName);
                        pstmt.setString(4, middleName);
                        pstmt.setString(5, lastName);
                        pstmt.setInt(6, birthMonth);
                        pstmt.setInt(7, birthDay);
                        pstmt.setInt(8, birthYear);

                        // Execute the statement
                        pstmt.executeUpdate();

                        // Redirect to a success page
                        response.sendRedirect("home.jsp");
                    } catch (ClassNotFoundException | SQLException e) {
                        // Handle exceptions
                        e.printStackTrace();
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        // Close resources in a finally block
                        try {
                            if (pstmt != null) pstmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            %>
        </div>
    </div>

    <script>
          function validateForm() {
            var email = document.getElementById("email").value;
            var universityDomain = /@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // Modify this regex to match your university's domain
            if (!universityDomain.test(email)) {
                alert("Please enter a valid university email address.");
                return false;
            }

            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }

        // Change the slide every 5 seconds
        setInterval(changeSlide, 5000);

        function changeSlide() {
            // Your slide change logic here
        }
    </script>
</body>
</html>
