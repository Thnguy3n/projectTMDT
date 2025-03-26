package com.javabackend.shop.service;

import com.javabackend.shop.model.Response.DiscountResponse;
import com.javabackend.shop.model.Response.ProductResponse;
import com.javabackend.shop.model.dto.ProductDTO;
import com.javabackend.shop.model.request.ProductRequest;
import org.springframework.http.ResponseEntity;

import java.util.List;
public interface IProductService {
    List<ProductDTO> filterPrice(Double minPrice, Double maxPrice, Long categoryId);
    List<ProductResponse> findAll(ProductRequest productRequest);
    void addOrUpdateProduct(ProductDTO productDTO);
    DiscountResponse updateDiscount(Long Id);
    List<ProductDTO>findAllProducts(ProductDTO productDTO);
    void deleteProducts(List<Long> Id);
    ProductDTO findProductById(Long Id);
    List<ProductDTO> findProductByCategoryId(Long Id, Integer page, Integer size);
    List<ProductDTO> findProductBigDiscount(ProductDTO productDTO);
    List<ProductDTO> searchProduct(String keyword);
    List<ProductDTO> sortProduct(String sortType, Long categoryId);
    List<ProductDTO> findAllPagination(Integer page, Integer size);
    Long countProducts();
    Long countProductsByCategoryId(Long categoryId);
}
