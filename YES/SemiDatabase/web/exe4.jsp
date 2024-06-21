<%-- 
    Document   : exe1
    Created on : Jun 7, 2024, 8:00:45 PM
    Author     : marxa
--%>
<%
    // Check if the session exists and if the user is logged in
    session = request.getSession(false);
    if (session == null || session.getAttribute("email") == null) {
        // Redirect to login page if not logged in
        response.sendRedirect("login.jsp");
    } else {
        // User is logged in, display the dashboard content
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>15-Day Height Gain Workout Plan</title>
    <style>
        .completed { text-decoration: line-through; color: grey; }
        .exercise { display: none; }
        .active { display: block; }
        body {
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
        }

        h1, h2, h3 {
            color: white;
        }

        label, p {
            color: white;
        }

        form {
            margin: 20px auto;
        }

        input[type="number"], button {
            padding: 10px;
            margin: 10px;
            border: 2px solid red;
            background-color: black;
            color: white;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            cursor: pointer;
        }

        button:hover {
            background-color: red;
            color: black;
        }

        .completed-mark {
            color: green;
            font-weight: bold;
            margin-left: 10px;
        }

        .slideshow-container {
            max-width: 800px;
            margin: 20px auto;
            border: 2px solid red;
            padding: 20px;
            border-radius: 10px;
            background-color: #333;
        }

        .exercise {
            margin-bottom: 20px;
        }

        button[type="button"] {
            margin: 5px;
        }

        .completed {
            text-decoration: line-through;
            color: grey;
        }

        hr {
            border: 1px solid red;
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
    </style>
</head>
<body>
    <div class="return-button" onclick="window.location.href='Work.jsp';">
         <img src="/SemiDatabase/img/arrow.svg" alt="arrow"/>
    </div>
    <h1>15-Day Beginner Height Gain Workout Plan</h1>

    <%
        int currentDay = 1;
        boolean startDay = request.getParameter("startDay") != null;
        boolean reset = request.getParameter("reset") != null;
        String[] completionStatus = new String[15];

        if (!reset) {
            for (int i = 0; i < 15; i++) {
                completionStatus[i] = request.getParameter("day" + (i + 1)) != null ? "completed" : "";
            }

            if (request.getParameter("currentDay") != null) {
                currentDay = Integer.parseInt(request.getParameter("currentDay"));
            }

            if (request.getParameter("finishDay") != null) {
                completionStatus[currentDay - 1] = "completed";
            }
        }
    %>

    <% 
    if (request.getParameter("reset") != null) {
        // Reset the completion status array to an initial state
        completionStatus = new String[15];
    }
    %>

    <% 
    // Ensure completionStatus is initialized
    if (completionStatus == null) {
        completionStatus = new String[15];
    }
    %>

    <form action="" method="get">
        <label for="daySelect">Select Day (1-15):</label>
        <input type="number" id="daySelect" name="currentDay" min="1" max="15" value="<%= currentDay %>">
        <button type="submit" name="startDay" value="true">Start Day <%= currentDay %></button>
        <% if (completionStatus != null && completionStatus.length >= currentDay && completionStatus[currentDay - 1] != null && completionStatus[currentDay - 1].equals("completed")) { %>
            <span class="completed-mark">✓</span>
        <% } %>
    </form>

    <form action="" method="get">
        <button type="submit" name="reset" value="true">Reset Plan</button>
    </form>

    <hr>

    <% if (startDay) { %>
        <%-- Workout for the selected day --%>
        
        <div class="slideshow-container">
            <div class="exercise active">
                <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching Exercises" : currentDay <= 10 ? "Core and Posture" : "Full Body Stretch" %></h2>
                <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
                    <% if (currentDay <= 5) { %>
                        <h3>Exercise 1: Hanging Exercise</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong> Find a horizontal bar. Hang from the bar with both arms extended. Keep your body relaxed and hang for 30 seconds. Rest and repeat.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 1: Jumping Rope</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 1 minute</p>
                        <p><strong>Instructions:</strong> Jump rope for 1 minute. Rest and repeat.</p>
                    <% } else { %>
                        <h3>Exercise 1: Hanging Exercise</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong> Find a horizontal bar. Hang from the bar with both arms extended. Keep your body relaxed and hang for 30 seconds. Rest and repeat.</p>
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
                <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching Exercises" : currentDay <= 10 ? "Core and Posture" : "Full Body Stretch" %></h2>
                <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
                    <% if (currentDay <= 5) { %>
                        <h3>Exercise 2: Cobra Stretch</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 20 seconds</p>
                        <p><strong>Instructions:</strong> Lie face down on the floor with your palms under your shoulders. Push your upper body up, keeping your pelvis on the floor. Hold this position for 20 seconds.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 2: Cat-Cow Stretch</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
                        <p><strong>Instructions:</strong> Get on your hands and knees. Arch your back up towards the ceiling (cat), then dip it down towards the floor (cow). Repeat 10 times.</p>
                    <% } else { %>
                        <h3>Exercise 2: Cobra Stretch</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 20 seconds</p>
                        <p><strong>Instructions:</strong> Lie face down on the floor with your palms under your shoulders. Push your upper body up, keeping your pelvis on the floor. Hold this position for 20 seconds.</p>
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
                <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching Exercises" : currentDay <= 10 ? "Core and Posture" : "Full Body Stretch" %></h2>
                <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
                                        <% if (currentDay <= 5) { %>
                        <h3>Exercise 3: Forward Bend</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong> Stand with feet shoulder-width apart. Bend forward at the hips, keeping your legs straight. Try to touch your toes. Hold for 30 seconds.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 3: Plank</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong> Get into a push-up position but rest on your forearms. Keep your body in a straight line and hold for 30 seconds.</p>
                    <% } else { %>
                        <h3>Exercise 3: Forward Bend</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong> Stand with feet shoulder-width apart. Bend forward at the hips, keeping your legs straight. Try to touch your toes. Hold for 30 seconds.</p>
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
                <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching Exercises" : currentDay <= 10 ? "Core and Posture" : "Full Body Stretch" %></h2>
                <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
                    <% if (currentDay <= 5) { %>
                        <h3>Exercise 4: Pelvic Shift</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 20 seconds</p>
                        <p><strong>Instructions:</strong> Lie on your back with your knees bent and feet flat on the floor. Lift your pelvis towards the ceiling, hold for 20 seconds, then lower it back down. Repeat.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 4: Leg Raises</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
                        <p><strong>Instructions:</strong> Lie on your back with your legs straight. Lift your legs towards the ceiling, then lower them back down without touching the floor. Repeat.</p>
                    <% } else { %>
                        <h3>Exercise 4: Pelvic Shift</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 20 seconds</p>
                        <p><strong>Instructions:</strong> Lie on your back with your knees bent and feet flat on the floor. Lift your pelvis towards the ceiling, hold for 20 seconds, then lower it back down. Repeat.</p>
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
                <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching Exercises" : currentDay <= 10 ? "Core and Posture" : "Full Body Stretch" %></h2>
                <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
                    <% if (currentDay <= 5) { %>
                        <h3>Exercise 5: Side Stretch</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 20 seconds (each side)</p>
                        <p><strong>Instructions:</strong> Stand with feet shoulder-width apart. Raise your right arm and bend to the left, stretching your side. Hold for 20 seconds. Repeat on the other side.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 5: Supermans</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
                        <p><strong>Instructions:</strong> Lie face down with arms extended in front of you. Lift your arms, chest, and legs off the floor simultaneously. Hold for a moment, then lower back down. Repeat.</p>
                    <% } else { %>
                        <h3>Exercise 5: Side Stretch</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 20 seconds (each side)</p>
                        <p><strong>Instructions:</strong> Stand with feet shoulder-width apart. Raise your right arm and bend to the left, stretching your side. Hold for 20 seconds. Repeat on the other side.</p>
                    <% } %>
                    <div>
                        <button type="button" onclick="previousExercise()">Previous</button>
                        <button type="button" onclick="nextExercise()">Next</button>
                    </div>
                <% } else { %>
                    <p>Exercise information not available.</p>
                <% } %>
            </div>
            <form action="" method="get">
                <input type="hidden" name="currentDay" value="<%= currentDay %>">
                <button type="submit" name="finishDay" value="true">Mark Day <%= currentDay %> as Complete</button>
            </form>
        </div>
    <% } %>

    <script>
        let currentExercise = 0;
        const exercises = document.querySelectorAll('.exercise');
        exercises[currentExercise].classList.add('active');

        function showExercise(index) {
            exercises[currentExercise].classList.remove('active');
            currentExercise = index;
            exercises[currentExercise].classList.add('active');
        }

        function nextExercise() {
            if (currentExercise < exercises.length - 1) {
                showExercise(currentExercise + 1);
            }
        }

        function previousExercise() {
            if (currentExercise > 0) {
                showExercise(currentExercise - 1);
            }
        }
    </script>
</body>
</html>
<% } %>
