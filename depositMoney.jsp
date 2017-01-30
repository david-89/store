<%-- 
    Document   : depositMoney
    Created on : Aug 4, 2016, 8:55:47 PM
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
        <title>Deposit money</title>
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
    </head>
    <body>
        <%
          if (session.getAttribute("logged") != null && session.getAttribute("logged").equals(true)) {  
              
        %>
        <h2 class="formHeader">Deposit money</h2>
        <form name="form" id="depositMoneyForm" method="POST"  action="depositMoney">
            &nbsp;&nbsp;&nbsp;&nbsp;Amount: <input class="shortInputField" id="amountInputField" name="amount" onchange="validateAmount(this)" required="true" />&euro;<br>
            <input type="hidden" name="buyerId" value="${param['buyerId']}" />
            <input id="depositMoneyBtn" type="submit" value="Deposit" />
        </form>
        <!-- javascript part -->
        <script>
            function validateAmount(inputElement) { //checks if the value is a number
                var amount = inputElement.value;                
                if (!isNaN(amount) && amount > 0) {
                    inputElement.style = "border-color: none;";
                    return true;
                } else {
                    inputElement.value = "";
                    inputElement.style = "border: 2px solid red; box-shadow: 0px 0px 5px #b32400;";
                    return false;
                }
            }
        </script>

        <div class="logRegLinks">
            <div>
                <a href="search">Go to online store homepage</a>
            </div>
        </div> <!--end of logRegLinks -->
        <%@include file="footer.jsp" %>
        <% } else { %>
        <h2> You are not logged into your account! Please login first.</h2>
        <div>
            <a href="buyerAccountLogin">Back to login page</a>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <% } %>
        
    </body>
</html>
