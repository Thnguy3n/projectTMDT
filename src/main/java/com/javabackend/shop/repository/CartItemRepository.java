package com.javabackend.shop.repository;
import com.javabackend.shop.entity.CartItemEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface CartItemRepository extends JpaRepository<CartItemEntity, Long> {
    @Query("SELECT c FROM CartItemEntity c WHERE c.cartEntity.id = :cartId")
    List<CartItemEntity> findCartItemEntitiesByCartId(Long cartId);
}
