<%-- 
    Document   : login
    Created on : May 21, 2024, 1:51:52 PM
    Author     : marxa
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>GYM BRO</title>
    <style>
        body {
            margin: 0;
            overflow: hidden;
            width: 100% !important;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }
        .backLeft {
            position: absolute;
            left: 0;
            width: 50%;
            height: 100%;
            background-image: url('https://media1.tenor.com/m/epNMHGvRyHcAAAAd/gigachad-chad.gif');
            background-size: cover;
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
        #slideBox {
            width: 50%;
            max-height: 100%;
            height: 100%;
            overflow: hidden;
            margin-left: 50%;
            position: absolute;
            box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
        }
        .topLayer {
            width: 200%;
            height: 100%;
            position: relative;
            left: 0;
            left: -100%;
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
        .right {
            width: 50%;
            height: 100%;
            overflow: scroll;
            background:  white;
            right: 0;
            position: absolute;
            label {
                color: #212121;
            }
            input {
                border-bottom: 1px solid #212121;
                &:focus, &:active {
                    border-color: black;
                }
                &:-webkit-autofill {
                    -webkit-box-shadow: 0 0 0 30px white inset;
                    -webkit-text-fill-color: #212121;
                }
            }
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
        .right .content h2 {
            color: black;
        }
        .form-element {
            margin: 1.6em 0;
            &.form-submit {
                margin: 1.6em 0 0;
            }
        }
        .form-stack {
            display: flex;
            flex-direction: column;
        }
        button {
            padding: 0.8em 1.2em;
            margin: 0 10px 0 0;
            width: auto;
            font-weight: 600;
            text-transform:  uppercase;
            font-size: 1em;
            color: #fff;
            line-height: 1em;
            letter-spacing: 0.6px;
            border-radius: 3px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1), 0 3px 6px rgba(0,0,0,0.1);
            border: 0;
            outline: 0;
            transition: all 0.25s;
            &.signup {
                background: red;
            }
            &.login {
                background: black;
            }
            &.off {
                background: none;
                box-shadow: none;
                margin: 0;
                &.signup {
                    color: red;
                }
                &.login {
                    color: black;
                }
            }
        }
        button:focus, button:active, button:hover {
            box-shadow: 0 4px 7px rgba(0,0,0,0.1), 0 3px 6px rgba(0,0,0,0.1);
            &.signup {
                background:black;
            }
            &.login {
                background: red;
            }
            &.off {
                box-shadow: none;
                &.signup {
                    color: red;
                    background: #212121;
                }
                &.login {
                    color: red;
                    background: #e3e3e3;
                }
            }
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
        <div class="backLeft"></div>
    </div>
    <div id="slideBox">
        <div class="topLayer">
            <div class="right">
                <div class="content">
                    <h2>Login</h2>
                    <form action="index.jsp" id="form-login" method="post">
                        <div class="form-element form-stack">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-element form-stack">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <div class="form-element form-submit">
                            <button id="logIn" class="login" type="submit" name="login">Log In</button>
                            <button id="goRight" class="login off" name="signup" onclick="window.location.href='CreateAccount.jsp'">Sign Up</button>
                        </div>
                    </form>
                   <%@ page import="java.io.*" %>
                    <%
                        // Retrieve form data
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");

                        if (email != null && !email.isEmpty() && password != null && !password.isEmpty()) {
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

                                // Check if email exists and retrieve the stored password
                                String checkUserSQL = "SELECT * FROM user WHERE email = ? AND password = ?";
                                pstmt = conn.prepareStatement(checkUserSQL);
                                pstmt.setString(1, email);
                                pstmt.setString(2, password);
                                rs = pstmt.executeQuery();

                                if (rs.next()) {
                                    // User authenticated, set session attribute
                                    session = request.getSession();
                                    session.setAttribute("email", email);
                                    response.sendRedirect("home.jsp");
                                } else {
                                    // Authentication failed, show error message
                                    out.println("<p>Incorrect email or password. Please try again.</p>");
                                }
                            } catch (ClassNotFoundException | SQLException e) {
                                // Handle exceptions
                                e.printStackTrace();
                                out.println("<p>Error: " + e.getMessage() + "</p>");
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
                        } else {
                            // Email or password not provided, show error message
                            out.println("<p>Email and password are required.</p>");
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $('#goRight').on('click', function(){
                $('#slideBox').animate({
                    'marginLeft' : '0'
                });
                $('.topLayer').animate({
                    'marginLeft' : '100%'
                });
            });
            $('#goLeft').on('click', function(){
                if (window.innerWidth > 769){
                    $('#slideBox').animate({
                        'marginLeft' : '50%'
                    });
                } else {
                    $('#slideBox').animate({
                        'marginLeft' : '20%'
                    });
                }
                $('.topLayer').animate({
                    'marginLeft': '0'
                });
            });
        });
    </script>
</body>
</html>
