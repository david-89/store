<%-- 
    Document   : inventory
    Created on : Jul 23, 2016, 12:37:33 AM
    Author     : David
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
        <title>Inventory</title>
    </head>
    <body>
        <div id="headerPart">
            <img src="logo/logo.jpg" id="logo" />
            <h2 class="onlineStoreTitle">Welcome to your admin account </h2>
        </div>        
        <%
          if (session.getAttribute("logged") != null && session.getAttribute("logged").equals(true)) {  
               session.setMaxInactiveInterval(600);   
        %>          
        <%@include file="navigation.jsp" %>
        <h2>Inventory</h2>
        <form:form commandName="productModels" method="post"> 
            <table>
                <th>Product name</th>
                <th>Brand</th>
                <th>EAN</th>
                <th>Quantity</th>
                <th>Price (&euro;)</th>                
                <c:forEach items="${productModels}" var="productModel" >
                    <tr>
                        <td>${productModel["productName"]}</td>
                        <td>${productModel["brand"]}</td>
                        <td>${productModel["ean"]}</td>
                        <td>${productModel["qty"]}</td>
                        <td>${productModel["price"]}</td>                          
                        <td class="crudBtns"><div id="editBtn"><a href = "edit?id=${productModel['productId']}">Edit</a></div></td>
                        <td class="crudBtns"><div id="deleteBtn"><a href="deleteProduct?id=${productModel['productId']}">Delete</a></div></td>
                    </tr>
                </c:forEach>
            </table>
        </form:form>
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
