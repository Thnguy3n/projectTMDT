package com.javabackend.shop.service;

import com.javabackend.shop.entity.ShippingMethodEntity;
import com.javabackend.shop.model.dto.ShippingMethodDTO;

import java.util.List;

public interface IShippingMethodService {
    void addShippingMethod(ShippingMethodDTO shippingMethod);
    List<ShippingMethodDTO> findAllShippingMethods();
    ShippingMethodDTO findShippingMethodById(Long id);
    ShippingMethodEntity findShippingMethodEntityById(Long id);
    void deleteShippingMethod(Long id);
}
