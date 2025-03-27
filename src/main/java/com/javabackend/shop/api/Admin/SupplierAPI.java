package com.javabackend.shop.api.Admin;
import com.javabackend.shop.model.dto.SupplierDTO;
import com.javabackend.shop.service.ISupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "supplierAPIOfAdmin")
@RequestMapping("/api/supplier")
public class SupplierAPI {
    @Autowired
    private ISupplierService supplierService;
    @PostMapping
    public SupplierDTO addOrUpdateSupplier(@RequestBody SupplierDTO supplierDTO){
        supplierService.addOrUpdateSupplier(supplierDTO);
        return supplierDTO;
    }
    @DeleteMapping("/{ids}")
    public void deleteSuppliers(@PathVariable List<Long> ids){
        supplierService.deleteSuppliers(ids);
    }
}