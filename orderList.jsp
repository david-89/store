<%-- 
    Document   : orderList
    Created on : Aug 4, 2016, 11:27:47 PM
    Author     : David
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="css/main.css" />" rel="stylesheet">
        <title>Orders</title>
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
        <h2>Order list</h2>        
        <%
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_online_store", "root", "dag2003#89");
            Statement st = con.createStatement();
            Double income = 0.0; 
            Double orderIncome = 0.0;
            String sql = "SELECT * FROM buyer JOIN order_table ON buyer.buyerId = order_table.buyer_id JOIN product ON order_table.product_id = product.productId";           
            ResultSet rs = st.executeQuery(sql);
            double totalIncomeTwoDecs = 0.0;
        %>
            <table>
                <th>
                    Order id
                </th>
                <th>
                    Buyer name
                </th>
                <th>
                    Buyer address
                </th>
                <th>
                    Buyer email
                </th>
                <th>
                    Purchase date
                </th>
                <th>
                    Purchased quantity
                </th>
                <th>
                    Product barcode
                </th>
                <th>
                    Order income(&euro;)
                </th>
                    
        <%
            while (rs.next()) {                
                String orderId = rs.getString("order_id");
                String buyerName = rs.getString("buyer_name"); 
                String buyerAddress = rs.getString("buyer_address");
                String buyerEmail = rs.getString("buyer_email");
                String purchaseDate = rs.getString("purchase_date"); 
                Integer purchasedQty = rs.getInt("purchased_qty");
                String productName = rs.getString("product_name");
                String ean = rs.getString("ean"); 
                Double price = rs.getDouble("price"); 
                orderIncome = purchasedQty * price;  
                income = income + orderIncome;
                double orderIncomeTwoDecs = (double) Math.round(orderIncome * 100) / 100;  
                totalIncomeTwoDecs = (double) Math.round(income * 100) / 100;
                
        %>
                <tr>
                    <td>
                        <%= orderId %>
                    </td>
                    <td>
                        <%= buyerName %>
                    </td>
                    <td>
                        <%= buyerAddress %> 
                    </td>
                    <td>
                        <%= buyerEmail %>
                    </td>
                    <td>
                        <%= purchaseDate %>
                    </td>
                    <td>
                        <%= purchasedQty %>
                    </td>
                    <td>
                        <%= ean %>
                    </td>
                    <td>
                        <%= orderIncomeTwoDecs %>
                    </td>
                </tr>
         <%   
            } con.close();
         %>
         
            <div>
                Total income: <%= totalIncomeTwoDecs%> &euro;
            </div>
            </table>
            <div id="pdfForm">
                <h4>
                    Request an overview for a custom date range in PDF
                </h4>
                <form action="PDFServlet" method="post">
                    <input type="date" name="startDate" />
                    <input type="date" name="endDate" />
                    <input type="submit" class="searchButton" value="Request PDF" />
                </form>
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
    </body>
</html>
