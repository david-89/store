<%-- 
    Document   : welcomePage
    Created on : Aug 23, 2016, 5:29:36 PM
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link href="<c:url value="/css/main.css" />" rel="stylesheet">
    </head>
    <body>
        <div id="getStarted">
            <form action="${pageContext.request.contextPath}/search">
                <input id="getStartedButton" type="submit" value="Get started" />
            </form>
        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="footer.jsp" %>
    </body>
</html>
