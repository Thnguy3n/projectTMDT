package com.javabackend.shop.model.dto;

import com.javabackend.shop.entity.OrderEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItemDTO extends AbstractDTO{
    private Long id;
    private Integer quantity;
    private Double price;
    private Double total;
    private Long productId;
    private Long orderId;
    private String size;
    private String productTitle;
    private Double shipBaseFee;
}
