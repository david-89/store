<%-- 
    Document   : uploadImages
    Created on : Jul 11, 2016, 9:49:37 PM
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload images</title>
           <link href="<c:url value="css/main.css" />" rel="stylesheet">
    </head>
    <body>
        <div id="headerPart">
            <img src="logo/logo.jpg" id="logo" />
            <h2 class="onlineStoreTitle"> Admin account </h2>
        </div>
        <%@include file="navigation.jsp" %>
        <h2 class="formHeader"> Choose an image </h2>
        <form id="uploadImgForm" action="UploadImages" enctype="multipart/form-data" method="post">
                Image: <input type="file" name="image1" /><br>
                <input class="loginButton" type="submit" value="Upload product" /><br>
        </form>
    </body>
</html>
