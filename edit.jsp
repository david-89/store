

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
        <title>Edit product</title>
    </head>
    <body>
        <h2 class="formHeader">Edit product</h2>
        <form:form id="uploadProductForm"  method="POST" onsubmit="return validateForm()" commandName="productModel" action="edit" name="editForm">
            <form:hidden path="productId" />
            Product name: <span id="asterisk"> *</span> <form:input name="productName" title="Must not contain more than 100 characters" onchange="validateLength(this, 100)" class="inputField" path="productName" required="true"/>
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
            
            Bullet point 1: <form:input name="bullet1" title="Must not contain more than 20 characters" onchange="validateLength(this, 20)" class="bulletInputField" path="bullet1" />
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="bullet1" /></span><br>
            Bullet point 2: <form:input name="bullet2" class="bulletInputField" title="Must not contain more than 20 characters" onchange="validateLength(this, 20)" path="bullet2" />
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="bullet2" /></span><br>
            Bullet point 3: <form:input name="bullet3" class="bulletInputField" path="bullet3" title="Must not contain more than 20 characters" onchange="validateLength(this, 20)" />
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="bullet3" /></span><br> 
            <div id="descBox"><label>Description:</label><form:textarea title="Must not contain more than 1000 characters" onchange="validateLength(this, 1000)" class="textFieldDesc" path="description" /></div>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="description" /></span><br>  
            Image<form:input class="inputField" path="image1" /><br>
            EAN:<span id="asterisk"> *</span> <form:input name="ean" title="Must contain 13 digits" onchange="validateEAN(this)" class="shortInputField" path="ean" required="true" />
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="ean" /></span><br>
            Brand:<span id="asterisk"> *</span> <form:input name="brand" title="Must not contain more than 30 characters" onchange="validateLength(this, 30)" class="shortInputField" path="brand" required="true" /> 
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="brand" /></span><br>
            Quantity:<span id="asterisk"> *</span> <form:input name="qty" title="Must contain an integer" onchange="validateQty(this)" class="shortInputField" path="qty" required="true" />
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="qty" /></span><br>
            Price(&euro;):<span id="asterisk"> *</span> <form:input name="price" title="Must be a number(decimals separated with a dot)" onchange="validatePrice(this)" class="shortInputField" path="price" required="true" />
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="price" /></span><br>
            <input id="nextBtn" type="submit" value="Edit" />
        </form:form>
            <div>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
                function validateLength(inputElement, max) { //validates the length of characters of an input field
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
                
                function validateEAN(inputElement) { //makes sure the input value has 13 digits with no spaces or commas
                    var ean = inputElement.value;
                    if (ean.length == 13 && !isNaN(ean)) {
                        inputElement.style = "border-color: none;";
                        return true;
                    } else {
                        inputElement.value = "";
                        inputElement.style = "border: 2px solid red; box-shadow: 0px 0px 5px #b32400;";
                    }
                }
                
                function validateQty(inputElement) { //ensures the input field has an integer value
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
                
                function validatePrice(inputElement) {  //ensures the input field has a double as a value
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
                    var nameElement = document.forms["editForm"]["productName"];
                    if (!validateLength(nameElement, 100)) {
                        return false;
                    }
                    var bullet1 = document.forms["editForm"]["bullet1"];
                    if (!validateLength(bullet1, 20)) {
                        return false;
                    }
                    var bullet2 = document.forms["editForm"]["bullet2"];
                    if (!validateLength(bullet2, 20)) {
                        return false;
                    }
                    var bullet3 = document.forms["editForm"]["bullet3"];
                    if (!validateLength(bullet3, 20)) {
                        return false;
                    }
                    var description = document.forms["editForm"]["description"];
                    if (!validateLength(description, 1000)) {
                        return false;
                    }
                    var ean = document.forms["editForm"]["ean"];
                    if (!validateEAN(ean)) {
                        return false;
                    }
                    var brand = document.forms["editForm"]["brand"];
                    if (!validateLength(brand, 30)) {
                        return false;
                    }
                    var qty = document.forms["editForm"]["qty"];
                    if (!validateQty(qty)) {
                        return false;
                    }
                    var price = document.forms["editForm"]["price"];
                    if (!validatePrice(price)) {
                        return false;
                    }
                    
                    return true;
                }
            </script>
    </body>
</html>
