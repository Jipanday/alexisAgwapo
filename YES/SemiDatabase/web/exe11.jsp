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
    <h1>15-Day Intermediate Gain Height Workout Plan</h1>

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
                        <h3>Exercise 1:Forward Fold</h3>
                        <p><strong>Time/Reps:</strong> 3 sets hold for 30 seconds</p>
                        <p><strong>Instructions:</strong> Stand with feet hip-width apart, bend forward at the hips, reaching your hands toward the ground or your feet.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 1:Cobra Stretch</h3>
                        <p><strong>Time/Reps:</strong> 3 sets hold for 30-45 seconds</p>
                        <p><strong>Instructions:</strong> Lie on your stomach, hands under your shoulders, push up to arch your back while keeping your pelvis on the floor.</p>
                    <% } else { %>
                        <h3>Exercise 1: Cat-Cow Stretch</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10-15 reps</p>
                        <p><strong>Instructions:</strong>  Start on your hands and knees, arch your back up like a cat, then drop your belly and lift your chest like a cow. </p>
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
                        <h3>Exercise 2: Child's Poses</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong> Kneel on the floor, sit back on your heels, stretch your arms out in front of you, and lower your chest towards the ground. </p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 2: Pelvic Tilts</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 12-15 reps</p>
                        <p><strong>Instructions:</strong> Lie on your back with knees bent, flatten your lower back against the floor by tightening your abdominal muscles.</p>
                    <% } else { %>
                        <h3>Exercise 2: Hip Flexor Stretch</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 30 seconds each side</p>
                        <p><strong>Instructions:</strong> Kneel on one knee, keep your torso upright and press your hips forward until you feel a stretch in the front of your hip.</p>
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
                        <h3>Exercise 3: Hamstring Stretch</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 20-30 seconds each leg</p>
                        <p><strong>Instructions:</strong> Sit on the floor with one leg extended and the other bent, lean forward from your hips until you feel a stretch in the back of your thigh.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 3: Quad Stretch</h3>
                        <p><strong>Time/Reps:</strong>  4 sets of 30-45 seconds each leg</p>
                        <p><strong>Instructions:</strong> Stand on one leg, bend the other leg and grab your ankle, gently pull your heel towards your glutes until you feel a stretch in the front of your thigh.</p>
                    <% } else { %>
                        <h3>Exercise 3: Calf Stretch</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 30-45 seconds each leg</p>
                        <p><strong>Instructions:</strong> Stand facing a wall with one foot in front of the other, lean forward, keeping your back heel on the ground until you feel a stretch in your calf.</p>
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
                        <h3>Exercise 4: Ankle Circles</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 10 circles counter-clockwise & clockwise</p>
                        <p><strong>Instructions:</strong> Sit on the floor with legs extended, lift one leg off the ground and rotate your ankle in a circular motion.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 4: Neck Stretches</h3>
                        <p><strong>Time/Reps:</strong> 3 sets 15-20 seconds, then switch sides.</p>
                        <p><strong>Instructions:</strong> Sit or stand tall, tilt your head to one side bringing your ear towards your shoulder until you feel a stretch along the side of your neck.</p>
                    <% } else { %>
                        <h3>Exercise 4: Shoulder Rolls</h3>
                        <p><strong>Time/Reps:</strong> 3 sets </p>
                        <p><strong>Instructions:</strong> Stand tall with arms by your sides, roll your shoulders forward in a circular motion for 10 reps, then reverse the direction for another 10 reps.</p>
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
                        <h3>Exercise 5: Chest Opener</h3>
                        <p><strong>Time/Reps:</strong> 3 sets hold for 20-30 seconds</p>
                        <p><strong>Instructions:</strong> Stand tall with arms behind you, interlace your fingers and squeeze your shoulder blades together as you lift your arms up. </p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 5: Spinal Twist</h3>
                        <p><strong>Time/Reps:</strong> 3 sets</p>
                        <p><strong>Instructions:</strong> Sit on the floor with legs extended, bend one knee and cross it over the other leg, twist your torso towards the bent knee and place your opposite elbow on the outside of the bent knee, hold for 20-30 seconds, then switch sides.</p>
                    <% } else { %>
                        <h3>Exercise 5: Wall Angels</h3>
                        <p><strong>Time/Reps:</strong> 4 sets</p>
                        <p><strong>Instructions:</strong> Stand with your back against a wall, raise your arms to shoulder height and bend your elbows to 90 degrees, then slide your arms up the wall as high as you can, keeping your elbows and wrists in contact with the wall. Slowly lower your arms back to the starting position. Do 10 reps.</p>
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
            <h3>Exercise 6: Plank</h3>
            <p><strong>Time/Reps:</strong> 3 sets</p>
            <p><strong>Instructions:</strong> Start in a push-up position, but with your weight on your forearms instead of your hands, keep your body in a straight line from head to heels, hold for 30-60 seconds.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 6: Side Plank</h3>
            <p><strong>Time/Reps:</strong> 3 sets</p>
            <p><strong>Instructions:</strong> Lie on your side with legs straight, prop yourself up on your forearm, keeping your body in a straight line, hold for 30-60 seconds, then switch sides.</p>
        <% } else { %>
            <h3>Exercise 6: Bridge</h3>
            <p><strong>Time/Reps:</strong> 2-3 sets</p>
            <p><strong>Instructions:</strong> Lie on your back with knees bent and feet hip-width apart, lift your hips off the ground until your body forms a straight line from shoulders to knees. Hold for 20-30 seconds.</p>
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
            <h3>Exercise 7: Superman</h3>
            <p><strong>Time/Reps:</strong> 3 sets</p>
            <p><strong>Instructions:</strong> Lie on your stomach with arms extended overhead, lift your arms, chest, and legs off the ground simultaneously, hold for 5-10 seconds, then lower back down. Do 10 reps.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 7: Seated Twist</h3>
            <p><strong>Time/Reps:</strong> 3 sets</p>
            <p><strong>Instructions:</strong> Sit on the floor with legs extended, bend one knee and cross it over the other leg, twist your torso towards the bent knee and place your opposite hand on the floor behind you for support. Hold for 20-30 seconds, then switch sides.</p>
        <% } else { %>
            <h3>Exercise 7: Standing Forward Bend</h3>
            <p><strong>Time/Reps:</strong> 3-4 sets</p>
            <p><strong>Instructions:</strong> Stand tall with feet hip-width apart, hinge at the hips and fold forward, letting your head hang heavy and reaching your hands towards the ground or your feet. Hold for 30 seconds.</p>
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
            <h3>Exercise 8: Wall Sit</h3>
            <p><strong>Time/Reps:</strong> 3 sets</p>
            <p><strong>Instructions:</strong> Lean against a wall with your feet shoulder-width apart, slide your back down the wall until your knees are bent at a 90-degree angle, hold for 30-60 seconds.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 8: Leg Raises</h3>
            <p><strong>Time/Reps:</strong> 2-3 sets</p>
            <p><strong>Instructions:</strong>  Lie on your back with legs straight, lift one leg off the ground to about 45 degrees, then slowly lower it back down without letting it touch the ground. Do 10 reps on each leg.</p>
        <% } else { %>
            <h3>Exercise 8: Standing Calf Raises</h3>
            <p><strong>Time/Reps:</strong> 2-3 sets</p>
            <p><strong>Instructions:</strong>  Stand tall with feet hip-width apart, rise up onto the balls of your feet, then slowly lower back down. Do 15-20 reps.</p>
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
