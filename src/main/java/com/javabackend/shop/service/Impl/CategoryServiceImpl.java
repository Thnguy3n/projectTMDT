package com.javabackend.shop.service.Impl;

import com.javabackend.shop.entity.CategoryEntity;
import com.javabackend.shop.model.dto.CategoryDTO;
import com.javabackend.shop.repository.CategoryRepository;
import com.javabackend.shop.service.ICategoryService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoryServiceImpl implements ICategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public List<CategoryDTO> findAll() {
        List<CategoryEntity> categoryEntities = categoryRepository.findAll();
        return categoryEntities.stream()
                .map(category -> modelMapper.map(category, CategoryDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public void addOrUpdateCategory(CategoryDTO categoryDTO) {
        CategoryEntity category = modelMapper.map(categoryDTO, CategoryEntity.class);
        categoryRepository.save(category);
    }

    @Override
    public CategoryDTO findCategoryEntityById(Long id) {
        CategoryEntity categoryEntity= categoryRepository.findById(id).get();
        CategoryDTO categoryDTO = modelMapper.map(categoryEntity, CategoryDTO.class);
        return categoryDTO;
    }

    @Override
    public void deleteCategorys(List<Long> Id) {
        List<CategoryEntity> categoryEntities = categoryRepository.findAllById(Id);
        categoryRepository.deleteAll(categoryEntities);
    }
}