package com.javabackend.shop.Controller;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@RestController(value = "jsonAPI")
public class JsonController {
    @GetMapping(value = "/api/tinh_tp", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8")
    public ResponseEntity<String> getProvinces() {
        return getJsonResponse("static/data/tinh_tp.json");
    }

    @GetMapping(value ="/api/quan_huyen",produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8")
    public ResponseEntity<String> getDistricts() {
        return getJsonResponse("static/data/quan_huyen.json");
    }

    @GetMapping(value ="/api/xa_phuong",produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8")
    public ResponseEntity<String> getWards() {
        return getJsonResponse("static/data/xa_phuong.json");
    }

    private ResponseEntity<String> getJsonResponse(String filePath) {
        try {
            ClassPathResource resource = new ClassPathResource(filePath);
            byte[] data = Files.readAllBytes(Paths.get(resource.getURI()));
            String jsonContent = new String(data, "UTF-8");
            return ResponseEntity.ok(jsonContent);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("File not found");
        }
    }
}
