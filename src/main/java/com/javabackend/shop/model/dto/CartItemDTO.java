package com.javabackend.shop.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItemDTO {
    private Long id;
    private Long productId;
    private String image;
    private String productTitle;
    private Double price;
    private Integer discount;
    private Integer quantity;
    private Double total;
    private String productName;
    private double totalPrice;
    private String size;
    private Long cartId;
    private Integer discount_status;
    private Double discounted_price;

}
