package com.javabackend.shop.repository.custom;

import com.javabackend.shop.entity.ProductEntity;
import com.javabackend.shop.model.request.ProductRequest;

import java.util.List;

public interface ProductRepositoryCustom {
    List<ProductEntity> findAll(ProductRequest productRequest);

}
