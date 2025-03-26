package com.javabackend.shop.service;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;

import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.entity.OrderItemEntity;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;

@Service
public class InvoicePdfService {

    public ByteArrayInputStream generateInvoicePdf(OrderEntity order) {
        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {
            PdfWriter.getInstance(document, out);
            document.open();
            Font fontHeader = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
            Font fontContent = new Font(Font.FontFamily.HELVETICA, 12);
            Paragraph title = new Paragraph("HOA DON MUA HANG", fontHeader);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Thông tin khách hàng", fontContent));
            document.add(new Paragraph("Tên: " + order.getFullName(), fontContent));
            document.add(new Paragraph("SĐT: " + order.getPhoneNumber(), fontContent));
            document.add(new Paragraph("Email: " + order.getEmail(), fontContent));
            document.add(new Paragraph("Dia chi: " + order.getAddress(), fontContent));
            document.add(new Paragraph("Ngay dat hang: " + order.getCreatedDate(), fontContent));
            document.add(new Paragraph(" "));
            PdfPTable table = new PdfPTable(5);
            table.setWidthPercentage(100);
            table.setWidths(new int[]{2, 4, 2, 2, 2});
            addTableHeader(table, "STT", "San pham", "So luong", "Gia", "Thanh tien");

            List<OrderItemEntity> items = order.getOrderItemEntities();
            int index = 1;
            double totalAmount = 0;

            for (OrderItemEntity item : items) {
                table.addCell(new PdfPCell(new Paragraph(String.valueOf(index++), fontContent)));
                table.addCell(new PdfPCell(new Paragraph(item.getProductEntity().getTitle(), fontContent)));
                table.addCell(new PdfPCell(new Paragraph(String.valueOf(item.getQuantity()), fontContent)));
                table.addCell(new PdfPCell(new Paragraph(formatCurrency(item.getPrice()), fontContent)));
                table.addCell(new PdfPCell(new Paragraph(formatCurrency(item.getTotal()), fontContent)));
                totalAmount += item.getTotal();
            }

            document.add(table);
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Tong tien: " + formatCurrency(totalAmount) + " VND", fontHeader));

            document.close();
        } catch (DocumentException ex) {
            ex.printStackTrace();
        }

        return new ByteArrayInputStream(out.toByteArray());
    }

    private void addTableHeader(PdfPTable table, String... headers) {
        Font headerFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
        for (String header : headers) {
            PdfPCell cell = new PdfPCell(new Paragraph(header, headerFont));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
        }
    }

    private String formatCurrency(double amount) {
        return String.format("%,.2f", amount);
    }
}
