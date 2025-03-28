package com.javabackend.shop.api.Admin;

import com.javabackend.shop.model.dto.ShippingMethodDTO;
import com.javabackend.shop.service.IShippingMethodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController(value = "ShippingAPI")
@RequestMapping("/api/shipping")
public class ShippingAPI {
    @Autowired
    private IShippingMethodService shippingMethodService;
    @PostMapping
    public ResponseEntity<?> addShippingMethod(@Valid @RequestBody ShippingMethodDTO shippingMethodDTO) {
        shippingMethodService.addShippingMethod(shippingMethodDTO);
        return ResponseEntity.ok().body("okee");
    }
    @DeleteMapping("/{id}")
    public void deleteShippingMethod(@PathVariable Long id){
        shippingMethodService.deleteShippingMethod(id);
    }
}
