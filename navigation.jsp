<%-- 
    Document   : navigation
    Created on : Aug 9, 2016, 8:52:37 PM
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
    </head>
    <body>
        <div class="nav">
            <ul>
                <li>
                    <a href="homePageAdmin" >Home </a>
                </li>
                <li>
                    <a href="uploadProduct">Upload a product</a>
                </li>
                <li>
                    <a href="inventory" >Inventory</a>
                </li>
                <li>
                    <a href="orderList" >Orders</a>
                </li>
                <li>
                    <a href="logoutAdmin" >Logout</a>
                </li>
            </ul>
        </div>
    </body>
</html>
