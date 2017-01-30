<%-- 
    Document   : successfullyRegistered
    Created on : Aug 22, 2016, 3:52:43 PM
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Successfully registered</title>
    </head>
    <body>
        <h2>You have successfully registered as a buyer</h2>
        <div class="logRegLinks">
            <div>
               <a href="adminAccountLogin">Login as an Admin</a>
            </div>       
            <div>
               <a href="search">Go to online store homepage</a>
            </div>
        </div> <!--end of logRegLinks -->
        <%@include file="footer.jsp" %>
    </body>
</html>
