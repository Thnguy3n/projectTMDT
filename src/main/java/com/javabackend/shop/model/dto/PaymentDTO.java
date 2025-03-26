package com.javabackend.shop.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data
public class PaymentDTO implements Serializable {
    private String status;
    private String message;
    private String URL;
}
