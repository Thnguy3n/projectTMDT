package com.javabackend.shop.service.Impl;

import com.javabackend.shop.entity.ShippingMethodEntity;
import com.javabackend.shop.model.dto.ShippingMethodDTO;
import com.javabackend.shop.repository.ShippingRepository;
import com.javabackend.shop.service.IShippingMethodService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ShippingMethodServiceImpl implements IShippingMethodService    {
    @Autowired
    private ShippingRepository shippingRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public void addShippingMethod(ShippingMethodDTO shippingMethod) {
        ShippingMethodEntity shippingMethodEntity = modelMapper.map(shippingMethod, ShippingMethodEntity.class);
        shippingRepository.save(shippingMethodEntity);
    }

    @Override
    public List<ShippingMethodDTO> findAllShippingMethods() {
        List<ShippingMethodEntity> shippingMethodEntities = shippingRepository.findAll();
        List<ShippingMethodDTO> shippingMethodDTOs = new ArrayList<>();
        for (ShippingMethodEntity shippingMethodEntity : shippingMethodEntities) {
            shippingMethodDTOs.add(modelMapper.map(shippingMethodEntity, ShippingMethodDTO.class));
        }
        return shippingMethodDTOs;
    }

    @Override
    public ShippingMethodDTO findShippingMethodById(Long id) {
        ShippingMethodEntity shippingMethodEntity=shippingRepository.findById(id).get();
        ShippingMethodDTO shippingMethodDTO=modelMapper.map(shippingMethodEntity, ShippingMethodDTO.class);
        return shippingMethodDTO;
    }

    @Override
    public ShippingMethodEntity findShippingMethodEntityById(Long id) {
        ShippingMethodEntity shippingMethodEntity=shippingRepository.findById(id).get();
        return shippingMethodEntity;
    }

    @Override
    public void deleteShippingMethod(Long id) {
        shippingRepository.deleteById(id);
    }

}
