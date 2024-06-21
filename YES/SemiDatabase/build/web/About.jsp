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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GYM BRO</title>
        <link rel="stylesheet" href="style.css">
        <style>
              .team_area{
            background-color: black; /* Set the background color to black */
            color: white; /* Ensure text is visible on the black background */
        }
        
  .single_team {
    position: relative;
    overflow: hidden;
    margin: 13px; /* Add margin to create space between each element */
}

.team_thumb {
    position: relative;
}

.team_hover {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.8); /* Black background with 80% opacity */
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
}

.single_team:hover .team_hover {
    opacity: 1;
}

.hover_inner {
    text-align: center;
    padding: 20px; /* Add padding for spacing inside the hover box */
}

.hover_inner ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.hover_inner ul li {
    display: inline-block;
    margin: 0 15px; /* Increase margin for more spacing between items */
}

.hover_inner ul li a {
    color: #fff;
    font-size: 20px;
    transition: color 0.3s ease;
}

.hover_inner ul li a:hover {
    color: #ff6347; /* Change this to any color you prefer */
}

.team_title {
    margin-top: 20px;
    padding: 10px; /* Add padding for spacing below the title */
}


        </style>
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
            <div class="single_slider d-flex align-items-center slider_bg_1 overlay">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-12">
                            <div class="slider_text text-center">
                                <h3><b>ABOUT</b></h3>
                                <p>Welcome to GYM BRO, where your fitness journey becomes an exhilarating adventure! 
                                   We are more than just a gym – we are a community dedicated to helping you achieve your 
                                   health and wellness goals. Located in the heart of Tagbilaran City, our state-of-the-art facility 
                                   provides everything you need to transform your body and mind.</p>
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
                <div class="col-xl-12" style="margin-right: 5%">
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
  
        <div class="team_area team_bg_1 overlay2">
            <div class="container">
                <div class="row"
                     <div class="Train" style="background-color: black; margin-right:15% ">
                                <div class="section_title text-center mb-73">
                                    <h3>Our Trainers</h3>
                                    <p>There are many variations of passages of lorem Ipsum available, but the majority <br> have suffered alteration.</p>
                                </div>
                            </div>
            </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single_team">
                            <div class="team_thumb">
                                <img src="/SemiDatabase/img/1.png" alt="">
                                <div class="team_hover">
                                    <div class="hover_inner text-center">
                                        <ul>
                                            <li><a href="#"> <i class="fa fa-facebook"></i> </a></li>
                                            <li><a href="#"> <i class="fa fa-twitter"></i> </a></li>
                                            <li><a href="#"> <i class="fa fa-instagram"></i> </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="team_title text-center">
                                <h3>Jessica Mino</h3>
                                <p>Woman Trainer</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single_team">
                            <div class="team_thumb">
                                <img src="/SemiDatabase/img/alex.jpeg" alt="" width="400px" height="423px">
                                <div class="team_hover">
                                    <div class="hover_inner text-center">
                                        <ul>
                                            <li><a href="#"> <i class="fa fa-facebook"></i> </a></li>
                                            <li><a href="#"> <i class="fa fa-twitter"></i> </a></li>
                                            <li><a href="#"> <i class="fa fa-instagram"></i> </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="team_title text-center">
                                <h3>Alexis Aguaiva</h3>
                                <p>Child-Predator</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single_team">
                            <div class="team_thumb">
                                <img src="/SemiDatabase/img/3.png" alt="">
                                <div class="team_hover">
                                    <div class="hover_inner text-center">
                                        <ul>
                                            <li><a href="#"> <i class="fa fa-facebook"></i> </a></li>
                                            <li><a href="#"> <i class="fa fa-twitter"></i> </a></li>
                                            <li><a href="#"> <i class="fa fa-instagram"></i> </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="team_title text-center">
                                <h3>Paulo Rolac</h3>
                                <p>Men Trainer</p>
                            </div>
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