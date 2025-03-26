package com.javabackend.shop.strategy;

public interface DiscountStrategy {
    Double calculateTotal(Double price, Integer discount, Integer quantity);
}
