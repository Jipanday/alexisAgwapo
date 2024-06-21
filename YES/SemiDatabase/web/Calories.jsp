<%-- 
    Document   : home
    Created on : May 28, 2024, 9:32:13 PM
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

<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GYM BRO</title>
        <link rel="stylesheet" href="style.css">
   
    </head>
    <body>
         <header>
        <div class="header-area">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-2">
                                <div class="logo">
                                    <a href="home.jsp">
                                        <img src="/SemiDatabase/img/GYM-BRO.png" alt="GYM BRO Logo" height="80px" width="200px">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-9 col-lg-10">
                                <div class="main-menu d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="home.jsp">Home</a></li>
                                            <li><a href="About.jsp">About</a></li>
                                            <li><a href="#">WorkOut <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="Work.jsp">My WorkOut</a></li>
                                                </ul>
                                            </li>
                                            <li><a class="dropdown-toggle">Generator <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="Calories.jsp">Calorie Generator</a></li>
                                                    <li><a href="Macro.jsp">Macro Calculator</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="Contact.html">Contact</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="settings">
                                <a href="settings.jsp">
                                    <img src="https://i.pinimg.com/564x/87/50/3b/87503bdaec2f55b4cd5a7e2cea489ae9.jpg" alt="settings" height="50px" width="50px">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->

    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider d-flex align-items-center slider_bg_2 overlay">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-12">
                            <div class="slider_text text-center">
                                <span>MEASURE YOUR</span>
                                <h3>CALORIES</h3>
                                <p>Burn calories, not dreams.</p>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- slider_area_end -->
    <!-- features_area_start  -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="bmi-calculator">
                    <div class="result">
                        <div class="result-text">
                            <h1>
                                CALORIE CALCULATOR
                            </h1>
                        </div>
                    </div>
                    <div class="calculator">
                        <h2 class="text-center calculator-title">Enter Your Details</h2>
                        <hr class="calculator-hr">
                        <form action="Calories.jsp" method="post">
                            <div class="field">
                                <label for="age">Age (years):</label>
                                <input type="text" id="age" name="age" required>
                            </div>
                            <div class="field">
                                <label for="weight">Weight (kg):</label>
                                <input type="text" id="weight" name="weight" required>
                            </div>
                            <div class="field">
                                <label for="height">Height (cm):</label>
                                <input type="text" id="height" name="height" required>
                            </div>
                            <div class="field">
                                <label for="sex">Sex:</label>
                                <select id="sex" name="sex" required>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>
                            <div class="field">
                                <label for="activity">Activity Level:</label>
                                <select id="activity" name="activity" required>
                                    <option value="1.2">Little to no exercise</option>
                                    <option value="1.375">Exercise 1-3 times a week</option>
                                    <option value="1.55">Exercise 4-5 times a week</option>
                                    <option value="1.725">Exercise daily</option>
                                    <option value="1.9">Exercise twice a day</option>
                                </select>
                            </div>
                            <div class="submit">
                                <input type="submit" value="Calculate">
                            </div>
                        </form>
                        <h1>Results</h1>
                        <%
                            try {
                                // Retrieve user inputs from the form
                                String ageStr = request.getParameter("age");
                                String weightStr = request.getParameter("weight");
                                String heightStr = request.getParameter("height");
                                String sex = request.getParameter("sex");
                                String activityStr = request.getParameter("activity");

                                // Check if any parameter is null
                                if (ageStr == null || weightStr == null || heightStr == null || sex == null || activityStr == null) {
                                    throw new IllegalArgumentException("All fields are required.");
                                }

                                // Parse the inputs
                                int age = Integer.parseInt(ageStr);
                                double weight = Double.parseDouble(weightStr);
                                double height = Double.parseDouble(heightStr);
                                double activityLevel = Double.parseDouble(activityStr);

                                // Calculate BMR based on sex
                                double bmr;
                                if ("male".equalsIgnoreCase(sex)) {
                                    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
                                } else if ("female".equalsIgnoreCase(sex)) {
                                    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
                                } else {
                                    throw new IllegalArgumentException("Invalid sex value.");
                                }

                                // Calculate TDEE based on activity level
                                double tdee = bmr * activityLevel;

                                // Format the output
                                DecimalFormat df = new DecimalFormat("#.##");

                                // Create the message to display
                                String message = "Generated Information:<br>"
                                        + "Age: " + age + " years<br>"
                                        + "Weight: " + df.format(weight) + " kg<br>"
                                        + "Height: " + df.format(height) + " cm<br>"
                                        + "Sex: " + sex + "<br>"
                                        + "Activity Level: " + activityStr + "<br><br>"
                                        + "You would have to consume:<br>"
                                        + "Basal Metabolic Rate (BMR): " + df.format(bmr) + " calories/day<br>"
                                        + "Total Daily Energy Expenditure (TDEE): " + df.format(tdee) + " calories/day";

                                out.println("<p>" + message + "</p>");
                            } catch (NumberFormatException e) {
                                out.println("<p style='color: red;'>Invalid input format. Please enter numeric values for age, weight, and height.</p>");
                            } catch (IllegalArgumentException e) {
                                out.println("<p style='color: red;'>" + e.getMessage() + "</p>");
                            } catch (Exception e) {
                                out.println("<p style='color: red;'>An unexpected error occurred: " + e.getMessage() + "</p>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer_start  -->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-md-6 col-lg-3 ">
                        <div class="footer_info">
                            <div class="footer_logo">
                                <a href="#">
                                    <img src="/SemiDatabase/img/GYM-BRO.png" alt="" height="80px" width="200px">
                                </a>
                            </div>
                            <p>Philippines, Bohol, Tagbilaran City <br> CPG Ubujan Manga-1782 <br>
                                <a href="#">+10 328 185 3589</a> <br>
                                <a href="#">gymbro@gmail.com</a>
                            </p>
                        </div>
                    </div>      
                </div>
            </div>
        </div>
    </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script href="script.js">
            // JavaScript for dynamically adding feature items

document.addEventListener('DOMContentLoaded', function() {
    var featuresRow = document.querySelector('.features_row');
    var featuresData = [
        {
            icon: '/SemiDatabase/img/1.svg',
            title: 'Weightlifting',
            description: 'There are many variations of passages of lorem Ipsum available.'
        },
        {
            icon: 'SemiDatabase/img/2.svg',
            title: 'Specific Muscles',
            description: 'There are many variations of passages of lorem Ipsum available.'
        },
        {
            icon: 'SemiDatabase/img/3.svg',
            title: 'Flex Your Muscles',
            description: 'There are many variations of passages of lorem Ipsum available.'
        },
        {
            icon: 'SemiDatabase/img/4.svg',
            title: 'Cardio Exercises',
            description: 'There are many variations of passages of lorem Ipsum available.'
        }
    ];

    featuresData.forEach(function(feature) {
        var featureItem = document.createElement('div');
        featureItem.classList.add('col-lg-3', 'col-md-6', 'single_feature', 'text-center');
        featureItem.innerHTML = `
            <div class="icon">
                <img src="${feature.icon}" alt="">
            </div>
            <h4>${feature.title}</h4>
            <p>${feature.description}</p>
        `;
        featuresRow.appendChild(featureItem);
    });
});

        </script>
    </body>
</html>
<%
    }
%>