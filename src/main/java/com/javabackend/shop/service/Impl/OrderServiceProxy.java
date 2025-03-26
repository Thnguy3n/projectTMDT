package com.javabackend.shop.service.Impl;

import com.javabackend.shop.Utils.AddressValidator;
import com.javabackend.shop.model.dto.OrderDTO;
import com.javabackend.shop.model.dto.OrderItemDTO;
import com.javabackend.shop.service.IOrderService;
import com.javabackend.shop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;

@Service
@Primary
public class OrderServiceProxy implements IOrderService {
    private final IOrderService realOrderService;
    @Autowired
    public OrderServiceProxy(@Qualifier("realOrderService") IOrderService realOrderService) {
        this.realOrderService = realOrderService;
    }
    @Override
    public ResponseEntity<String> addOrder(OrderDTO orderDTO, String paymentMethod, HttpServletRequest req) {
        String address = orderDTO.getAddress();
        String detailAddress = AddressValidator.extractDetailAddress(address);
        if (!AddressValidator.isValidDetailAddress(detailAddress)) {
            throw new IllegalArgumentException("Địa chỉ cụ thể không hợp lệ!");
        }
        return realOrderService.addOrder(orderDTO, paymentMethod, req);
    }

    @Override
    public void deleteOrder(Long Id) {
        this.realOrderService.deleteOrder(Id);
    }

    @Override
    public void updatePaymentStatus(Long orderId) {
        this.realOrderService.updatePaymentStatus(orderId);
    }

    @Override
    public void updateOrderStatus(Long orderId) {
        this.realOrderService.updateOrderStatus(orderId);
    }

    @Override
    public List<OrderItemDTO> findAllOrderItem(Long orderId) {
        return this.realOrderService.findAllOrderItem(orderId);
    }
}
