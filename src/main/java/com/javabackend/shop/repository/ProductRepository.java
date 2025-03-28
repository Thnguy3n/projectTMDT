package com.javabackend.shop.repository;
import com.javabackend.shop.entity.ProductEntity;
import com.javabackend.shop.repository.custom.ProductRepositoryCustom;
import org.springframework.data.domain.Page; 
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;


import java.net.URLConnection;
import java.util.List;

public interface ProductRepository extends JpaRepository<ProductEntity, Long>,
        ProductRepositoryCustom,
        PagingAndSortingRepository<ProductEntity, Long>
{
    long countAllByDeleted(int deleted);
    List<ProductEntity> findAllByDiscountStatusAndDiscountIsGreaterThanEqual(Integer discountStatus, Integer discountIsGreaterThan);

    List<ProductEntity> findAllByTitleContainingOrCategoryEntity_NameContaining(String title, String categoryEntityName);

    List<ProductEntity> findAllByPriceBetweenAndDeleted(Double priceAfter, Double priceBefore, Integer deleted);

    List<ProductEntity> findAllByPriceBetweenAndDeletedAndCategoryEntity_Id(Double priceAfter, Double priceBefore, Integer deleted, Long categoryEntityId);

    Page<ProductEntity> findAllByDeleted(Integer deleted, Pageable pageable);

    Page<ProductEntity> findAllByCategoryEntity_IdAndDeleted(Long categoryEntityId, Integer deleted, Pageable pageable);

    Long countAllByCategoryEntity_IdAndDeleted(Long categoryEntityId, Integer deleted);
}
