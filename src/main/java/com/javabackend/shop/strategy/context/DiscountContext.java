package com.javabackend.shop.strategy.context;

import com.javabackend.shop.strategy.DiscountStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;
@Component
public class DiscountContext {
    private final Map<Integer, DiscountStrategy> strategies;
    @Autowired
    public DiscountContext(
            @Qualifier("percentageDiscountStrategy") DiscountStrategy discountStrategy,
            @Qualifier("noDiscountStrategy") DiscountStrategy noDiscountStrategy) {
        strategies = new HashMap<>();
        strategies.put(1, discountStrategy);
        strategies.put(0, noDiscountStrategy);
    }

    public DiscountStrategy getStrategy(Integer discountStatus) {
        return strategies.getOrDefault(discountStatus, strategies.get(0));
    }
}
