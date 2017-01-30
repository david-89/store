<%-- 
    Document   : homePage
    Created on : Jun 30, 2016, 12:03:44 AM
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
    </head>
    <body>
        <div id="headerPart">    
            <img src="logo/logo.jpg" id="logo" />
            <h2 class="onlineStoreTitle">  Welcome to your admin account </h2>       
        </div>
        
        <%
          if (session.getAttribute("logged") != null && session.getAttribute("logged").equals(true)) {  
              session.setMaxInactiveInterval(600);   
        %>    
        
        <%@include file="navigation.jsp" %>            
        <div class="logRegLinks">        
            <div>
                <a href="registerBuyer">Buy on Online Store - Register as a buyer</a>
            </div>
                <div>
                <a href="search">Go to online store homepage</a>
            </div>
        </div> <!--end of logRegLinks -->        
        <% } else { %>
        <h2> You are not logged into your account! Please login first.</h2>
        <div>
            <a href="adminAccountLogin">Back to login page</a>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <% } %>        
        <%@include file="footer.jsp" %>  
    </body>
</html>
