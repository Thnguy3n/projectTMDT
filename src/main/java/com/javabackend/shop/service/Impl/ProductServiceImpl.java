package com.javabackend.shop.service.Impl;

import com.javabackend.shop.Utils.UploadFileUtils;
import com.javabackend.shop.entity.CategoryEntity;
import com.javabackend.shop.entity.ProductEntity;
import com.javabackend.shop.entity.SupplierEntity;
import com.javabackend.shop.model.Response.DiscountResponse;
import com.javabackend.shop.model.Response.ProductResponse;
import com.javabackend.shop.model.dto.ProductDTO;
import com.javabackend.shop.model.request.ProductRequest;
import com.javabackend.shop.repository.ProductRepository;
import com.javabackend.shop.service.IProductService;
import org.apache.tomcat.util.codec.binary.Base64;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.io.File;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements IProductService {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ModelMapper modelMapper;
    private final UploadFileUtils uploadFileUtils;

    @Autowired
    public ProductServiceImpl(UploadFileUtils uploadFileUtils) {
        this.uploadFileUtils = uploadFileUtils;
    }

    @Override
    public List<ProductDTO> filterPrice(Double minPrice, Double maxPrice,Long categoryId) {
        List<ProductEntity> productEntities = new ArrayList<>();
        if(categoryId!=null){
            productEntities = productRepository.findAllByPriceBetweenAndDeletedAndCategoryEntity_Id(minPrice,maxPrice,1,categoryId);
        }
        else {
         productEntities = productRepository.findAllByPriceBetweenAndDeleted(minPrice,maxPrice,1);
        }

        return productEntities.stream()
                .map(productEntity -> modelMapper.map(productEntity, ProductDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<ProductResponse> findAll(ProductRequest productRequest) {
        List<ProductEntity> productEntities = productRepository.findAll(productRequest);
        List<ProductResponse> productResponses = new ArrayList<>();
        for (ProductEntity it : productEntities) {
            if (it.getDeleted() == 1) {
                ProductResponse productResponse = modelMapper.map(it, ProductResponse.class);
                productResponses.add(productResponse);
            }

        }
        return productResponses;
    }

    @Override
    public void addOrUpdateProduct(ProductDTO productDTO) {
        ProductEntity productEntity = modelMapper.map(productDTO, ProductEntity.class);
        CategoryEntity categoryEntity = new CategoryEntity();
        SupplierEntity supplierEntity = new SupplierEntity();
        supplierEntity.setId(productDTO.getSupplierId());
        categoryEntity.setId(productDTO.getCategoryId());
        productEntity.setCategoryEntity(categoryEntity);
        productEntity.setSupplierEntity(supplierEntity);
        productEntity.setDeleted(1);
        productEntity.setDiscountStatus(1);
        saveThumbnail(productDTO, productEntity);
        productRepository.save(productEntity);
    }

    @Override
    public DiscountResponse updateDiscount(Long Id) {
        ProductEntity productEntity = productRepository.findById(Id).get();
        DiscountResponse discountResponse = new DiscountResponse();
        ZonedDateTime nowInHCM = ZonedDateTime.now(ZoneId.of("Asia/Ho_Chi_Minh"));
        LocalDateTime now = LocalDateTime.now();
        if (productEntity.getStart_discount() == null || productEntity.getEnd_discount() == null) {
            productEntity.setDiscountStatus(0);
            productRepository.save(productEntity);
            discountResponse.setDiscountStatus(0);
            discountResponse.setDuration("0");
            return discountResponse;
        } else {
            Duration duration = Duration.between(now, productEntity.getEnd_discount());
            Long toSeconds = duration.getSeconds();
            if ((now.isEqual(productEntity.getStart_discount()) || now.isAfter(productEntity.getStart_discount()))
                    && now.isBefore(productEntity.getEnd_discount())) {
                discountResponse.setDiscountStatus(productEntity.getDiscountStatus());
                discountResponse.setDuration(toSeconds.toString());
                return discountResponse;
            } else {
                productEntity.setDiscountStatus(0);
                productRepository.save(productEntity);
                discountResponse.setDiscountStatus(0);
                discountResponse.setDuration("0");
                return discountResponse;
            }
        }
    }

    @Override
    public List<ProductDTO> findAllProducts(ProductDTO productDTO) {
        List<ProductEntity> productEntityList = productRepository.findAll();
        List<ProductDTO> productDTOList = new ArrayList<>();
        for (ProductEntity it : productEntityList) {
            ProductDTO p = modelMapper.map(it, ProductDTO.class);
            if (p.getDeleted() == 1) {
                productDTOList.add(p);
            }
        }
        return productDTOList;
    }

    @Override
    public void deleteProducts(List<Long> Id) {
        List<ProductEntity> productEntities = productRepository.findAllById(Id);
        for (ProductEntity it : productEntities) {
            it.setDeleted(0);
            productEntities.add(it);
            productRepository.save(it);
        }
    }

    @Override
    public ProductDTO findProductById(Long Id) {
        ProductEntity productEntity = productRepository.findById(Id).get();
        ProductDTO productDTO = modelMapper.map(productEntity, ProductDTO.class);
        return productDTO;
    }

    @Override
    public List<ProductDTO> findProductByCategoryId(Long id,Integer page, Integer size) {
        Pageable pageable = PageRequest.of(page, size);
        List<ProductEntity> productEntities = productRepository.findAllByCategoryEntity_IdAndDeleted(id,1,pageable).getContent();
        return productEntities.stream()
                .map(productEntity -> modelMapper.map(productEntity, ProductDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<ProductDTO> findProductBigDiscount(ProductDTO productDTO) {
        List<ProductEntity> productEntityList = productRepository.findAllByDiscountStatusAndDiscountIsGreaterThanEqual(1, 50);
        List<ProductDTO> productDTOList = new ArrayList<>();
        for (ProductEntity it : productEntityList) {
            ProductDTO p = modelMapper.map(it, ProductDTO.class);
            if (p.getDeleted() == 1) {
                productDTOList.add(p);
            }
        }
        return productDTOList;
    }

    @Override
    public List<ProductDTO> searchProduct(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return Collections.emptyList();
        }
        else{
            List<ProductEntity> ProductEntity =  productRepository.findAllByTitleContainingOrCategoryEntity_NameContaining(keyword, keyword);
            List<ProductDTO> productDTOList = new ArrayList<>();
            for (ProductEntity it : ProductEntity) {
                ProductDTO productDTO = modelMapper.map(it, ProductDTO.class);
                if (productDTO.getDeleted() == 1) {
                    productDTOList.add(productDTO);
                }
            }
            return productDTOList;
        }
    }

    @Override
    public List<ProductDTO> sortProduct(String sortType, Long categoryId) {
        List<ProductEntity> productEntityList = new ArrayList<>();
        return productEntityList.stream()
                .map(productEntity -> modelMapper.map(productEntity, ProductDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<ProductDTO> findAllPagination(Integer page, Integer size) {
        Pageable pageable = PageRequest.of(page, size);
        List<ProductEntity> productEntityList = productRepository.findAllByDeleted(1,pageable).getContent();
        return productEntityList.stream()
                .map(productEntity -> modelMapper.map(productEntity, ProductDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public Long countProductsByCategoryId(Long categoryId) {
        return productRepository.countAllByCategoryEntity_IdAndDeleted(categoryId, 1);
    }

    @Override
    public Long countProducts() {
        return productRepository.countAllByDeleted(1);
    }


    public void saveThumbnail(ProductDTO productDTO, ProductEntity productEntity) {
        String path = "/product/" + productDTO.getImageName();
        if (null != productDTO.getImageBase64()) {
            if (null != productEntity.getImage()) {
                if (!path.equals(productEntity.getImage())) {
                    File file = new File("C://home/office" + productEntity.getImage());
                    file.delete();
                }
            }
            String base64Image = productDTO.getImageBase64().split(",")[1];
            byte[] bytes = Base64.decodeBase64(base64Image);

            uploadFileUtils.writeOrUpdate(path, bytes);
            productEntity.setImage(path);
        }

    }
}
