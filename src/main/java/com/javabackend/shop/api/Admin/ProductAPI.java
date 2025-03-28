package com.javabackend.shop.api.Admin;

import com.javabackend.shop.model.dto.ProductDTO;
import com.javabackend.shop.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController(value = "productAPIOfAdmin")
@RequestMapping("/api/product")
public class ProductAPI {
    @Autowired
    private IProductService productService;
    @PostMapping
    public ProductDTO addOrUpdateProduct(@Valid @RequestBody ProductDTO productDTO){
        productService.addOrUpdateProduct(productDTO);
        return productDTO;
    }
    @DeleteMapping("/{ids}")
    public void deleteProduct(@PathVariable List<Long> ids){
        productService.deleteProducts(ids);
    }
}
