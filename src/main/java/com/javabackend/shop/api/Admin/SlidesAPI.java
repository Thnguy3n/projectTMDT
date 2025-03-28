package com.javabackend.shop.api.Admin;

import com.javabackend.shop.model.dto.SlidesDTO;
import com.javabackend.shop.model.dto.SupplierDTO;
import com.javabackend.shop.model.request.SlideRequest;
import com.javabackend.shop.service.ISlidesService;
import com.javabackend.shop.service.ISupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController(value = "Slideview")
@RequestMapping("/api/slides")
public class SlidesAPI {
    @Autowired
    private ISlidesService slidesService;
    @PostMapping
    public SlidesDTO addSlide(@Valid @RequestBody SlidesDTO slidesDTO){
        slidesService.addSlides(slidesDTO);
        return slidesDTO;
    }
    @PostMapping("/use")
    public ResponseEntity<String> useSlide(@RequestBody SlideRequest slideRequest){
        slidesService.useSlide(slideRequest.getId(),slideRequest.getReq());
        return ResponseEntity.status(HttpStatus.OK).body("OK");

    }

}
