<%-- 
    Document   : OnlineStoreHomepage
    Created on : Jun 28, 2016, 6:51:22 PM
    Author     : David
--%>
<%@page import="java.util.Map"%>
<%@page import="locale.Localization"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
        <link href="<c:url value="/css/main.css" />" rel="stylesheet">
    </head>
    <body>
        
        <%
                Localization loc = new Localization();
                String language = request.getParameter("lang");
                Map<String, String> resourceMap = loc.getLocale(language);
                
                if (language == null) {
                    resourceMap = loc.getLocale("en");
                }
                
                request.setAttribute("resources", resourceMap);
        %> 
        
        <div class="searchBar">
            <form:form name="searchForm" method="post" commandName="productModel" action="searchResults" >  
                <form:input class="searchField" type="text" name="productName" path="productName" />&nbsp;&nbsp;
                <input class="searchButton" type="submit" value="${resources['Search']}" />
            </form:form> 
        </div><!--end of search bar-->
        <div id="langBar">
            <li><a href="?lang=en">English</a><span class="flagImg"><img src="${pageContext.request.contextPath}/flags/united_kingdom_flag.png" width="30" height="18" /></span></li>
                <li><a href="?lang=sr">Srpski</a><span class="flagImg"><img src="${pageContext.request.contextPath}/flags/serbian-flag.jpg" width="30" height="18" /></span></li>
                <li><a href="?lang=fr">Français</a><span class="flagImg"><img src="${pageContext.request.contextPath}/flags/french-flag.png" width="30" height="18" /></span></li> 
        </div>
        <div class="logRegLinks">
            <div>
                <a href="adminAccountLogin">${resources['Login as an Admin']}</a>
            </div>
            <div>
                <a href="registerBuyer">${resources['Buy on Online Store - Register as a buyer']}</a>
            </div>
        </div> <!--end of logRegLinks -->
        <%@include file="footer.jsp" %>
    </body>
</html>
