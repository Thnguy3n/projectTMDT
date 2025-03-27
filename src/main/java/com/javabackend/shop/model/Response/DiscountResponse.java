package com.javabackend.shop.model.Response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Duration;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DiscountResponse {
    private String duration;
    private Integer discountStatus;
}
