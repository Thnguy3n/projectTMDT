package com.javabackend.shop.strategy.Impl;

import com.javabackend.shop.strategy.DiscountStrategy;
import org.springframework.stereotype.Component;

@Component("noDiscountStrategy")
public class NoDiscountStrategyImpl implements DiscountStrategy {
    @Override
    public Double calculateTotal(Double price, Integer discount, Integer quantity) {
        return price * quantity;
    }
}
