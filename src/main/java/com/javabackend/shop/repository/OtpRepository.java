package com.javabackend.shop.repository;

import com.javabackend.shop.entity.OtpEntity;
import com.javabackend.shop.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface OtpRepository extends JpaRepository<OtpEntity,Long> {
    Optional<OtpEntity> findAllByUserEntity(UserEntity userEntity);
}
