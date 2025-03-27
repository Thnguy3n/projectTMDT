package com.javabackend.shop.repository;

import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.entity.PaymentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PaymentRepository extends JpaRepository<PaymentEntity, Long> {
    @Query("SELECT p FROM PaymentEntity p WHERE p.orderEntity.id =:orderId")
    PaymentEntity findPaymentEntitiesByOrderById(Long orderId);
}
