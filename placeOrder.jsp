<%-- 
    Document   : placeOrder
    Created on : Jul 24, 2016, 12:22:47 PM
    Author     : David
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place order</title>
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
    </head>
    <body>
        <h2 class="formHeader">Place an order</h2>
        <%
          if (session.getAttribute("logged") != null && session.getAttribute("logged").equals(true)) {  
              
        %>
        <%  
           String id = request.getParameter("id"); 
           id = id.replace(".jsp", "");  
           String buyerId = request.getParameter("buyerId");
        %> 
        <form:form name="form" id="depositMoneyForm" action="placeOrder"  method="post" commandName="orderModel" >
            Quantity: <input id="amountInputField" class="shortInputField" type="text" name="purchasedQty" title="Must contain an integer greater than 0" onchange="validateQty(this)" required="true"  />
            <input type="hidden" name="id" value ="<%=id %>" /> 
            <input type="hidden" name="buyerId" value="<%= buyerId %>" />
            <input id="proceedWithOrderBtn" type="submit" value="Confirm order" /> 
        </form:form>
        <div class="logRegLinks">
            <div>
                <a href="search">Go to online store homepage</a>
            </div>
        </div> <!--end of logRegLinks -->
            <%@include file="footer.jsp" %>
            <% } else { %>
        <h2> You are not logged into your account! Please login first.</h2>
        <div>
            <a href="search">Back to homepage</a>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <% } %>
        <!--javascript part -->
        <script>
            function validateQty(inputElement) { //ensures the inserted value is an integer greater than 0
                var qty = inputElement.value;
                if (qty % 1 === 0 && qty > 0) {
                    inputElement.style = "border-color: none;";
                    return true;
                } else {
                     inputElement.value = "";
                     inputElement.style = "border: 2px solid red; box-shadow: 0px 0px 5px #b32400;";
                     return false;
                }
            }
        </script>
    </body>
</html>
