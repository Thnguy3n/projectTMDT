package com.javabackend.shop.api.Admin;

import com.javabackend.shop.model.dto.CategoryDTO;
import com.javabackend.shop.model.dto.ProductDTO;
import com.javabackend.shop.service.ICategoryService;
import com.javabackend.shop.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "categoryAPIOfAdmin")
@RequestMapping("/api/category")
public class CategoryAPI {
    @Autowired
    private ICategoryService categoryService;
    @PostMapping
    public CategoryDTO addOrUpdateCategory(@RequestBody CategoryDTO categoryDTO){
        categoryService.addOrUpdateCategory(categoryDTO);
        return categoryDTO;
    }
    @DeleteMapping("/{ids}")
    public void deleteCategorys(@PathVariable List<Long> ids){
        categoryService.deleteCategorys(ids);
    }
}