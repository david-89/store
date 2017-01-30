

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
        <div id="headerPart">    
            <img src="logo/logo.jpg" id="logo" />
            <h2 class="onlineStoreTitle"> Admin account </h2>       
        </div>
    <%
          if (session.getAttribute("logged") != null && session.getAttribute("logged").equals(true)) {  
              session.setMaxInactiveInterval(600);    
    %>  
    
        <%@include file="navigation.jsp" %>  
        <title>Delete product</title>
    </head>
    <body>
        <h2 class="formHeader">Delete a product</h2>
        <form:form id="uploadProductForm" method="POST" commandName="productModel" action="deleteProduct" name="deleteForm">
            <form:hidden path="productId" />
            Name: <form:input class="inputField" path="productName" /> <br>
            Product category: <form:select id="dropDownMenu" path="category">
                <form:option value="Home"></form:option>
                <form:option value="Books"></form:option>
                <form:option value="DVD"></form:option>
                <form:option value="Computers"></form:option>
                <form:option value="Cars"></form:option>
                <form:option value="Toys"></form:option>
                <form:option value="Jewellery"></form:option>
                <form:option value="Luggage"></form:option>
                <form:option value="Shoes and Clothes"></form:option>                 
            </form:select><br>  
            Bullet point 1: <form:input class="inputField" path="bullet1" /><br>
            Bullet point 2: <form:input class="inputField" path="bullet2" /><br>
            Bullet point 3: <form:input class="inputField" path="bullet3" /><br>
            Brand: <form:input class="shortInputField"  path="brand" /><br>
            EAN: <form:input class="shortInputField"  path="ean" /><br>             
            <div id="descBox"><label>Description:</label><form:textarea class="textFieldDesc" path="description" /></div><br> 
            Quantity: <form:input class="shortInputField"  path="qty" /><br>
            Price(&euro;): <form:input class="shortInputField"  path="price" /><br>           
            <input id="nextBtn" type="submit" value="Delete" />
        </form:form>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <div class="logRegLinks">        
                <div>
                    <a href="registerBuyer">Buy on Online Store - Register as a buyer</a>
                </div>
                <div>
                    <a href="search">Go to online store homepage</a>
                </div>
            </div> <!--end of logRegLinks -->
            <% } else { %>
                <h2> You are not logged into your account! Please login first.</h2>
                <div>
                    <a href="adminAccountLogin">Back to login page</a>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                </div>
            <% } %>
            <%@include file="footer.jsp" %>
    </body>
</html>
