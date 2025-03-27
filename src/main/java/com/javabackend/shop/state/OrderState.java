package com.javabackend.shop.state;

import com.javabackend.shop.entity.OrderEntity;

public interface OrderState {
    void handleStatus(OrderEntity order);
    OrderState nextState();
}
