package com.javabackend.shop.api.Admin;

import com.javabackend.shop.constant.SystemConstant;
import com.javabackend.shop.exception.MyException;
import com.javabackend.shop.model.dto.PasswordDTO;
import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.model.request.OtpRequest;
import com.javabackend.shop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController(value = "userAPIOfAdmin")
@RequestMapping("/api/user")
public class UserAPI {

    @Autowired
    private IUserService userService;

    @PostMapping("/Register")
    public ResponseEntity<?> register(@Valid @RequestBody UserDTO userDTO) {
        if(userService.existsByEmail(userDTO.getEmail())){
            return ResponseEntity.badRequest().body("Email da ton tai");
        }
        userService.addCustomerAccount(userDTO);
        return ResponseEntity.ok("check email");
    }
    @PostMapping("/verify")
    public ResponseEntity<?> verifyOtp(@RequestBody OtpRequest otpRequest) {
        boolean isValid = userService.verifyOtp(otpRequest.getEmail(),otpRequest.getOtp());
        if (isValid) {
            return ResponseEntity.ok("Account verified ");
        }
        return ResponseEntity.badRequest().body("Invalid OTP ");
    }

    @PostMapping
    public ResponseEntity<UserDTO> createUsers(@Valid  @RequestBody UserDTO newUser) {
        return ResponseEntity.ok(userService.insert(newUser));
    }


    @PutMapping("/{id}")
    public ResponseEntity<UserDTO> updateUsers(@PathVariable("id") long id, @RequestBody UserDTO userDTO) {
        return ResponseEntity.ok(userService.update(id, userDTO));
    }

    @PutMapping("/change-password/{id}")
    public ResponseEntity<String> changePasswordUser(@PathVariable("id") long id, @RequestBody PasswordDTO passwordDTO) {
        try {
            userService.updatePassword(id, passwordDTO);
            return ResponseEntity.ok(SystemConstant.UPDATE_SUCCESS);
        } catch (MyException e) {
            //LOGGER.error(e.getMessage());
            return ResponseEntity.ok(e.getMessage());
        }
    }

    @PutMapping("/password/{id}/reset")
    public ResponseEntity<UserDTO> resetPassword(@PathVariable("id") long id) {
        return ResponseEntity.ok(userService.resetPassword(id));
    }

    @PutMapping("/profile/{username}")
    public ResponseEntity<UserDTO> updateProfileOfUser(@PathVariable("username") String username, @RequestBody UserDTO userDTO) {
        return ResponseEntity.ok(userService.updateProfileOfUser(username, userDTO));
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteUsers(@RequestBody long[] idList) {
        if (idList.length > 0) {
            userService.delete(idList);
        }
        return ResponseEntity.noContent().build();
    }
}
