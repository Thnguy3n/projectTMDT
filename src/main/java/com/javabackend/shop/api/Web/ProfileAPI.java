package com.javabackend.shop.api.Web;

import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController(value = "profileAPI")
@RequestMapping("/api/profile")
public class ProfileAPI {
    @Autowired
    private IUserService userService;
    @PostMapping("/{id}")
    public ResponseEntity<UserDTO> updateProfileUsers(@Valid @PathVariable("id") long id , @RequestBody UserDTO userDTO) {
        return ResponseEntity.ok(userService.updateProfile(id, userDTO));
    }
}
