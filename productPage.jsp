<%-- 
    Document   : productPage
    Created on : Jun 17, 2016, 4:49:57 PM
    Author     : David
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product page</title>
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
    </head>
    <body>
    <div class="searchBar">
        <form:form name="searchForm" method="post" commandName="productModel" action="search" >  
            <form:input class="searchField" type="text" name="productName" path="productName" />&nbsp;&nbsp;
            <input class="searchButton" type="submit" value="Search" />
        </form:form>
    </div><!--div-->
    <h2>Product details</h2>
    <div id="productName">${productModel["productName"]}</div>
    <div class="productDetails"> Category: ${productModel["category"]}</div>
    <img id="productImage" src="${productModel["image1"]}" width="350" height="350" /> &nbsp;&nbsp;
    <div id="bulletPoints">
        <li>${productModel["bullet1"]}</li>
        <li>${productModel["bullet2"]}</li>
        <li>${productModel["bullet3"]}</li>
    </div><!--end of bullet points --->
    <div id="buyBtn">
        <a href="LoginBuyer?id=${productModel['productId']}.jsp" >BUY</a>
    </div>
    <div class="productDetails">
        Brand: ${productModel["brand"]}
    </div>
    <div class="productDetails"> 
        Available quantity:   ${productModel["qty"]} 
    </div>
    <div class="productDetails"> 
        Price:  ${productModel["price"]} &euro;
    </div>
    <div class="productDetails"> 
        EAN: ${productModel["ean"]}
    </div>
    <h4>Description</h4>
    <div id="productDesc"> 
        ${productModel["description"]}
    </div>
    <br> 
    <br>
    <div class="logRegLinks">
        <div>
            <a href="adminAccountLogin">Login as an Admin</a>
        </div>
        <div>
            <a href="registerBuyer">Buy on Online Store - Register as a buyer</a>
        </div>
    </div> <!--end of logRegLinks -->
    <%@include file="footer.jsp" %>
</body>
</html>
