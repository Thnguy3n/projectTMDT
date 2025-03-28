package com.javabackend.shop.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO extends AbstractDTO {

    @NotBlank(message = "Họ tên không được để trống")
    private String fullName;
    @NotBlank(message = "SĐT không được để trống")
    private String phoneNumber;
    @NotBlank(message = "email không được để trống")
    private String email;
    @NotBlank(message = "Địa chỉ không được để trống")
    private String address;
    private String note;
    private String status;
    private Long userId;
    private List<OrderItemDTO> orderItems;
    private List<String> userName;
    private Long shipping_method_id;
}
