<%-- 
    Document   : searchResults
    Created on : Jul 21, 2016, 11:40:52 AM
    Author     : David
--%>
<%@page import="java.util.Map"%>
<%@page import="locale.Localization"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
        <title>Search results</title>
    </head>
    <body>
        <h2 class="formHeader">Search results</h2>
        <div id="allItems">
            <c:forEach items="${productModels}" var="productModel">
                <div id="searchResultItem">
                    <tr>
                    <a href="productPage?id=${productModel.productId}" >
                        <td>
                            <img src="${productModel["image1"]}" width="150" height="150" />&nbsp; &nbsp;
                        </td> 
                        <td>
                            ${productModel["productName"]}
                        </td>          
                    </a>
                    </tr><br>
                </div><!--end of search results div-->
            </c:forEach>
        </div><!---end of allItems -->
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
