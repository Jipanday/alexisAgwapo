<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    // Check if the session exists and if the user is logged in
    session = request.getSession(false);
    if (session == null || session.getAttribute("email") == null) {
        // Redirect to login page if not logged in
        response.sendRedirect("index.jsp");
    } else {
        // User is logged in, display the dashboard content
%>
<!DOCTYPE html>
<html>
<head>
    <title>Fitness Form</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="exestyle.css">
    <script> 
        function showFilterOptions() {
            var gender = document.querySelector('select[name="gender"]').value;
            var level = document.querySelector('select[name="level"]').value;
            var goal = document.querySelector('select[name="plan"]').value;

            // Hide all filter options
            var filterOptions = document.querySelectorAll('.filter-option');
            filterOptions.forEach(function(option) {
                option.style.display = 'none';
            });

            // Show filter options based on criteria
            var filterId = 1;
            if (gender === 'Male') {
                if (level === 'Beginner' && goal === 'Weight Loss') {
                    filterId = 1;
                } else if (level === 'Intermediate' && goal === 'Weight Loss') {
                    filterId = 2;
                } else if (level === 'Advanced' && goal === 'Weight Loss') {
                    filterId = 3;
                } else if (level === 'Beginner' && goal === 'Height Gain') {
                    filterId = 4;
                } else if (level === 'Intermediate' && goal === 'Height Gain') {
                    filterId = 5;
                } else if (level === 'Advanced' && goal === 'Height Gain') {
                    filterId = 6;
                }
            } else if (gender === 'Female') {
                if (level === 'Beginner' && goal === 'Weight Loss') {
                    filterId = 7;
                } else if (level === 'Intermediate' && goal === 'Weight Loss') {
                    filterId = 8;
                } else if (level === 'Advanced' && goal === 'Weight Loss') {
                    filterId = 9;
                } else if (level === 'Beginner' && goal === 'Height Gain') {
                    filterId = 10;
                } else if (level === 'Intermediate' && goal === 'Height Gain') {
                    filterId = 11;
                } else if (level === 'Advanced' && goal === 'Height Gain') {
                    filterId = 12;
                }
            }

            // Show the selected filter option
            var selectedFilter = document.getElementById('filter' + filterId);
            if (selectedFilter) {
                selectedFilter.style.display = 'block';
            }
        }
    </script>
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
    <!-- Header -->

        <div class="landscape-header">
            <div>
                <h2>Select your gender:</h2>
                <div class="gender-select">
                    <select name="gender">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
            </div>
            <div>
                <h2>Select your fitness level:</h2>
                <select name="level">
                    <option value="Beginner">Beginner</option>
                    <option value="Intermediate">Intermediate</option>
                    <option value="Advanced">Advanced</option>
                </select>
            </div>
            <div>
                <h2>Select your fitness goal:</h2>
                <select name="plan">
                    <option value="Weight Loss">Weight Loss</option>
                    <option value="Height Gain">Height Gain</option>
                </select>
            </div>
        </div>
        <div class="generate-button">
            <button onclick="showFilterOptions()">Generate</button>
        </div>
    
    <div class="filter-container">
        <div class="filter-options">
            <div class="filter-option blue-border" id="filter1" onclick="submitForm('exe1.jsp')">Beginner <br> Lose Weight</div>
            <div class="filter-option blue-border" id="filter2" onclick="submitForm('exe2.jsp')">Intermediate <br> Lose Weight</div>
            <div class="filter-option blue-border" id="filter3" onclick="submitForm('exe3.jsp')">Advanced <br> Lose Weight</div>
            <div class="filter-option blue-border" id="filter4" onclick="submitForm('exe4.jsp')">Beginner <br> Gain Height</div>
            <div class="filter-option blue-border" id="filter5" onclick="submitForm('exe5.jsp')">Intermediate <br> Gain Height</div>
            <div class="filter-option blue-border" id="filter6" onclick="submitForm('exe6.jsp')">Advanced <br> Gain Height</div>
            <div class="filter-option pink-border" id="filter7" onclick="submitForm('exe7.jsp')">Beginner <br> Lose Weight</div>
            <div class="filter-option pink-border" id="filter8" onclick="submitForm('exe8.jsp')">Intermediate <br> Lose Weight</div>
            <div class="filter-option pink-border" id="filter9" onclick="submitForm('exe9.jsp')">Advanced <br> Lose Weight</div>
            <div class="filter-option pink-border" id="filter10" onclick="submitForm('exe10.jsp')">Beginner <br> Gain Height</div>
            <div class="filter-option pink-border" id="filter11" onclick="submitForm('exe11.jsp')">Intermediate <br> Gain Height</div>
            <div class="filter-option pink-border" id="filter12" onclick="submitForm('exe12.jsp')">Advanced <br> Gain Height</div>
        </div>
    </div>
    <form id="fitnessForm" method="get" action="recordData.jsp" style="display:none;">
        <input type="hidden" name="gender" id="genderInput">
        <input type="hidden" name="level" id="levelInput">
        <input type="hidden" name="goal" id="goalInput">
        <input type="hidden" name="redirectUrl" id="redirectUrl">
    </form>
    <script>
        function submitForm(redirectUrl) {
            document.getElementById('genderInput').value = document.querySelector('select[name="gender"]').value;
            document.getElementById('levelInput').value = document.querySelector('select[name="level"]').value;
            document.getElementById('goalInput').value = document.querySelector('select[name="plan"]').value;
            document.getElementById('redirectUrl').value = redirectUrl;

            document.getElementById('fitnessForm').submit();
        }
    </script>
    <br> <br>
</body>
</html>
<%
    }
%>
