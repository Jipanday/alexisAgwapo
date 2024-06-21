<%-- 
    Document   : logout
    Created on : Jun 10, 2024, 10:31:21 AM
    Author     : marxa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("index.jsp"); // Redirect to your login page
%>

