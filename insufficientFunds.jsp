<%-- 
    Document   : insufficientFunds
    Created on : Aug 2, 2016, 3:54:27 PM
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insufficient funds</title>
         <link href="<c:url value="css/main.css" />" rel="stylesheet">
    </head>
    <body>
        <h2>You have insufficient funds in your account </h2>
        <div class="logRegLinks">
            <div>
                <a href="adminAccountLogin">Login as an Admin</a>
            </div>
            <div>
                <a href="search">Go to online store homepage</a>
            </div>
        </div><!--end of logRegLinks -->
        <%@include file="footer.jsp" %>
    </body>
</html>
