<%-- 
    Document   : homePageBuyer
    Created on : Jul 1, 2016, 12:07:44 AM
    Author     : David
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage buyer</title>
         <link href="<c:url value="css/main.css" />" rel="stylesheet">
    </head>
    <body>
        <%
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_online_store", "root", "dag2003#89");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String productId = request.getParameter("id");
            
            String sql = "SELECT buyerId FROM buyer WHERE username = '" + username + "' AND password = '" + password + "' ";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql); 
            String buyerId = null; 
            while (rs.next()) {    
                buyerId = rs.getString(1);  
            }
            
            String sqlCCBalance = "SELECT cc_balance FROM buyer WHERE username = '" + username + "' AND password = '" + password + "' ";
            ResultSet rsCC = st.executeQuery(sqlCCBalance);
            String ccBalanceStr = null;
            while (rsCC.next()) {
                ccBalanceStr = rsCC.getString(1);
            }
            Double ccBalanceDouble = Double.parseDouble(ccBalanceStr); 
            double ccBalance = (double) Math.round(ccBalanceDouble * 100) / 100; 
            con.close();
        %>
        <%
          if (session.getAttribute("logged") != null && session.getAttribute("logged").equals(true)) {  
              
        %>
        <h2>Buyer account</h2>
        Your current balance is <%= ccBalance %> &euro;
        <div>
            <form action="placeOrder" method="get">
                <input type="hidden" name="buyerId" value="<%= buyerId %>" /><br>
                <input type="hidden" name="id" value="<%=productId %>" /><br>
                <input id="proceedWithOrderBtn" type="submit" value="Proceed with the Order" />
            </form>     
        </div>
        <div id="depositMoneyBtn"> 
            <a href="depositMoney?buyerId=<%= buyerId%>" > Deposit money</a> 
        </div>
        <div id="depositMoneyBtn"> 
            <a href="buyerOrders?buyerId=<%= buyerId%>" > Check your orders</a> 
        </div>
        <form  action="logoutBuyer" method="get">
            <input type="hidden" name="buyerId" value="<%= buyerId %>" /><br>
            <input type="hidden" name="id" value="<%=productId %>" /><br>
            <input id="proceedWithOrderBtn" type="submit" value="Logout" />
        </form> 
        <div class="logRegLinks">
            <div>
                <a href="search">Go to online store homepage</a>
            </div>
        </div> <!--end of logRegLinks -->
            <% } else { %>
        <h2> You are not logged into your account! Please login first.</h2>
        <div>
            <a href="buyerAccountLogin">Back to login page</a>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <% } %>
        <%@include file="footer.jsp" %>
    </body>
</html>
