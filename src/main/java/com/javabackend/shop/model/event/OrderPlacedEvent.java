package com.javabackend.shop.model.event;

import com.javabackend.shop.entity.OrderEntity;
import org.springframework.context.ApplicationEvent;

import javax.persistence.criteria.Order;

public class OrderPlacedEvent extends ApplicationEvent {
    private OrderEntity orderEntity;
    public OrderPlacedEvent(Object source , OrderEntity orderEntity) {
        super(source);
        this.orderEntity = orderEntity;
    }

    public OrderEntity getOrderEntity() {
        return orderEntity;
    }
}
