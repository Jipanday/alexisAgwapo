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
                                            <li><a href="Contact.jsp">Contact</a></li>
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
                                <span>KNOW YOUR</span>
                                <h3>MACRONUTRIENT</h3>
                                <p>Fuel your body, fuel your life! </p>
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
                            MACRO CALCULATOR
                        </h1>
                    </div>
                </div>
                <div class="calculator">
                    <h2 class="text-center calculator-title">Enter Your Details</h2>
                    <hr class="calculator-hr">
                    <form action="Macro.jsp" method="post">
                        <div class="field">
                            <label for="calorieInput">Enter your daily calorie intake:</label>
                            <input type="text" id="calorieInput" name="calories" required>
                        </div>
                        <div class="field">
                            <label for="mealInput">Enter the number of meals per day:</label>
                            <input type="text" id="mealInput" name="meals" required>
                        </div>
                        <div class="field">
                            <label for="ratioSelect">Choose your macronutrient ratio:</label>
                            <select id="ratioSelect" name="ratio">
                                <option value="High Carb (60/25/15)">High Carb (60/25/15)</option>
                                <option value="Moderate (50/30/20)">Moderate (50/30/20)</option>
                                <option value="Zone Diet (40/30/20)">Zone Diet (40/30/20)</option>
                                <option value="Low Carb (25/45/30)">Low Carb (25/45/30)</option>
                            </select>
                        </div>
                        <div class="submit">
                            <input type="submit" value="Calculate">
                        </div>
                    </form>
    <h1>Results</h1>
    <%
        String caloriesParam = request.getParameter("calories");
        String mealsParam = request.getParameter("meals");
        String selectedRatio = request.getParameter("ratio");
        
        if (caloriesParam != null && mealsParam != null && selectedRatio != null) {
            double calories = Double.parseDouble(caloriesParam);
            int meals = Integer.parseInt(mealsParam);

            double carbRatio = 0, proteinRatio = 0, fatRatio = 0;
            switch (selectedRatio) {
                case "High Carb (60/25/15)":
                    carbRatio = 0.60;
                    proteinRatio = 0.25;
                    fatRatio = 0.15;
                    break;
                case "Moderate (50/30/20)":
                    carbRatio = 0.50;
                    proteinRatio = 0.30;
                    fatRatio = 0.20;
                    break;
                case "Zone Diet (40/30/20)":
                    carbRatio = 0.40;
                    proteinRatio = 0.30;
                    fatRatio = 0.20;
                    break;
                case "Low Carb (25/45/30)":
                    carbRatio = 0.25;
                    proteinRatio = 0.45;
                    fatRatio = 0.30;
                    break;
                default:
                    out.println("Invalid selection. Exiting program.");
                    return;
            }

            double carbGrams = calories * carbRatio;
            double proteinGrams = calories * proteinRatio;
            double fatGrams = calories * fatRatio;

            double carbPerMeal = carbGrams / meals;
            double proteinPerMeal = proteinGrams / meals;
            double fatPerMeal = fatGrams / meals;

            // Display results
    %>
            <p>Macronutrient Distribution:</p>
            <p>Carbohydrates: <%= String.format("%.2f grams/day (%.2f grams/meal)", carbGrams, carbPerMeal) %></p>
            <p>Protein: <%= String.format("%.2f grams/day (%.2f grams/meal)", proteinGrams, proteinPerMeal) %></p>
            <p>Fats: <%= String.format("%.2f grams/day (%.2f grams/meal)", fatGrams, fatPerMeal) %></p>
    <%
        } else {
            out.println("<p>Missing parameter. Please fill in all fields.</p>");
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