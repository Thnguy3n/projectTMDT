package com.javabackend.shop.service.Impl;

import com.javabackend.shop.exception.CustomValidationException;
import com.javabackend.shop.exception.InvalidPhoneException;
import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
@Primary
public class ValidatingUserService extends UserServiceDecorator{
    private static final String PHONE_REGEX = "^(0|\\+84)(3[2-9]|5[689]|7[06-9]|8[1-9]|9\\d)\\d{7}$";
    @Autowired
    public ValidatingUserService(
            @Qualifier("userServiceImpl") IUserService userService
    ) {
        super(userService);
    }
    @Override
    public UserDTO addCustomerAccount(UserDTO userDTO) { // <-- Thêm method này
        validatePhoneNumber(userDTO.getPhone());
        return super.addCustomerAccount(userDTO);
    }
    private void validatePhoneNumber(String phone) {
        if (!phone.matches(PHONE_REGEX)) {
            throw new InvalidPhoneException("Số điện thoại không hợp lệ. Ví dụ hợp lệ: 0912345678 hoặc +84987654321");
        }
    }
}
