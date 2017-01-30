<%-- 
    Document   : registerSeller
    Created on : Jun 28, 2016, 11:15:49 AM
    Author     : David
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register admin</title>
    </head>
    <body>
        <h2>Register admin</h2>
        <form:form action="registerAdmin" method="post" commandName="adminModel" >
            Name: <form:input path="adminName" /><br>
            Email: <form:input path="adminEmail" /><br>
            User: <form:input path="username" /><br>
            Password: <form:password path="password" /><br> 
            <input type="submit" value="Register" />
        </form:form>
    </body>
</html>
