<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dynamic Navbar</title>
    <style>
        /* Basic styling for the navbar */
        .navbar {
            display: flex;
            background-color: #333;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        /* Styling for the image section */
        .image-section {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        .image-section img {
            width: 200px;
            height: 200px;
            cursor: pointer;
            border: 2px solid #333;
            border-radius: 10px;
        }
        .image-section img:hover {
            border-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="home.jsp">Home</a>
        <c:if test="${not empty sessionScope.gender}">
            <a href="gender.jsp">${sessionScope.gender}</a>
        </c:if>
        <c:if test="${not empty sessionScope.fitnessLevel}">
            <a href="fitnessLevel.jsp">${sessionScope.fitnessLevel}</a>
        </c:if>
        <c:if test="${not empty sessionScope.fitnessGoal}">
            <a href="fitnessGoal.jsp">${sessionScope.fitnessGoal}</a>
        </c:if>
    </div>

    <div class="image-section">
        <a href="link1.jsp"><img src="100.jpg" alt="Image 1"></a>
        <a href="link2.jsp"><img src="200.jpg" alt="Image 2"></a>
        <a href="link3.jsp"><img src="300.jpg" alt="Image 3"></a>
    </div>
    
    <!-- Include other page content here -->
</body>
</html>
