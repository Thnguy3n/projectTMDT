package com.javabackend.shop.model.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderSearchRequest {
    private String fullName;
    private String phoneNumber;
    private String email;
    private String address;
    private String note;
    private String status;
    private Long userId;
}
