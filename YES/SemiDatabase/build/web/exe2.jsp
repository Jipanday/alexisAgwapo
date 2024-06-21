<%-- 
    Document   : exe1
    Created on : Jun 7, 2024, 8:00:45 PM
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
    <title>15-Day Intermediate Weight Loss Workout</title>
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
         <img src="/SemiDatabase/img/arrow.svg" " alt="arrow"/>
    </div>
    <h1>15-Day Intermediate Weight Loss Workout Plan</h1>

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
            <h3>Exercise 6: Push-ups</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
            <p><strong>Instructions:</strong> Place your hands on the floor, slightly wider than shoulder-width apart. Extend your legs back so you are balanced on your hands and toes. Lower your body until your chest nearly touches the floor. Push yourself back up to the starting position. Repeat.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 6: Tricep Dips</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
            <p><strong>Instructions:</strong> Sit on the edge of a chair or bench with your hands next to your hips. Slide your butt off the edge and lower your body by bending your elbows. Push back up to the starting position. Repeat.</p>
        <% } else { %>
            <h3>Exercise 6: Plank</h3>
            <p><strong>Time/Reps:</strong> 30 seconds</p>
            <p><strong>Instructions:</strong> Lie face down with your forearms on the floor and your elbows directly below your shoulders. Lift your body up into a plank position, keeping your body in a straight line from your head to your heels. Hold this position for 30 seconds. Repeat.</p>
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
            <h3>Exercise 7: Lunges</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10 reps per leg</p>
            <p><strong>Instructions:</strong> Stand with your feet together. Step forward with one leg and lower your hips until both knees are bent at a 90-degree angle. Push back to the starting position. Repeat with the other leg.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 7: Burpees</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
            <p><strong>Instructions:</strong> From a standing position, drop into a squat with your hands on the ground. Kick your feet back into a plank position. Perform a push-up, then jump your feet back to your hands and explosively jump into the air.</p>
        <% } else { %>
            <h3>Exercise 7: Lunges</h3>
            <p><strong>Time/Reps:</strong> 10 reps per leg</p>
            <p><strong>Instructions:</strong> Perform lunges for 10 reps per leg.</p>
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
            <h3>Exercise 8: Crunches</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
            <p><strong>Instructions:</strong> Lie on your back with your knees bent and feet flat on the floor. Place your hands behind your head or crossed over your chest. Contract your abdominal muscles and lift your shoulder blades off the ground. Exhale as you come up and inhale as you lower back down. Repeat.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 8: Plank Jacks</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
            <p><strong>Instructions:</strong> Start in a plank position with your hands under your shoulders and your body in a straight line. Jump both feet out wide and then back together, like a jumping jack motion. Keep your core engaged and your hips stable. Repeat.</p>
        <% } else { %>
            <h3>Exercise 8: Crunches</h3>
            <p><strong>Time/Reps:</strong> 15 reps</p>
            <p><strong>Instructions:</strong> Perform crunches for 15 reps.</p>
        <% } %>
        <div>
            <button type="button" onclick="previousExercise()">Previous</button>
            <button type="button" onclick="nextExercise()">Next</button>
        </div>
    <% } else { %>
        <p>Exercise information not available.</p>
    <% } %>
</div>

        </div>
        <form id="exerciseForm" action="" method="get">
            <input type="hidden" name="currentDay" value="<%= currentDay %>">
            <% for (int i = 0; i < 15; i++) { %>
                <input type="hidden" name="day<%= (i + 1) %>" value="<%= completionStatus[i] %>">
            <% } %>
            <button type="submit" name="finishDay" value="true">Finish Day <%= currentDay %></button>
        </form>
    <% } %>

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
</body>
</html>


<%
    }
%>
