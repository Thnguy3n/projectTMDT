package com.javabackend.shop.api.Web;

import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.entity.OrderItemEntity;
import com.javabackend.shop.model.dto.OrderDTO;
import com.javabackend.shop.model.dto.OrderItemDTO;
import com.javabackend.shop.model.dto.ProductDTO;
import com.javabackend.shop.repository.OrderItemRepository;
import com.javabackend.shop.repository.OrderRepository;
import com.javabackend.shop.service.ICartService;
import com.javabackend.shop.service.IOrderService;
import com.javabackend.shop.service.IProductService;
import com.javabackend.shop.service.InvoicePdfService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController(value = "orderAPI")
@RequestMapping("/api/order")
public class OrderAPI {
    @Autowired
    private IOrderService orderService;
    @Autowired
    private ICartService cartService;
    @Autowired
    private OrderItemRepository orderItemRepository;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private InvoicePdfService invoicePdfService;
    @Autowired
    private ModelMapper modelMapper;
    @PostMapping
    public ResponseEntity<String> addOrder(@Valid @RequestBody OrderDTO orderDTO, @RequestParam Long cartId, @RequestParam String paymentMethod, HttpServletRequest req){
//        String paymentUrl = orderService.addOrder(orderDTO, paymentMethod, req);
        cartService.removeCartItem(cartId);
        return orderService.addOrder(orderDTO, paymentMethod, req);
    }
    @GetMapping("/vnpay_return")
    public void handleVnpayReturn(@RequestParam("vnp_TxnRef") String txnRef,
                                  @RequestParam("vnp_ResponseCode") String responseCode,
                                  HttpServletResponse response) throws IOException {
        Long orderId = Long.parseLong(txnRef);
        if ("00".equals(responseCode)) {
            orderService.updatePaymentStatus(orderId);
            response.sendRedirect("http://localhost:8083/payment_success");
        } else {
            orderService.deleteOrder(orderId);
            response.sendRedirect("http://localhost:8083/payment_fail");
        }
    }
    @GetMapping("/{orderId}/pdf")
    public ResponseEntity<InputStreamResource> downloadInvoicePdf(@PathVariable Long orderId) {
        OrderEntity order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found"));

        ByteArrayInputStream pdf = invoicePdfService.generateInvoicePdf(order);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=order_" + orderId + ".pdf");

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_PDF)
                .body(new InputStreamResource(pdf));
    }

    @PostMapping("/{id}/complete")
    public ResponseEntity<Map<String, Object>> completeOrder(@PathVariable Long id) {
        orderService.updateOrderStatus(id);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Trạng thái đơn hàng đã được cập nhật thành công.");
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<List<OrderItemDTO>> getOrderDetails(@PathVariable Long id) {
        return ResponseEntity.ok(orderService.findAllOrderItem(id));
    }
    @DeleteMapping("/{id}")
    public void deleteOrder(@PathVariable Long id){
        orderService.deleteOrder(id);
    }

}
