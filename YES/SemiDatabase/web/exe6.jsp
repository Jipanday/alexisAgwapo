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
    <h1>15-Day Advanced Gain Height Workout Plan</h1>

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
                        <h3>Exercise 1: Pilates Roll-Up</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 60 seconds</p>
                        <p><strong>Instructions:</strong> Lie on your back, arms overhead, and roll up to a seated position.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 1:Forward Fold</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong>  Stand with feet hip-width apart, hinge at the hips, and reach towards the ground.</p>
                    <% } else { %>
                        <h3>Exercise 1: Cat-Cow Stretch</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 60 seconds</p>
                        <p><strong>Instructions:</strong>  Start on all fours, arch your back up like a cat, then drop your belly and lift your head like a cow.</p>
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
                        <h3>Exercise 2: Cobra Stretch</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 60 seconds</p>
                        <p><strong>Instructions:</strong> Lie on your stomach, palms on the ground, and lift your chest while keeping your hips on the ground.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 2: Child's Pose</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 60 seconds</p>
                        <p><strong>Instructions:</strong>  Kneel on the ground, sit back on your heels, and stretch your arms forward, lowering your chest towards the ground.</p>
                    <% } else { %>
                        <h3>Exercise 2:Standing Forward Bend</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 60 seconds</p>
                        <p><strong>Instructions:</strong> Stand with feet hip-width apart, hinge at the hips, and reach towards your toes.</p>
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
                        <h3>Exercise 3: Mountain Pose</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 45 seconds</p>
                        <p><strong>Instructions:</strong> Stand tall with feet together, arms by your sides, and focus on lengthening your spine.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 3: Seated Forward Bend</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds </p>
                        <p><strong>Instructions:</strong>  Sit on the ground with legs extended, hinge at the hips, and reach towards your toes.</p>
                    <% } else { %>
                        <h3>Exercise 3: Standing Side Bend</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 30-45 seconds</p>
                        <p><strong>Instructions:</strong> Stand tall, arms overhead, and lean to one side, stretching your ribs.</p>
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
                        <h3>Exercise 4: Warrior I</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 20 seconds</p>
                        <p><strong>Instructions:</strong> Step one foot back, bend your front knee, and raise your arms overhead, focusing on lengthening your spine.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 4:Warrior II</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong> From Warrior I, open your hips and arms to the sides while keeping your gaze forward.</p>
                    <% } else { %>
                        <h3>Exercise 4: Triangle Pose</h3>
                        <p><strong>Time/Reps:</strong> 90 seconds</p>
                        <p><strong>Instructions:</strong> From Warrior II, straighten your front leg and reach forward, lowering your hand to your shin or the ground while reaching your other arm towards the sky.</p>
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
                        <h3>Exercise 5: Bridge Pose</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 60 seconds</p>
                        <p><strong>Instructions:</strong> Lie on your back, bend your knees, and lift your hips towards the ceiling, engaging your glutes and core.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 5: Downward Dog</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 45 seconds</p>
                        <p><strong>Instructions:</strong> Start on all fours, lift your hips towards the ceiling, and straighten your legs, forming an inverted V shape.</p>
                    <% } else { %>
                        <h3>Exercise 5: Plank</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 45-60 seconds</p>
                        <p><strong>Instructions:</strong> Hold a push-up position, keeping your body in a straight line from head to heels.</p>
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
            <h3>Exercise 6: Tree Pose</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 45 seconds</p>
            <p><strong>Instructions:</strong> Stand on one leg, place the sole of your other foot on your inner thigh or calf, and bring your hands to prayer position in front of your chest.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 6: Extended Puppy Pose</h3>
            <p><strong>Time/Reps:</strong> 4 sets of 30 secodns</p>
            <p><strong>Instructions:</strong> Start on all fours, walk your hands forward, and lower your chest towards the ground while keeping your hips high.</p>
        <% } else { %>
            <h3>Exercise 6: Shoulder Stand</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
            <p><strong>Instructions:</strong>  Lie on your back, lift your legs towards the ceiling, and support your lower back with your hands while lifting your hips off the ground.</p>
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
            <h3>Exercise 7: Eagle Pose</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 45-60 seconds</p>
            <p><strong>Instructions:</strong>  Stand tall, wrap one leg around the other, and cross one arm under the other, bringing your palms together.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 7: Camel Pose</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
            <p><strong>Instructions:</strong> Kneel on the ground, lean back, and reach for your heels while lifting your chest towards the ceiling.</p>
        <% } else { %>
            <h3>Exercise 7: Standing Backbend</h3>
            <p><strong>Time/Reps:</strong> 4 sets of 60 seconds</p>
            <p><strong>Instructions:</strong> Stand tall, place your hands on your lower back, and gently arch backwards, opening your chest.</p>
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
            <h3>Exercise 8: Locust Pose</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
            <p><strong>Instructions:</strong>  Lie on your stomach, lift your chest and legs off the ground, and reach your arms back towards your feet.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 8: Standing Forward Fold with Shoulder Opener</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
            <p><strong>Instructions:</strong> Stand tall, clasp your hands behind your back, and hinge at the hips while lifting your clasped hands towards the ceiling.</p>
        <% } else { %>
            <h3>Exercise 8: Standing Chest Opener</h3>
            <p><strong>Time/Reps:</strong> 4 sets of 45-60 seconds</p>
            <p><strong>Instructions:</strong> Stand tall, clasp your hands behind your back, and gently lift your arms while opening your chest.</p>
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
            <h3>Exercise 9: Half Moon Pose</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 45-60 seconds</p>
            <p><strong>Instructions:</strong> From Warrior II, place your front hand on the ground or a block and lift your back leg, extending your top arm towards the sky.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 9: Garland Pose</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30-45 seconds</p>
            <p><strong>Instructions:</strong>  Squat down with feet together, elbows pressing against your inner thighs, and palms together at your heart.</p>
        <% } else { %>
            <h3>Exercise 9: Seated Twist</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
            <p><strong>Instructions:</strong> Sit on the ground with one leg crossed over the other, twist towards the bent knee, and place your opposite elbow on the outside of the knee.</p>
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
            <h3>Exercise 10: Headstand</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30-45 seconds</p>
            <p><strong>Instructions:</strong>  Start on all fours, place your forearms on the ground, and lift your legs towards the ceiling, balancing on your head and forearms.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 10: Handstand</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
            <p><strong>Instructions:</strong> Kick up into a handstand against a wall or practice balancing in the middle of the room.</p>
        <% } else { %>
            <h3>Exercise 10: Wall Angels</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 45-60 seconds</p>
            <p><strong>Instructions:</strong>  Stand with your back against a wall, raise your arms to shoulder height, and slide them up and down the wall while keeping your back flat.</p>
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

