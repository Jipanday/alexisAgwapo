<%-- 
    Document   : exe9
    Created on : Jun 8, 2024, 3:03:18 PM
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
    <title>15-Day Beginner Weight Loss Workout</title>
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
                        <h3>Exercise 1: Pull-Ups</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 6-10 reps</p>
                        <p><strong>Instructions:</strong>  Grip the pull-up bar with your palms facing away from you. Hang with your arms fully extended. Pull yourself up until your chin is above the bar. Lower yourself back down with control.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 1: Push-Up Variations (Archer Push-Ups)</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 8-12 reps each side</p>
                        <p><strong>Instructions:</strong> Get into a standard push-up position. As you lower your body, extend one arm out to the side while keeping the other arm bent. Push back up and switch sides.</p>
                    <% } else { %>
                        <h3>Exercise 1: Handstand Push-Ups</h3>
                        <p><strong>Time/Reps:</strong>  3 sets of 5-8 reps</p>
                        <p><strong>Instructions:</strong>  Kick up into a handstand against a wall. Lower your head to the ground by bending your elbows, then push back up to the starting position.</p>
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
                        <h3>Exercise 2: Dips</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10-15 reps</p>
                        <p><strong>Instructions:</strong> Position yourself between parallel bars. Lower your body until your shoulders are below your elbows, then push back up.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 2: Barbell Bench Press</h3>
                        <p><strong>Time/Reps:</strong>  4 sets of 8-12 reps</p>
                        <p><strong>Instructions:</strong>Lie flat on a bench with a barbell above your chest. Lower the barbell to your chest, then push it back up to the starting position.</p>
                    <% } else { %>
                        <h3>Exercise 2:Barbell Back Squats</h3>
                        <p><strong>Time/Reps:</strong> Barbell Back Squats</p>
                        <p><strong>Instructions:</strong> Stand with feet shoulder-width apart and a barbell across your upper back. Lower your body by bending your knees and hips until your thighs are parallel to the floor. Push back up to the starting position.</p>
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
                        <h3>Exercise 3: Bulgarian Split Squats</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10-12 reps each leg</p>
                        <p><strong>Instructions:</strong> Stand a few feet in front of a bench, with one foot resting on the bench behind you. Lower your body until your front thigh is parallel to the floor. Push back up to the starting position.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 3: Deadlifts</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 6-10 reps</p>
                        <p><strong>Instructions:</strong>  Stand with feet hip-width apart and a barbell in front of you. Bend at your hips and knees to grasp the barbell. Lift the bar by extending your hips and knees to stand up straight. Lower it back to the ground with control.</p>
                    <% } else { %>
                        <h3>Exercise 3: Pistol Squats</h3>
                        <p><strong>Time/Reps:</strong>  3 sets of 6-10 reps each leg</p>
                        <p><strong>Instructions:</strong>  Stand on one leg with the other leg extended in front of you. Lower your body into a squat on one leg, keeping the extended leg off the ground. Push back up to the starting position.</p>
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
                        <h3>Exercise 4: Hip Thrusts</h3>
                        <p><strong>Time/Reps:</strong> 4 sets of 10-15 reps</p>
                        <p><strong>Instructions:</strong> Sit on the ground with your upper back resting on a bench and a barbell across your hips. Thrust your hips upward, squeezing your glutes at the top. Lower your hips back down.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 4: Dragon Flags</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 6-8 reps</p>
                        <p><strong>Instructions:</strong> Lie on a bench and hold onto the sides. Lift your legs and hips towards the ceiling, then lower them back down with control without touching the bench.</p>
                    <% } else { %>
                        <h3>Exercise 4: L-Sit</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 15-30 seconds</p>
                        <p><strong>Instructions:</strong> Sit on the ground with legs extended in front. Place your hands on the ground beside your hips and lift your body, keeping legs straight and off the ground.</p>
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
                        <h3>Exercise 5: Hanging Leg Raises</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10-15 reps</p>
                        <p><strong>Instructions:</strong> Hang from a pull-up bar. Lift your legs straight up until they are parallel to the ground, then lower them back down.</p>
                    <% } else if (currentDay <= 10) { %>
                        <h3>Exercise 5: Ab Rollouts</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 10-12 reps</p>
                        <p><strong>Instructions:</strong>  Kneel on the ground with an ab wheel in front of you. Roll the wheel forward until your body is fully extended, then roll it back to the starting position.</p>
                    <% } else { %>
                        <h3>Exercise 5: Plank with Arm/Leg Lift</h3>
                        <p><strong>Time/Reps:</strong> 3 sets of 12-15 reps each side</p>
                        <p><strong>Instructions:</strong>  Get into a plank position. Lift one arm and the opposite leg, hold for a moment, then switch sides.</p>
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
            <h3>Exercise 6: Burpee Pull-Ups</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 8-12 reps</p>
            <p><strong>Instructions:</strong> Perform a burpee with a jump at the end, grabbing a pull-up bar and doing a pull-up. Return to the ground and repeat.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 6: Clean and Press</h3>
            <p><strong>Time/Reps:</strong> 4 sets of 6-8 reps</p>
            <p><strong>Instructions:</strong>  Stand with a barbell at your feet. Lift the bar to your shoulders (clean), then press it overhead. Lower it back to your shoulders, then to the ground.</p>
        <% } else { %>
            <h3>Exercise 6: Kettlebell Swings</h3>
            <p><strong>Time/Reps:</strong>  3 sets of 15-20 reps</p>
            <p><strong>Instructions:</strong> Stand with feet shoulder-width apart, holding a kettlebell with both hands. Swing the kettlebell between your legs, then drive your hips forward to swing it up to shoulder height.</p>
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
            <h3>Exercise 7: Renegade Rows</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10-12 reps each side</p>
            <p><strong>Instructions:</strong>  Get into a plank position with a dumbbell in each hand. Row one dumbbell to your side while balancing on the other hand, then switch sides.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 7: Thrusters</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 12-15 reps</p>
            <p><strong>Instructions:</strong> Hold a pair of dumbbells at your shoulders. Squat down, then stand up and press the dumbbells overhead in one fluid motion.</p>
        <% } else { %>
            <h3>Exercise 7:Box Jumps</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 15-20 reps</p>
            <p><strong>Instructions:</strong>  Stand in front of a sturdy box or platform. Jump onto the box, landing softly, then step back down.</p>
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
            <h3>Exercise 8: Battle Ropes</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 30-45 seconds</p>
            <p><strong>Instructions:</strong> Hold the ends of the battle ropes in each hand. Move your arms up and down rapidly to create waves in the ropes.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 8: Sled Push/Pull</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 20-30 meters each direction</p>
            <p><strong>Instructions:</strong> Load a sled with weights. Push the sled across the floor as fast as possible, then pull it back to the starting position.</p>
        <% } else { %>
            <h3>Exercise 8: Jump Rope Double Unders</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 20-30 reps</p>
            <p><strong>Instructions:</strong> Jump rope, passing the rope under your feet twice with each jump.</p>
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
            <h3>Exercise 9: Rowing Machine Intervals</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 5 minutes</p>
            <p><strong>Instructions:</strong> Row at maximum effort for 1 minute, then rest for 1 minute. Repeat for the duration of the workout.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 9: Pike Push-Ups</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 10-12 reps</p>
            <p><strong>Instructions:</strong> Get into a downward dog position. Lower your head to the ground by bending your elbows, then push back up.</p>
        <% } else { %>
            <h3>Exercise 9: Deep Squat Hold</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 1-2 minutes</p>
            <p><strong>Instructions:</strong> Squat as low as you can go, holding the position with your heels on the ground.</p>
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
            <h3>Exercise 10: Bridge Pose</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 1-2 minutes</p>
            <p><strong>Instructions:</strong>  Lie on your back with knees bent and feet flat on the ground. Lift your hips towards the ceiling, squeezing your glutes and holding the position.</p>
        <% } else if (currentDay <= 10) { %>
            <h3>Exercise 10: Wall Walks</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 5-8 reps</p>
            <p><strong>Instructions:</strong> Start in a plank position with your feet against a wall. Walk your feet up the wall while walking your hands towards the wall until you are in a handstand position, then walk back down.</p>
        <% } else { %>
            <h3>Exercise 10: Scorpion Stretch</h3>
            <p><strong>Time/Reps:</strong> 3 sets of 1 minute each side</p>
            <p><strong>Instructions:</strong>  Lie face down with arms extended out to the sides. Lift one leg and rotate it across your body to touch the ground on the opposite side, stretching your lower back and hips. Return to the start and switch sides.</p>
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

