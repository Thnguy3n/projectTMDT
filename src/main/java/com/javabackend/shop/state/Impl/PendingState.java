package com.javabackend.shop.state.Impl;

import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.state.OrderState;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class PendingState implements OrderState {
    @Override
    public void handleStatus(OrderEntity order) {
        order.setStatus("Đang xử lý");
    }

    @Override
    public OrderState nextState() {
        return new DeliveredState();
    }
}
