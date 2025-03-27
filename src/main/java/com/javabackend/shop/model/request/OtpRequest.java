package com.javabackend.shop.model.request;

import lombok.Data;

@Data
public class OtpRequest {
    private String email;
    private String otp;
}
