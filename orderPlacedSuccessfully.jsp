<%-- 
    Document   : orderPlacedSuccessfully
    Created on : Aug 22, 2016, 4:31:51 PM
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order placed</title>
    </head>
    <body>
        <%
          if (session.getAttribute("logged") != null && session.getAttribute("logged").equals(true)) {  
              
        %>
        <h2>Order placed successfully</h2>
        <div class="logRegLinks">
            <div>
                <a href="adminAccountLogin">Login as an Admin</a>
            </div>       
            <div>
                <a href="search">Go to online store homepage</a>
            </div>
        </div> <!--end of logRegLinks -->
        <%@include file="footer.jsp" %>
        <% } else { %>
        <h2> You are not logged into your account! Please login first.</h2>
        <div>
            <a href="search">Back to homepage</a>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <% } %>
        <%@include file="footer.jsp" %>
    </body>
</html>
