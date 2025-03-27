package com.javabackend.shop.model.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class ShippingMethodDTO extends AbstractDTO {
    private Long id;
    @NotBlank(message = "Tên phương thức vận chuyển không được để trống")
    private String title;
    @NotBlank(message = "Mô tả không được để trống")
    private String description;
    @NotNull(message = "Phí vận chuyển không được để trống")
    private Double basefee;

}



