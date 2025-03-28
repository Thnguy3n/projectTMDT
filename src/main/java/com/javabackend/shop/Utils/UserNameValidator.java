package com.javabackend.shop.Utils;

import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Pattern;

public class UserNameValidator implements ConstraintValidator<ValidationUserName, UserDTO> {
    @Autowired
    private UserRepository userRepository;
    private static final Pattern STRICT_USERNAME_PATTERN =Pattern.compile("^[a-zA-Z0-9]+$");
    @Override
    public void initialize(ValidationUserName constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(UserDTO userDTO, ConstraintValidatorContext constraintValidatorContext) {
        if (userDTO.getUserName().equals("")) {
            return false;
        }
        else if (!STRICT_USERNAME_PATTERN.matcher(userDTO.getUserName()).matches()) {
            constraintValidatorContext.disableDefaultConstraintViolation();
            constraintValidatorContext.buildConstraintViolationWithTemplate("Chỉ cho phép chữ cái và số. Không cho phép khoảng trắng, ký tự đặc biệt, hoặc Unicode.")
                    .addConstraintViolation();
            return false;
        }
        else if (!(userDTO.getUserName().length() < 15&&userDTO.getUserName().length() > 4)) {
            constraintValidatorContext.disableDefaultConstraintViolation();
            constraintValidatorContext.buildConstraintViolationWithTemplate("Tên đăng nhập: > 4 ký tự và < 15 ký tự")
                    .addConstraintViolation();
            return false;
        }
        else if(userRepository.existsByUserName(userDTO.getUserName())) {
            constraintValidatorContext.disableDefaultConstraintViolation();
            constraintValidatorContext.buildConstraintViolationWithTemplate("Tên đăng nhập đã tồn tại")
                    .addConstraintViolation();
            return false;
        }
        return true;
    }
}
