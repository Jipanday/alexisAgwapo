<%@ page import="java.sql.*" %>
<%
    // Check if the session exists and if the user is logged in
    session = request.getSession(false);
    if (session == null || session.getAttribute("email") == null) {
        // Redirect to login page if not logged in
        response.sendRedirect("index.jsp");
    } else {
        // User is logged in, get user email
        String email = (String) session.getAttribute("email");
        
        // Define database connection variables
        String url = "jdbc:mysql://localhost:3306/client";
        String dbUsername = "root";
        String dbPassword = ""; // Set this to your MySQL password

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // Variables to manage the current day and completion status
        int currentDay = 1;
        boolean[] completionStatus = new boolean[15];
        boolean startDay = false;

        // Handle form submissions
        if (request.getParameter("startDay") != null) {
            startDay = true;
            currentDay = Integer.parseInt(request.getParameter("currentDay"));
        }

        if (request.getParameter("finishDay") != null) {
            currentDay = Integer.parseInt(request.getParameter("currentDay"));
            completionStatus[currentDay - 1] = true;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                // Update completion status in the database
                String updateStatusSQL = "UPDATE workout_status SET status = ? WHERE email = ? AND day = ?";
                pstmt = conn.prepareStatement(updateStatusSQL);
                pstmt.setBoolean(1, true);
                pstmt.setString(2, email);
                pstmt.setInt(3, currentDay);
                pstmt.executeUpdate();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }

        if (request.getParameter("reset") != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                // Reset completion status in the database
                String resetStatusSQL = "UPDATE workout_status SET status = ? WHERE email = ?";
                pstmt = conn.prepareStatement(resetStatusSQL);
                pstmt.setBoolean(1, false);
                pstmt.setString(2, email);
                pstmt.executeUpdate();

                // Reset local completion status
                for (int i = 0; i < 15; i++) {
                    completionStatus[i] = false;
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }

        if (request.getParameter("cancel") != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                // Remove the user's workout plan from the database
                String cancelPlanSQL = "DELETE FROM workout_status WHERE email = ?";
                pstmt = conn.prepareStatement(cancelPlanSQL);
                pstmt.setString(1, email);
                pstmt.executeUpdate();
                
                // Reset local completion status
                for (int i = 0; i < 15; i++) {
                    completionStatus[i] = false;
                }

                // Redirect to another page after cancelling the plan
                response.sendRedirect("some_other_page.jsp");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }

        // Retrieve the completion status from the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            String getStatusSQL = "SELECT * FROM workout_status WHERE email = ?";
            pstmt = conn.prepareStatement(getStatusSQL);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int day = rs.getInt("day");
                boolean status = rs.getBoolean("status");
                completionStatus[day - 1] = status;
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
%>
<!DOCTYPE html>
<html>
<head>
    <title>15-Day Beginner Weight Loss Workout</title>
    <link rel="stylesheet" href="perday.css">
</head>
<body>
    <div class="return-button" onclick="window.location.href='Work.jsp';">
        <img src="/SemiDatabase/img/arrow.png" alt="arrow"/>
    </div>
    <h1>15-Day Beginner Weight Loss Workout Plan</h1>

    <form action="" method="get">
        <label for="daySelect">Select Day (1-15):</label>
        <input type="number" id="daySelect" name="currentDay" min="1" max="15" value="<%= currentDay %>">
        <button type="submit" name="startDay" value="true">Start</button>
        <% if (completionStatus[currentDay - 1]) { %>
            <span class="completed-mark">?</span>
        <% } %>
    </form>

    <form action="" method="get">
        <button type="submit" name="reset" value="true">Reset Plan</button>
    </form>

    <form action="" method="get">
        <button type="submit" name="cancel" value="true">Cancel Plan</button>
    </form>

    <hr>

    <% if (startDay) { %>
        <%-- Workout for the selected day --%>

        <div class="slideshow-container">
            <div class="exercise active">
                <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Basic Exercises" : currentDay <= 10 ? "Increase Intensity" : "Circuit Training" %></h2>
                <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
                    <% if (currentDay <= 5) { %>
                        <h3>Exercise 1: Jumping Jacks</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
                        <p><strong>Instructions:</strong> Stand upright with your legs together, arms at your sides. Bend your knees slightly and jump into the air. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head. Jump back to the starting position. Repeat.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 1: High Knees</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong> Stand in place and run, bringing your knees as high as possible with each step. Move at a fast pace.</p>
                    <% } else { %>
                        <h3>Exercise 1: Jumping Jacks</h3>
                        <p><strong>Time/Reps:</strong> 30 seconds</p>
                        <p><strong>Instructions:</strong> Perform Jumping Jacks for 30 seconds.</p>
                    <% } %>
                    <div>
                        <button type="button" onclick="nextExercise()">Next</button>
                    </div>
                <% } else { %>
                    <p>Exercise information not available.</p>
                <% } %>
            </div>
            <div class="exercise">
                <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Basic Exercises" : currentDay <= 10 ? "Increase Intensity" : "Circuit Training" %></h2>
                <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
                    <% if (currentDay <= 5) { %>
                        <h3>Exercise 2: Bodyweight Squats</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 12 reps</p>
                        <p><strong>Instructions:</strong> Stand with your feet shoulder-width apart. Lower your body into a squat position by bending your knees and pushing your hips back. Keep your chest up and your back straight. Rise back to the starting position. Repeat.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 2: Jump Squats</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 12 reps</p>
                        <p><strong>Instructions:</strong> Perform a squat, then jump up explosively. As you land, lower your body back into the squat position. Repeat.</p>
                    <% } else { %>
                        <h3>Exercise 2: Bodyweight Squats</h3>
                        <p><strong>Time/Reps:</strong> 15 reps</p>
                        <p><strong>Instructions:</strong> Perform Bodyweight Squats for 15 reps.</p>
                    <% } %>
                    <div>
                        <button type="button" onclick="previousExercise()">Previous</button>
                        <button type="button" onclick="nextExercise()">Next</button>
                    </div>
                <% } else { %>
                    <p>Exercise information not available.</p>
                <% } %>
            </div>
            <div class="exercise">
                <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Basic Exercises" : currentDay <= 10 ? "Increase Intensity" : "Circuit Training" %></h2>
                <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
                    <% if (currentDay <= 5) { %>
                        <h3>Exercise 3: Push-ups</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
                        <p><strong>Instructions:</strong> Place your hands on the floor, slightly wider than shoulder-width apart. Extend your legs back so you are balanced on your hands and toes. Lower your body until your chest nearly touches the floor. Push yourself back up to the starting position. Repeat.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 3: Tricep Dips</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
                        <p><strong>Instructions:</strong> Sit on the edge of a chair or bench with your hands next to your hips. Slide your butt off the edge and lower your body by bending your elbows. Push back up to the starting position. Repeat.</p>
                    <% } else { %>
                        <h3>Exercise 3: Push-ups</h3>
                        <p><strong>Time/Reps:</strong> 10 reps</p>
                        <p><strong>Instructions:</strong> Perform Push-ups for 10 reps.</p>
                    <% } %>
                    <div>
                        <button type="button" onclick="previousExercise()">Previous</button>
                        <button type="button" onclick="nextExercise()">Next</button>
                    </div>
                <% } else { %>
                    <p>Exercise information not available.</p>
                <% } %>
            </div>
            <div class="exercise">
                <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Basic Exercises" : currentDay <= 10 ? "Increase Intensity" : "Circuit Training" %></h2>
                <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
                    <% if (currentDay <= 5) { %>
                        <h3>Exercise 4: Plank</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 20 seconds</p>
                        <p><strong>Instructions:</strong> Lie face down with your forearms on the floor and your elbows directly below your shoulders. Lift your body up into a plank position, keeping your body in a straight line from your head to your heels. Hold this position for 20 seconds. Repeat.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 4: Mountain Climbers</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong> Start in a plank position with your hands directly under your shoulders. Quickly bring one knee up towards your chest and then return it to the starting position. Alternate legs quickly, as if running in place.</p>
                    <% } else { %>
                        <h3>Exercise 4: Plank</h3>
                        <p><strong>Time/Reps:</strong> 30 seconds</p>
                        <p><strong>Instructions:</strong> Hold the plank position for 30 seconds.</p>
                    <% } %>
                    <div>
                        <button type="button" onclick="previousExercise()">Previous</button>
                        <button type="button" onclick="nextExercise()">Next</button>
                    </div>
                <% } else { %>
                    <p>Exercise information not available.</p>
                <% } %>
            </div>
            <div class="exercise">
                <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Basic Exercises" : currentDay <= 10 ? "Increase Intensity" : "Circuit Training" %></h2>
                <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
                    <% if (currentDay <= 5) { %>
                        <h3>Exercise 5: Lunges</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10 reps per leg</p>
                        <p><strong>Instructions:</strong> Stand with your feet together. Step forward with one leg and lower your hips until both knees are bent at a 90-degree angle. Push back to the starting position. Repeat with the other leg.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 5: Burpees</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
                        <p><strong>Instructions:</strong> From a standing position, drop into a squat with your hands on the ground. Kick your feet back into a plank position. Perform a push-up, then jump your feet back to your hands and explosively jump into the air.</p>
                    <% } else { %>
                        <h3>Exercise 5: Lunges</h3>
                        <p><strong>Time/Reps:</strong> 10 reps per leg</p>
                        <p><strong>Instructions:</strong> Perform lunges for 10 reps per leg.</p>
                    <% } %>
                    <div>
                        <button type="button" onclick="previousExercise()">Previous</button>
                        <form action="" method="get">
                            <input type="hidden" name="currentDay" value="<%= currentDay %>">
                            <button type="submit" name="finishDay" value="true">Finish Day</button>
                        </form>
                    </div>
                <% } else { %>
                    <p>Exercise information not available.</p>
                <% } %>
            </div>
        </div>

        <script>
            function nextExercise() {
                var exercises = document.getElementsByClassName("exercise");
                for (var i = 0; i < exercises.length; i++) {
                    if (exercises[i].classList.contains("active")) {
                        exercises[i].classList.remove("active");
                        if (i + 1 < exercises.length) {
                            exercises[i + 1].classList.add("active");
                        } else {
                            exercises[0].classList.add("active");
                        }
                        break;
                    }
                }
                document.getElementById("exerciseForm").scrollIntoView();
            }

            function previousExercise() {
                var exercises = document.getElementsByClassName("exercise");
                for (var i = exercises.length - 1; i >= 0; i--) {
                    if (exercises[i].classList.contains("active")) {
                        exercises[i].classList.remove("active");
                        if (i - 1 >= 0) {
                            exercises[i - 1].classList.add("active");
                        } else {
                            exercises[exercises.length - 1].classList.add("active");
                        }
                        break;
                    }
                }
                document.getElementById("exerciseForm").scrollIntoView();
            }
        </script>

    <% } %>
</body>
</html>
<%
    }
%>
