package com.javabackend.shop.repository;

import com.javabackend.shop.entity.ProductEntity;
import com.javabackend.shop.entity.SlidesEntity;
import com.javabackend.shop.model.dto.SlidesDTO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SlideRepository extends JpaRepository<SlidesEntity, Long> {
    List<SlidesEntity> findAllByIsActive(Integer isActive);
}
