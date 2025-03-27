package com.javabackend.shop.model.Response;

import com.javabackend.shop.model.dto.AbstractDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductResponse extends AbstractDTO {
    private Long id;
    private String title;
    private String price;
    private Integer discount;
    private String image;
    private Integer inventory;
    private String description;
    private Integer deleted;
    private Long categoryId;
    private Long supplierId;
    private String supplierName;
    private String categoryName;
    private LocalDateTime start_discount;
    private LocalDateTime end_discount;
    private Integer discount_status;
}
