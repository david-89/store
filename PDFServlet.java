/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.pdf;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPRow;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "PDFServlet", urlPatterns = {"/PDFServlet"})
public class PDFServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf"); //provides a PDF page
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_online_store", "root", "dag2003#89");
            String sql = "SELECT * FROM buyer JOIN order_table ON buyer.buyerId = order_table.buyer_id JOIN product ON order_table.product_id = product.productId WHERE purchase_date  >= ? AND purchase_date  <= ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ResultSet rs = ps.executeQuery();   //stores everything in rs in the date range sent from the form
            Document doc = new Document();
            PdfWriter.getInstance(doc, response.getOutputStream());
            doc.open();
            doc.add(new Paragraph("Order overview for the period between " + startDate + " and " + endDate));

            PdfPTable tableHeader = new PdfPTable(5);
            tableHeader.setSpacingBefore(30); //adds top margin for a table
            tableHeader.getDefaultCell().setBorderWidth(0f); //removes borders
            tableHeader.addCell("Order id");
            tableHeader.addCell("Buyer name");
            tableHeader.addCell("Purchase date");
            tableHeader.addCell("Qty");
            tableHeader.addCell("Income (€)");
            
            for (PdfPRow row : tableHeader.getRows()) {  //arranges table header
                for (PdfPCell cell : row.getCells()) {
                    cell.setBackgroundColor(BaseColor.ORANGE);
                    cell.setPadding(10);
                    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                }
            }

            float[] columnWidths = new float[]{11f, 10f, 15f, 5f, 8f}; //defines column widths
            tableHeader.setWidths(columnWidths);
            tableHeader.setWidthPercentage(100);
            doc.add(tableHeader);
            PdfPTable table = new PdfPTable(5); //the table below table header
            table.setSpacingAfter(30); //sets bottom margin
            table.getDefaultCell().setBorderWidth(0f);
            double totalSum = 0.0;
            double totalSumRounded = 0.0;
            while (rs.next()) {
                String orderId = rs.getString("order_id");
                String buyerName = rs.getString("buyer_name");
                String purchaseDate = rs.getString("purchase_date");
                String purchasedQty = rs.getString("purchased_qty");
                String price = rs.getString("price");
                Double priceDouble = Double.parseDouble(price);
                Integer qtyInt = Integer.parseInt(purchasedQty);
                double income = (double) Math.round(priceDouble * qtyInt * 100) / 100;
                String incomeStr = String.valueOf(income);
                totalSum = totalSum + income;
                totalSumRounded = (double) Math.round(totalSum * 100) / 100;

                table.addCell(orderId);
                table.addCell(buyerName);                
                table.addCell(purchaseDate);
                table.addCell(purchasedQty);
                table.addCell(incomeStr);
            }

            boolean colored = false;  // colors every other row in gray and sets cell padding for all cells
            for (PdfPRow row : table.getRows()) {
                for (PdfPCell cell : row.getCells()) {
                    cell.setPadding(10);
                    cell.setBackgroundColor(colored ? BaseColor.LIGHT_GRAY : BaseColor.WHITE);
                }
                colored = !colored;
            }
            
            table.setWidthPercentage(100);
            table.setWidths(columnWidths);
            doc.add(table);
            doc.add(new Paragraph("Total income: " + totalSumRounded + " €"));
            doc.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PDFServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ex) {
            Logger.getLogger(PDFServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
