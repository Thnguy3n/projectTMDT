package com.javabackend.shop.repository.custom;

import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.model.request.OrderSearchRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderRepositoryCustom {
    List<OrderEntity> findAll(OrderSearchRequest orderSearchRequest, Pageable pageable);
}
