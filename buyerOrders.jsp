<%-- 
    Document   : buyerOrders
    Created on : Sep 2, 2016, 6:30:27 PM
    Author     : David
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your orders</title>
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
    </head>
    <body>
        <%
          if (session.getAttribute("logged") != null && session.getAttribute("logged").equals(true)) {  
               session.setMaxInactiveInterval(600);   
        %> 
        <%
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_online_store", "root", "dag2003#89");
            Statement st = con.createStatement();
            String buyerId = request.getParameter("buyerId");
            Integer buyerIdInt = Integer.parseInt(buyerId);
            String sql = "SELECT * FROM buyer JOIN order_table ON buyer.buyerId = order_table.buyer_id JOIN product ON order_table.product_id = product.productId WHERE order_table.buyer_id = " + buyerIdInt;
            ResultSet rs = st.executeQuery(sql);
        %>    
        <h2>Your orders</h2>
        <table>
            <th>
                Order id
            </th>
            <th>
                Purchase date
            </th>
            <th>
                Purchased quantity
            </th>
            <th>
                Order cost(&euro;)
            </th>
            <th>
                Product name
            </th>
            <%    
                while (rs.next()) {
                    String orderId = rs.getString("order_id");
                    String purchaseDate = rs.getString("purchase_date");
                    Integer purchasedQty = rs.getInt("purchased_qty");
                    String productName = rs.getString("product_name");
                    Double price = rs.getDouble("price");
                    Double orderCost = price * purchasedQty;
                    orderCost = (double) Math.round(orderCost * 100) / 100;
            %>
            <tr>
                <td>
                    <%=orderId%> 
                </td>
                <td>
                    <%=purchaseDate%> 
                </td>
                <td>
                    <%=purchasedQty%> 
                </td>
                <td>
                    <%=orderCost%> 
                </td>
                <td>
                    <%=productName%> 
                </td>
            </tr>
            <% } con.close();  %>
        </table>
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
        <% }  %>
            
    </body>
</html>
