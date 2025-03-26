package com.javabackend.shop.api.Web;

import com.javabackend.shop.model.dto.ProductDTO;
import com.javabackend.shop.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

@RestController(value = "filterAPI")
@RequestMapping("/api/filter")
public class FilterPriceAPI {
    @Autowired
    private IProductService productService;
    @GetMapping()
    public List<ProductDTO> filterPrice(@RequestParam(value = "minPrice", defaultValue = "0") Double minPrice,
                                        @RequestParam(value = "maxPrice", required = false) Double maxPrice,
                                        @RequestParam(value = "categoryId", required = false) Long categoryId)  {
        return productService.filterPrice(minPrice, maxPrice, categoryId);
    }
    @GetMapping(value = "/sort")
    public List<ProductDTO> sortProduct(@RequestParam(value = "categoryId", required = false) Long categoryId,
                                        String sortType)
    {
        List<ProductDTO> productDTOList = new ArrayList<>() ;
        return productDTOList;

    }
}
