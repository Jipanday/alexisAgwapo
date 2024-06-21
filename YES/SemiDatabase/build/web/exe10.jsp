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
         <img src="/SemiDatabase/img/arrow.svg" " alt="arrow"/>
    </div>
    <h1>15-Day Beginner Gain Height Workout Plan</h1>

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
                        <h3>Exercise 1: Cobra Stretch</h3>
                        <p><strong>Time/Reps:</strong> 3 sets hold for 15-30 seconds.</p>
                        <p><strong>Instructions:</strong> Lie on your stomach with palms on the floor under your shoulders. Push your chest up, arching your back while keeping your hips on the floor.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 1: Forward Bend</h3>
                        <p><strong>Time/Reps:</strong> 3 sets hold for 15-30 seconds.</p>
                        <p><strong>Instructions:</strong> Stand with your feet hip-width apart. Bend forward from your hips, reaching towards your toes. Keep your knees slightly bent.</p>
                    <% } else { %>
                        <h3>Exercise 1: Cat-Cow Stretch</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10-15 reps.</p>
                        <p><strong>Instructions:</strong> Get on your hands and knees. Arch your back up like a cat, then drop your belly towards the ground, lifting your head and tailbone like a cow.</p>
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
                        <h3>Exercise 2: Hanging Exercise</h3>
                        <p><strong>Time/Reps:</strong> 3 sets hold for 20-30 seconds.</p>
                        <p><strong>Instructions:</strong> Find a sturdy bar or ledge you can hang from. Grab it with an overhand grip and hang freely, allowing your spine to decompress.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 2: Pelvic Tilt</h3>
                        <p><strong>Time/Reps:</strong> Hold for a few seconds and release. Repeat 10-15 times.</p>
                        <p><strong>Instructions:</strong> Lie on your back with knees bent and feet flat on the floor. Flatten your lower back against the ground by tightening your abdominal muscles. </p>
                    <% } else { %>
                        <h3>Exercise 2: Pilates Roll-Up</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
                        <p><strong>Instructions:</strong> Lie on your back with arms overhead. Engage your core and slowly roll up to a sitting position, reaching forward towards your toes. Slowly roll back down.</p>
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
                        <h3>Exercise 3: Yoga Mountain Pose</h3>
                        <p><strong>Time/Reps:</strong> 3 sets hold for 15-30 seconds.</p>
                        <p><strong>Instructions:</strong> Stand tall with feet together. Reach your arms overhead, palms facing each other. Lengthen your spine and stretch upward.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 3: Wall Angels</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
                        <p><strong>Instructions:</strong> Stand with your back against a wall. Bring your arms up to shoulder height, then slide them up the wall as high as you can, keeping your elbows and wrists in contact with the wall. Slowly lower them back down.</p>
                    <% } else { %>
                        <h3>Exercise 3: Leg Raises</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10-15 reps</p>
                        <p><strong>Instructions:</strong>  Lie on your back with arms by your sides. Lift your legs off the ground until they form a 90-degree angle with your torso. Slowly lower them back down without touching the ground.</p>
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
                        <h3>Exercise 4: Prone Cobra</h3>
                        <p><strong>Time/Reps:</strong> 5 sets of 5-8 reps</p>
                        <p><strong>Instructions:</strong> Lie on your stomach with arms by your sides, palms facing up. Lift your chest and arms off the ground, squeezing your shoulder blades together. Hold for 10-15 seconds and release.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 4: Seated Forward Bend</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 15-30 seconds</p>
                        <p><strong>Instructions:</strong> Sit on the floor with legs extended in front of you. Reach forward towards your toes, keeping your back straight.</p>
                    <% } else { %>
                        <h3>Exercise 4: Child's Pose</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong>  Kneel on the floor with toes together and knees hip-width apart. Sit back on your heels and stretch your arms forward, lowering your chest towards the ground.</p>
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
                        <h3>Exercise 5: Standing Side Stretch</h3>
                        <p><strong>Time/Reps:</strong> 4 sets hold for 15-30 seconds, then switch sides.</p>
                        <p><strong>Instructions:</strong>  Stand with feet hip-width apart. Reach your right arm overhead and lean to the left, stretching the right side of your body. </p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 5: Hamstring Stretch</h3>
                        <p><strong>Time/Reps:</strong> 4 sets hold for 15-30 seconds, then switch legs.</p>
                        <p><strong>Instructions:</strong> Sit on the floor with one leg extended and the other bent so the sole of the foot touches the inner thigh of the extended leg. Reach forward towards your toes.</p>
                    <% } else { %>
                        <h3>Exercise 5: Swimming</h3>
                        <p><strong>Time/Reps:</strong> Repeat for 3-5 minutes.</p>
                        <p><strong>Instructions:</strong>  Lie on your stomach with arms extended overhead and legs straight. Lift your arms, chest, and legs off the ground simultaneously, like you're swimming. Flutter kick your legs and move your arms as if you're swimming freestyle.</p>
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
