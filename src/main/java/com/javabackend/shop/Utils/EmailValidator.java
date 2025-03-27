package com.javabackend.shop.Utils;

import com.javabackend.shop.model.dto.UserDTO;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Pattern;

public class EmailValidator implements ConstraintValidator<ValidationEmail, UserDTO> {
    private static final String CUSTOM_EMAIL_REGEX =
            "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~%&-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";

    private static final Pattern EMAIL_PATTERN = Pattern.compile(CUSTOM_EMAIL_REGEX);

    @Override
    public void initialize(ValidationEmail constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(UserDTO userDTO, ConstraintValidatorContext constraintValidatorContext) {
        if (userDTO.getEmail() == null) {
            return false;
        } else if (!EMAIL_PATTERN.matcher(userDTO.getEmail()).matches()) {
            constraintValidatorContext.disableDefaultConstraintViolation();
            constraintValidatorContext.buildConstraintViolationWithTemplate("Sai định dạng email")
                    .addConstraintViolation();
            return false;
        }
        return true;
    }
}
