<%-- 
    Document   : registerBuyer
    Created on : Jun 28, 2016, 7:23:28 PM
    Author     : David
--%>
<%@page import="java.util.Map"%>
<%@page import="locale.Localization"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
        <title>Register buyer</title>
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
        
        <div id="headerPart">
            <img src="logo/logo.jpg" id="logo" />
            <h2 class="onlineStoreTitle">My Online store </h2>
        </div>
        <div id="langBar">
            <li><a href="?lang=en">English</a><span class="flagImg"><img src="${pageContext.request.contextPath}/flags/united_kingdom_flag.png" width="30" height="18" /></span></li>
                <li><a href="?lang=sr">Srpski</a><span class="flagImg"><img src="${pageContext.request.contextPath}/flags/serbian-flag.jpg" width="30" height="18" /></span></li>
                <li><a href="?lang=fr">Français</a><span class="flagImg"><img src="${pageContext.request.contextPath}/flags/french-flag.png" width="30" height="18" /></span></li> 
        </div>
        <h2 class="formHeader">${resources['Register as a buyer']}</h2>
        <form:form id="uploadProductForm" action="registerBuyer" method="post" commandName="buyerModel">
            ${resources['Name']}:<span id="asterisk"> *</span> <form:input class="inputField"  title="Must have at least 5 characters" path="buyerName" required="true"/>
            <br>
            <div id="descBox"><label>${resources['Address']}: <span id="asterisk"> *</span> </label> <form:textarea onchange="validateLength(this, 5)" class="textFieldDesc" path="buyerAddress" required="true"/></div>
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="buyerAddress" /></span><br>
            ${resources['Email']}: <span id="asterisk"> *</span> <form:input class="shortInputField" title="Must be a valid email in a form of xyz@zxy.xy(z)" onchange="validateEmail(this)" path="buyerEmail" required="true" />
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="buyerEmail" /></span><br>
            ${resources['CC Balance(&euro;)']}: <span id="asterisk"> *</span> <form:input class="shortInputField" onchange="validateCC(this)" title="Must be a number(decimals separated with a dot)" path="ccBalance" required="true" />
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="ccBalance" /></span><br>
            ${resources['Username']}: <span id="asterisk"> *</span> <form:input class="shortInputField" onchange="validateLength(this, 5)" title="Must have at least 5 characters" path="username" required="true" />
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="username" /></span><br>
            ${resources['Password']}:&nbsp; <span id="asterisk"> *</span>  <form:password class="shortInputField" onchange="validatePassword(this, 8)" title="Must have at least 8 characters, both numbers and letters" path="password" required="true" />
            <span style="font-size: small; color: red; font-style: italic;"><form:errors path="password" /></span><br>
            <input id="nextBtn" type="submit" value="${resources['Register']}" />
        </form:form>
            <div>
                <br><br><br><br><br><br><br><br><br><br><br><br>
            </div>
            <div class="logRegLinks">
                <div>
                    <a href="adminAccountLogin">${resources['Login as an Admin']}</a>
                </div>
                <div>
                    <a href="registerBuyer">${resources['Buy on Online Store - Register as a buyer']}</a>
                </div>
                    <div>
                    <a href="search">${resources['Go to online store homepage']}</a>
                </div>
            </div> <!--end of logRegLinks -->
            <%@include file="footer.jsp" %>
            <!-- javacsript part -->
            <script>
                function validateEmail(inputElement) { //ensures the input is in form example@example.com
                    var email = inputElement.value;
                    var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                    if (regex.test(email)) {
                        inputElement.style = "border-color: none;";
                        return true;
                    } else {
                        inputElement.value = "";
                        inputElement.style = "border: 2px solid red; box-shadow: 0px 0px 5px #b32400;";
                        return false;
                    }
                }
                
                function validateCC(inputElement) { //ensures the input value is a double or an integer
                    var ccBalance = inputElement.value;
                    if (!isNaN(ccBalance) && ccBalance > 0) {
                        inputElement.style = "border-color: none;";
                        return true;
                    } else {
                         inputElement.value = "";
                         inputElement.style = "border: 2px solid red; box-shadow: 0px 0px 5px #b32400;";
                         return false;
                    }
                }
                
                function validateLength(inputElement, min) { //validates the length of the input value with an argument set for minmum number of characters
                    var text = inputElement.value;
                        if(text.length < min) {
                            inputElement.value = "";
                            inputElement.style = "border: 2px solid red; box-shadow: 0px 0px 5px #b32400;";
                            return false;
                        } else {
                            inputElement.style = "border-color: none;";
                            return true;
                        }   
                }
                
                function validatePassword(inputElement, min) { //ensures the input has 8 characters, both numbers and letters
                    var password = inputElement.value;
                    var regex = /\S*(\S*([a-zA-Z]\S*[0-9])|([0-9]\S*[a-zA-Z]))\S*/;
                    if (regex.test(password) && password.length >= min) {
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
