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
    <title>15-Day Advanced Weight Loss Workout</title>
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
    <h1>15-Day Advanced Weight Loss Workout Plan</h1>

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
                        <h3>Exercise 1: Barbell Deadlift</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
                        <p><strong>Instructions:</strong> Stand with feet shoulder-width apart, grip barbell with hands just outside legs. Keeping back straight, hinge at hips and knees, lowering barbell to mid-shin level. Drive through heels, extend hips and knees, lifting barbell until standing upright.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 1:One-Arm Dumbbell Row</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong>Place one knee and hand on bench, opposite leg extended to side, holding dumbbell in opposite hand. Pull dumbbell towards hip, keeping elbow close to body. Lower dumbbell with control, repeat for desired reps, then switch sides.</p>
                    <% } else { %>
                        <h3>Exercise 1: Pull-Up</h3>
                        <p><strong>Time/Reps:</strong> 30 seconds</p>
                        <p><strong>Instructions:</strong> Grip pull-up bar slightly wider than shoulder-width apart, palms facing away. Hang with arms fully extended, engage core. Pull body up until chin clears bar, lower with control.</p>
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
                        <h3>Exercise 2: Weighted Dip</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 12 reps</p>
                        <p><strong>Instructions:</strong> Grip parallel bars, extend arms, and lift legs off ground. Lower body by bending elbows until shoulders are below elbows. Push body back up to starting position, keeping elbows close to body.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 2: Bulgarian Split Squat</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 12 reps</p>
                        <p><strong>Instructions:</strong> Stand facing away from bench with one foot elevated behind on bench. Lower body until front thigh is parallel to ground, keeping knee over ankle. Drive through front heel to return to standing position.</p>
                    <% } else { %>
                        <h3>Exercise 2:Barbell Bench Press</h3>
                        <p><strong>Time/Reps:</strong> 15 reps</p>
                        <p><strong>Instructions:</strong> Lie on bench, grip barbell slightly wider than shoulder-width apart. Lower barbell to chest, keeping elbows at 45-degree angle. Press barbell back up to starting position.</p>
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
                        <h3>Exercise 3: Single-Leg Romanian Deadlift</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
                        <p><strong>Instructions:</strong> Stand on one leg, holding dumbbell or kettlebell in opposite hand. Hinge at hips, lowering weight towards ground while extending non-weight-bearing leg behind. Return to starting position by driving through heel and squeezing glutes.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 3: Front Squat</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
                        <p><strong>Instructions:</strong> Hold barbell across front shoulders with elbows up and parallel to ground. Lower body by bending knees and hips until thighs are parallel to ground. Drive through heels to return to standing position.</p>
                    <% } else { %>
                        <h3>Exercise 3: Romanian Deadlift</h3>
                        <p><strong>Time/Reps:</strong> 10 reps</p>
                        <p><strong>Instructions:</strong> Stand with feet hip-width apart, hold barbell with overhand grip, arms extended. Hinge at hips, lowering barbell towards ground while keeping back flat. Engage hamstrings and glutes to return to starting position.</p>
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
                        <h3>Exercise 4: Muscle-Up</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 20 seconds</p>
                        <p><strong>Instructions:</strong> Grip pull-up bar with palms facing away, slightly wider than shoulder-width apart.Explosively pull body upwards, simultaneously transitioning hands to dip position. Press body upwards until arms are fully extended.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 4:Pistol Squat</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
                        <p><strong>Instructions:</strong> Stand on one leg, extend other leg in front of body. Lower body by bending knee, keeping extended leg off ground. Push through heel to return to standing position.</p>
                    <% } else { %>
                        <h3>Exercise 4: Incline Dumbbell Press</h3>
                        <p><strong>Time/Reps:</strong> 30 seconds</p>
                        <p><strong>Instructions:</strong> Lie on incline bench, hold dumbbells above chest with palms facing away. Lower dumbbells to sides of chest, elbows forming 90-degree angles. Press dumbbells back up to starting position.</p>
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
                        <h3>Exercise 5: Barbell Bent Over Row</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10 reps per leg</p>
                        <p><strong>Instructions:</strong> Stand with feet shoulder-width apart, grip barbell with hands slightly wider than shoulder-width. Hinge at hips, keeping back straight, lower barbell towards ground. Pull barbell towards hips, squeezing shoulder blades together.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 5: Handstand Push-Up</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
                        <p><strong>Instructions:</strong> Kick up into handstand against wall or freestanding. Lower body by bending elbows until head lightly touches ground. Press body back up to fully extended arms.</p>
                    <% } else { %>
                        <h3>Exercise 5: Lunge with Overhead Press</h3>
                        <p><strong>Time/Reps:</strong> 10 reps per leg</p>
                        <p><strong>Instructions:</strong> Hold dumbbells at shoulder height, palms facing forward. Step forward into lunge, simultaneously pressing dumbbells overhead. Return to standing position, lower dumbbells to shoulders.</p>
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
            <h3>Exercise 6: Barbell Clean and Press</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
            <p><strong>Instructions:</strong> Start with barbell on ground, grip slightly wider than shoulder-width apart. Explosively pull barbell towards shoulders, catching in front squat position. Press barbell overhead until arms are fully extended.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 6: Russian Twist</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
            <p><strong>Instructions:</strong> Sit on ground, knees bent, heels on floor. Lean back slightly, holding weight or medicine ball. Rotate torso side to side, touching weight to ground on each side.</p>
        <% } else { %>
            <h3>Exercise 6: Box Jump</h3>
            <p><strong>Time/Reps:</strong> 30 seconds</p>
            <p><strong>Instructions:</strong> Stand in front of box or platform. Bend knees, swing arms back, then explosively jump onto box. Land softly with bent knees, step down or jump back to starting position.</p>
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
            <h3>Exercise 7: Hanging Leg Raise</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10 reps per leg</p>
            <p><strong>Instructions:</strong> Hang from pull-up bar with arms extended. Engage core, lift legs until they are parallel to ground. Lower legs back down with control.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 7: Barbell Thruster</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10 reps</p>
            <p><strong>Instructions:</strong> Hold barbell at shoulder height, palms facing forward. Perform a front squat, then explosively press barbell overhead. Lower barbell back to shoulder height and repeat.</p>
        <% } else { %>
            <h3>Exercise 7: Reverse Lunge with Bicep Curl</h3>
            <p><strong>Time/Reps:</strong> 10 reps per leg</p>
            <p><strong>Instructions:</strong> Hold dumbbells at sides, palms facing forward. Step back into reverse lunge, simultaneously performing bicep curl. Return to standing position, lower dumbbells to sides.</p>
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
            <h3>Exercise 8: Barbell Front Rack Lunge</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
            <p><strong>Instructions:</strong> Hold barbell across front shoulders, elbows up. Step forward into lunge, lowering back knee towards ground. Push through front heel to return to standing position.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 8: Dumbbell Shoulder Press</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
            <p><strong>Instructions:</strong> Sit on bench with back support, hold dumbbells at shoulder height. Press dumbbells overhead until arms are fully extended. Lower dumbbells back to shoulder height with control.</p>
        <% } else { %>
            <h3>Exercise 8:Plank with Leg Lift</h3>
            <p><strong>Time/Reps:</strong> 15 reps</p>
            <p><strong>Instructions:</strong> Start in plank position on elbows and toes. Lift one leg off ground, keeping hips and shoulders square. Hold for a few seconds, then switch legs.</p>
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
            <h3>Exercise 9: Tuck Planche</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
            <p><strong>Instructions:</strong>Start in push-up position, hands slightly wider than shoulder-width. Lean forward, bending elbows slightly. Lift feet off ground, bringing knees towards chest, hold.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 9: Turkish Get-Up</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
            <p><strong>Instructions:</strong> Lie on back, hold kettlebell in one hand, arm extended towards ceiling. Roll onto side, then press body up onto opposite elbow. Push up onto hand, lift hips off ground, sweep leg under body, stand up.</p>
        <% } else { %>
            <h3>Exercise 9: Barbell Overhead Squat</h3>
            <p><strong>Time/Reps:</strong> 15 reps</p>
            <p><strong>Instructions:</strong> Hold barbell overhead with wide grip. Perform squat, keeping barbell stable overhead. Keep chest up and core engaged throughout movement.</p>
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
            <h3>Exercise 10: Dumbbell Renegade Row</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 15 reps</p>
            <p><strong>Instructions:</strong> Start in push-up position, each hand holding dumbbell. Perform push-up, then row one dumbbell towards hip, keeping hips stable. Lower dumbbell back to ground, repeat on other side.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 10: Hanging Windshield Wipers</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30 seconds</p>
            <p><strong>Instructions:</strong> Hang from pull-up bar with arms extended. Keeping legs straight, swing legs side to side, touching toes to each side.</p>
        <% } else { %>
            <h3>Exercise 10: Kettlebell Swing</h3>
            <p><strong>Time/Reps:</strong> 15 reps</p>
            <p><strong>Instructions:</strong> Stand with feet shoulder-width apart, hold kettlebell with both hands. Hinge at hips, swinging kettlebell between legs. Explosively drive hips</p>
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

