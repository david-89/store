<%-- 
    Document   : sellerAccountLogin
    Created on : Jun 30, 2016, 12:04:52 AM
    Author     : David
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin login</title>
    </head>
    <body>

        <div class="loginForm">
            <h3 class="formHeader">Login as an admin</h3>
            <form:form action="LoginAdmin" method="post" commandName="adminModel">
                Username: <form:input class="inputField" type="text" name="username" path="username" /><br>
                Password: &nbsp;<form:input class="inputField" type="password" name="password" path="password" /><br>
                <input class="loginButton" type="submit" value="Login" />
            </form:form>
        </div><!--end of login form-->
        <div class="logRegLinks">
            <div>
                <a href="adminAccountLogin">Login as an Admin</a>
            </div>
            <div>
                <a href="registerBuyer">Buy on Online Store - Register as a buyer</a>
            </div>
            <div>
                <a href="search">Go to online store homepage</a>
            </div>
        </div> <!--end of logRegLinks -->
        <%@include file="footer.jsp" %>
    </body>
</html>
