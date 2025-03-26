package com.javabackend.shop.repository;

import com.javabackend.shop.entity.CartEntity;
import com.javabackend.shop.entity.CartItemEntity;
import com.javabackend.shop.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface CartRepository extends JpaRepository<CartEntity, Long> {
    Optional<CartEntity> findByUserEntity(UserEntity userEntity);
    @Query("SELECT c FROM CartEntity c WHERE c.userEntity.id = :userId")
    Optional<CartEntity> findCartByUserId(@Param("userId") Long userId);

}
