package com.javabackend.shop.repository;

import com.javabackend.shop.entity.ShippingMethodEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShippingRepository extends JpaRepository<ShippingMethodEntity,Long> {
}
