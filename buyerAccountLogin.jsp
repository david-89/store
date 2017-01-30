<%-- 
    Document   : buyerAccountLogin
    Created on : Jun 30, 2016, 11:44:15 PM
    Author     : David
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
        <title>Buyer account</title>
    </head>
    <body>
        
        <%
            String id = request.getParameter("id"); 
            id = id.replace(".jsp", ""); 
        %>
            <div class="loginForm">
                <h3 class="formHeader">Login as a Buyer</h3>
        <form:form action="LoginBuyer" method="post" commandName="buyerModel">
            Username: <form:input class="inputField" type="text" name="username" path="username" required="true"/><br>
            Password:&nbsp; <form:input class="inputField" type="password" name="password" path="password" required="true"/><br>
            <form:hidden name="buyerId" path="buyerId" />  
            <input type="hidden" name="id" value="<%=id%>" />   
            <input class="loginButton" type="submit" value="Login" /> 
            <div id="notRegisteredYet">
                <a href="registerBuyer">Not registered yet? Register here</a>
            </div>
        </form:form> 
            </div><!--end of login form --><br><br><br><br>
            <div class="logRegLinks">
                <div>
                <a href="adminAccountLogin">Login as an Admin</a>
                </div>
                <div>
                    <a href="search">Go to online store homepage</a>
                </div>
            </div> <!--end of logRegLinks -->
        <%@include file="footer.jsp" %>
    </body> 
</html>
