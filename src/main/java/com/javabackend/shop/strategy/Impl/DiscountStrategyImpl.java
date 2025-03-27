package com.javabackend.shop.strategy.Impl;

import com.javabackend.shop.strategy.DiscountStrategy;
import org.springframework.stereotype.Component;

@Component("percentageDiscountStrategy")
public class DiscountStrategyImpl implements DiscountStrategy {
    @Override
    public Double calculateTotal(Double price, Integer discount, Integer quantity) {
        return (price - (price * discount / 100)) * quantity;
    }
}
