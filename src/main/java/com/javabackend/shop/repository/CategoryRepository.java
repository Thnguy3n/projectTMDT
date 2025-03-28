package com.javabackend.shop.repository;

import com.javabackend.shop.entity.CategoryEntity;
import com.javabackend.shop.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
}
