package com.javabackend.shop.repository;

import com.javabackend.shop.entity.CategoryEntity;
import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.entity.OrderItemEntity;
import com.javabackend.shop.model.dto.OrderDTO;
import com.javabackend.shop.model.dto.OrderItemDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderItemRepository extends JpaRepository<OrderItemEntity, Long> {
    @Query("SELECT o FROM OrderItemEntity o WHERE o.orderEntity.id =:orderId ")
    List<OrderItemEntity> findOrderItemEntitiesByOrderId(Long orderId);

    List<OrderItemEntity> findAllByOrderEntity(OrderEntity orderEntity);
}
