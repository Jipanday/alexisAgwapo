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
                response.sendRedirect("index.jsp");
            } else {
                // User is logged in, display the dashboard content
        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GYM BRO</title>
        <link rel="stylesheet" href="style.css">
    <!-- Your dashboard content here -->
    </head>
    <body>
    <!-- Add your dashboard content here -->
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
                                            <li><a href="Work.jsp">WorkOut <i class="ti-angle-down"></i></a>
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
            <div class="single_slider d-flex align-items-center slider_bg_1 overlay">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-12">
                            <div class="slider_text text-center">
                                <span>Build Up Your</span>
                                <h3>Body Shape</h3>
                                <p>Build Your Body and Fitness with Professional Touch</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- slider_area_end -->
    <!-- features_area_start  -->
    <div class="features_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title text-center mb-73">
                        <h3 class="custom-title">OUR FEATURES</h3>
                        <p class="custom-description">Our trainers will work with you to create a program that fits your lifestyle and helps you achieve maximum results.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="single_feature text-center mb-73">
                        <div class="icon">
                            <img src="/SemiDatabase/img/1.svg" alt="">
                        </div>
                        <h4>Weightlifting</h4>
                        <p>Build strength and muscle mass with our weightlifting equipment and personalized training programs.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single_feature text-center">
                        <div class="icon">
                            <img src="/SemiDatabase/img/2.svg" alt="">
                        </div>
                        <h4>Specific Muscles</h4>
                        <p>Target specific muscle groups with our wide range of machines and free weights.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single_feature text-center">
                        <div class="icon">
                            <img src="/SemiDatabase/img/3.svg" alt="">
                        </div>
                        <h4>Flex Your Muscles</h4>
                        <p>Enhance flexibility and mobility through our yoga and stretching classes.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single_feature text-center">
                        <div class="icon">
                            <img src="/SemiDatabase/img/4.svg" alt="">
                        </div>
                        <h4>Cardio Exercises</h4>
                        <p>Improve cardiovascular health and burn calories with our cardio machines and group classes.</p>
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