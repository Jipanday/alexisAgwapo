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
    <title>15-Day Intermediate Height Gain Workout Plan</title>
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
            <div class="slideshow-container">
    <div class="exercise active">
        <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching & Basics" : currentDay <= 10 ? "Intermediate Strength" : "Dynamic Workouts" %></h2>
        <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
            <% if (currentDay <= 5) { %>
                <h3>Exercise 1: Hanging</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                <p><strong>Instructions:</strong> Find a bar that can support your weight. Grip the bar with your palms facing away from you and let your body hang freely. Keep your arms and body relaxed. Hold this position for 30 seconds, then rest and repeat.</p>
            <% } else if (currentDay <= 10) { %>
                <h3>Exercise 1: Pull-ups</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
                <p><strong>Instructions:</strong> Grip the bar with your palms facing away from you. Pull your body up until your chin is above the bar. Lower yourself back down with control. Repeat.</p>
            <% } else { %>
                <h3>Exercise 1: Hanging with Leg Raises</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
                <p><strong>Instructions:</strong> While hanging from a bar, lift your legs up to a 90-degree angle and lower them back down slowly. Repeat.</p>
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
        <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching & Basics" : currentDay <= 10 ? "Intermediate Strength" : "Dynamic Workouts" %></h2>
        <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
            <% if (currentDay <= 5) { %>
                <h3>Exercise 2: Cobra Stretch</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                <p><strong>Instructions:</strong> Lie face down on the floor. Place your hands under your shoulders and push your upper body up, extending your back. Keep your hips on the floor and stretch your back as much as possible. Hold for 30 seconds.</p>
            <% } else if (currentDay <= 10) { %>
                <h3>Exercise 2: Push-ups</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
                <p><strong>Instructions:</strong> Place your hands on the floor, slightly wider than shoulder-width apart. Extend your legs back so you are balanced on your hands and toes. Lower your body until your chest nearly touches the floor. Push yourself back up to the starting position. Repeat.</p>
            <% } else { %>
                <h3>Exercise 2: Diamond Push-ups</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 12 reps</p>
                <p><strong>Instructions:</strong> Place your hands close together under your chest, forming a diamond shape with your fingers. Perform a push-up, keeping your elbows close to your body. Repeat.</p>
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
        <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching & Basics" : currentDay <= 10 ? "Intermediate Strength" : "Dynamic Workouts" %></h2>
        <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
            <% if (currentDay <= 5) { %>
                <h3>Exercise 3: Cat-Cow Stretch</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
                <p><strong>Instructions:</strong> Get on all fours with your wrists directly under your shoulders and your knees under your hips. Inhale, arch your back and lift your head (Cow). Exhale, round your spine and tuck your chin to your chest (Cat). Repeat.</p>
            <% } else if (currentDay <= 10) { %>
                <h3>Exercise 3: Plank</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 45 seconds</p>
                <p><strong>Instructions:</strong> Lie face down with your forearms on the floor and your elbows directly below your shoulders. Lift your body up into a plank position, keeping your body in a straight line from your head to your heels. Hold this position for 45 seconds. Repeat.</p>
            <% } else { %>
                <h3>Exercise 3: Side Plank</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 30 seconds per side</p>
                <p><strong>Instructions:</strong> Lie on your side with your legs straight. Prop yourself up with your forearm directly under your shoulder. Lift your hips so your body forms a straight line from head to feet. Hold for 30 seconds. Repeat on the other side.</p>
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
        <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching & Basics" : currentDay <= 10 ? "Intermediate Strength" : "Dynamic Workouts" %></h2>
        <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
            <% if (currentDay <= 5) { %>
                <h3>Exercise 4: Standing Toe Touch</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
                <p><strong>Instructions:</strong> Stand with your feet shoulder-width apart. Bend forward at the hips and reach for your toes. Hold for a few seconds and then return to the starting position. Repeat.</p>
            <% } else if (currentDay <= 10) { %>
                <h3>Exercise 4: High Knees</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 1 minute</p>
                <p><strong>Instructions:</strong> Stand in place and run, bringing your knees as high as possible with each step. Move at a fast pace.</p>
            <% } else { %>
                <h3>Exercise 4: Jumping Jacks</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 1 minute</p>
                <p><strong>Instructions:</strong> Stand upright with your legs together, arms at your sides. Bend your knees slightly and jump into the air. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head. Jump back to the starting position. Repeat.</p>
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
        <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching & Basics" : currentDay <= 10 ? "Intermediate Strength" : "Dynamic Workouts" %></h2>
        <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
            <% if (currentDay <= 5) { %>
                <h3>Exercise 5: Pelvic Tilts</h3>
                <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
                <p><strong>Instructions:</strong> Lie on your back with your knees bent and feet flat on the floor. Tighten your abdominal muscles and push your lower back into the floor. Hold for a few seconds, then release. Repeat.</p>
<% } else if (currentDay <= 10) { %>
<h3>Exercise 5: Squats</h3>
<p><strong>Time/Reps:</strong> 3 sets of 12 reps</p>
<p><strong>Instructions:</strong> Stand with your feet shoulder-width apart. Lower your body by bending your knees and pushing your hips back as if sitting into a chair. Keep your chest up and your back straight. Push through your heels to return to the starting position. Repeat.</p>
<% } else { %>
<h3>Exercise 5: Jump Squats</h3>
<p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
<p><strong>Instructions:</strong> Begin in a squat position, then explode upward into a jump. Land softly, immediately lowering back into a squat position. Repeat.</p>
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
    <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching & Basics" : currentDay <= 10 ? "Intermediate Strength" : "Dynamic Workouts" %></h2>
    <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
        <% if (currentDay <= 5) { %>
            <h3>Exercise 6: Hamstring Stretch</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds per leg</p>
            <p><strong>Instructions:</strong> Sit on the floor with one leg extended straight in front of you and the other bent with the sole of the foot against the inner thigh of the extended leg. Lean forward from your hips and reach toward your toes on the extended leg. Hold for 30 seconds. Repeat on the other side.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 6: Dumbbell Lunges</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10 reps per leg</p>
            <p><strong>Instructions:</strong> Stand with dumbbells in each hand. Step forward with one leg, lowering your hips until both knees are bent at a 90-degree angle. Keep your torso upright and your front knee aligned with your ankle. Push back to the starting position. Repeat on the other leg.</p>
        <% } else { %>
            <h3>Exercise 6: Bicycle Crunches</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 20 reps</p>
            <p><strong>Instructions:</strong> Lie on your back with your hands behind your head and your legs raised and bent at a 90-degree angle. Bring your right elbow towards your left knee while straightening your right leg. Then, switch sides, bringing your left elbow towards your right knee. Continue alternating sides in a pedaling motion.</p>
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
    <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching & Basics" : currentDay <= 10 ? "Intermediate Strength" : "Dynamic Workouts" %></h2>
    <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
        <% if (currentDay <= 5) { %>
            <h3>Exercise 7: Calf Stretch</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds per leg</p>
            <p><strong>Instructions:</strong> Stand facing a wall with one foot in front of the other, toes pointing forward. Keep your back leg straight and your heel on the ground. Lean forward, bending your front knee, until you feel a stretch in your calf. Hold for 30 seconds. Repeat on the other side.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 7: Deadlifts</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 8-10 reps</p>
            <p><strong>Instructions:</strong> Stand with your feet shoulder-width apart, holding a barbell or dumbbells in front of your thighs. Hinge at your hips, keeping your back straight, and lower the weight towards the ground. Keep the weight close to your body. Return to the starting position by squeezing your glutes and thrusting your hips forward.</p>
        <% } else { %>
            <h3>Exercise 7: Russian Twists</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 15 reps per side</p>
            <p><strong>Instructions:</strong> Sit on the floor with your knees bent and your feet elevated. Lean back slightly, keeping your back straight. Hold a weight or medicine ball with both hands and twist your torso to the right, then to the left, tapping the weight on the floor each side.</p>
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
    <h2>Day <%= currentDay %>: <%= currentDay <= 5 ? "Stretching & Basics" : currentDay <= 10 ? "Intermediate Strength" : "Dynamic Workouts" %></h2>
    <% if (completionStatus != null && currentDay <= completionStatus.length) { %>
        <% if (currentDay <= 5) { %>
            <h3>Exercise 8: Standing Quadriceps Stretch</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds per leg</p>
            <p><strong>Instructions:</strong> Stand tall and bring one heel towards your buttocks, grabbing your ankle with your corresponding hand. Keep your knees close together and your thighs aligned. Hold for 30 seconds. Repeat on the other side.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 8: Dumbbell Shoulder Press</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10-12 reps</p>
            <p><strong>Instructions:</strong> Sit on a bench with back support, holding dumbbells at shoulder height with palms facing forward. Press the dumbbells upward until your arms are fully extended. Lower them back down to shoulder height. Repeat.</p>
        <% } else { %>
            <h3>Exercise 8: Plank to Push-up</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
            <p><strong>Instructions:</strong> Start in a plank position on your forearms. Push up onto your hands one arm at a time, then return to the plank position, starting with the opposite arm. Repeat, alternating the arm you push up with first.</p>
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
