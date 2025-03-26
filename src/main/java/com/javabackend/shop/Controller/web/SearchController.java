package com.javabackend.shop.Controller.web;

import com.javabackend.shop.model.Response.DiscountResponse;
import com.javabackend.shop.model.dto.CartDTO;
import com.javabackend.shop.model.dto.OrderDTO;
import com.javabackend.shop.model.dto.ProductDTO;
import com.javabackend.shop.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller(value = "SearchController")
public class SearchController {
    @Autowired
    private IProductService productService;
    @ResponseBody
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public ResponseEntity<List<ProductDTO>> Search(@RequestParam String keyword) {
        List<ProductDTO> productDTOList= productService.searchProduct(keyword);
        return new ResponseEntity<>(productDTOList, HttpStatus.OK);
    }

}
