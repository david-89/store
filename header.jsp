<%-- 
    Document   : header
    Created on : Aug 7, 2016, 3:54:45 PM
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
        <title>JSP Page</title>
        <div id="headerPart">    
            <img src="${pageContext.request.contextPath}/logo/logo.jpg" id="logo" />
            <h2 class="onlineStoreTitle">Welcome to my Online store </h2>        
        </div>
    </head>    
</html>
