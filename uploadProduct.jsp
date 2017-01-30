<%-- 
    Document   : uploadProduct
    Created on : Jul 1, 2016, 11:29:12 PM
    Author     : David
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload product</title>
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
    </head>
    <body>
        <div id="headerPart">
            <img src="logo/logo.jpg" id="logo" />
            <h2 class="onlineStoreTitle"> Admin account </h2>
        </div>
        <%
          if (session.getAttribute("logged") != null && session.getAttribute("logged").equals(true)) {  
              session.setMaxInactiveInterval(600);   
        %>
        <%@include file="navigation.jsp" %>
        <h2 class="formHeader">Create a new product</h2>
        <form:form name="form" id="uploadProductForm"  action="uploadProduct" method="post" onsubmit="return validateForm()" commandName="productModel">
            Product name:<span id="asterisk"> *</span> <form:input name="productName" id="productNameInput" class="inputField" title="Must not contain more than 100 characters" onchange="validateLength(this, 100)" path="productName" required="true"></form:input>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="productName" /></span><br>
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
            Bullet 1: <form:input name="bullet1" class="bulletInputField" title="Must not contain more than 20 characters" onchange="validateLength(this, 20)" path="bullet1"></form:input>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="bullet1" /></span><br>
            Bullet 2: <form:input name="bullet2" class="bulletInputField" title="Must not contain more than 20 characters" onchange="validateLength(this, 20)" path="bullet2"></form:input>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="bullet2" /></span><br>
            Bullet 3: <form:input name="bullet3" class="bulletInputField" title="Must not contain more than 20 characters" onchange="validateLength(this, 20)" path="bullet3"></form:input>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="bullet3" /></span><br>
            <div id="descBox"><label>Description:</label> <form:textarea name="description" title="Must not contain more than 1000 characters" onchange="validateLength(this, 1000)" class="textFieldDesc" path="description" ></form:textarea>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="description" /></span></div>
            EAN:<span id="asterisk"> *</span>  <form:input name="ean" class="shortInputField" title="Must contain 13 digits" onchange="validateEAN(this)" path="ean" required="true" ></form:input>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="ean" /></span><br>
            Brand:<span id="asterisk"> *</span>  <form:input name="brand" title="Must not contain more than 30 characters" onchange="validateLength(this, 30)" class="shortInputField" path="brand" required="true"></form:input>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="brand" /></span><br> 
            Quantity:<span id="asterisk"> *</span>  <form:input name="qty" title="Must contain an integer" onchange="validateQty(this)" class="shortInputField" path="qty" required="true"></form:input>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="qty" /></span><br>
            Price(&euro;):<span id="asterisk"> *</span>  <form:input name="price" title="Must be a number(decimals separated with a dot)" onchange="validatePrice(this)" class="shortInputField" path="price" required="true"></form:input>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="price" /></span>
            <br>
             <input id="nextBtn" type="submit" value="Next" />
        </form:form>
        <div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <br><br><br>
        </div>
             
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
            <!-- javascript part -->
            <script>
                function validateLength(inputElement, max) { //validates the length of input value with an argument of max number of characters
                    var productName = inputElement.value;
                        if(productName.length > max) {
                            inputElement.value = "";
                            inputElement.style = "border: 2px solid red; box-shadow: 0px 0px 5px #b32400;";
                            return false;
                        } else {
                            inputElement.style = "border-color: none;";
                            return true;
                        }    
                }
                
                function validateEAN(inputElement) { //validates if the input value contains 13 digits
                    var ean = inputElement.value;
                    if (ean.length == 13 && !isNaN(ean)) {
                        inputElement.style = "border-color: none;";
                        return true;
                    } else {
                        inputElement.value = "";
                        inputElement.style = "border: 2px solid red; box-shadow: 0px 0px 5px #b32400;";
                    }
                }
                
                function validateQty(inputElement) { //validates if the input value is an integer
                    var qty = inputElement.value;
                    if (qty % 1 === 0) {
                        inputElement.style = "border-color: none;";
                        return true;
                    } else {
                         inputElement.value = "";
                         inputElement.style = "border: 2px solid red; box-shadow: 0px 0px 5px #b32400;";
                         return false;
                    }
                }
                
                function validatePrice(inputElement) { //validates if the input value is an integer or a double
                    var price = inputElement.value;
                    if (!isNaN(price)) {
                        inputElement.style = "border-color: none;";
                        return true;
                    } else {
                         inputElement.value = "";
                         inputElement.style = "border: 2px solid red; box-shadow: 0px 0px 5px #b32400;";
                         return false;
                    }
                }
                
                function validateForm() { //returns true if all input fields pass
                    var nameElement = document.forms["form"]["productName"];
                    if (!validateLength(nameElement, 100)) {
                        return false;
                    }
                    var bullet1 = document.forms["form"]["bullet1"];
                    if (!validateLength(bullet1, 20)) {
                        return false;
                    }
                    var bullet2 = document.forms["form"]["bullet2"];
                    if (!validateLength(bullet2, 20)) {
                        return false;
                    }
                    var bullet3 = document.forms["form"]["bullet3"];
                    if (!validateLength(bullet3, 20)) {
                        return false;
                    }
                    var description = document.forms["form"]["description"];
                    if (!validateLength(description, 1000)) {
                        return false;
                    }
                    var ean = document.forms["form"]["ean"];
                    if (!validateEAN(ean)) {
                        return false;
                    }
                    var brand = document.forms["form"]["brand"];
                    if (!validateLength(brand, 30)) {
                        return false;
                    }
                    var qty = document.forms["form"]["qty"];
                    if (!validateQty(qty)) {
                        return false;
                    }
                    var price = document.forms["form"]["price"];
                    if (!validatePrice(price)) {
                        return false;
                    }
                    
                    return true;
                }
            </script>
    </body>
</html>
