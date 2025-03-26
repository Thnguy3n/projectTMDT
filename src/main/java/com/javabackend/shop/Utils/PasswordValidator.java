package com.javabackend.shop.Utils;

import com.javabackend.shop.entity.UserEntity;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

public class PasswordValidator implements ConstraintValidator<ValidationPassword, UserEntity> {
    @Override
    public void initialize(ValidationPassword constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(UserEntity userEntity, ConstraintValidatorContext constraintValidatorContext) {
        if(userEntity.getLoginType().equals("oAuth2Login") && userEntity.getPassword().equals("not-using") ) {
            return true;
        } else if (userEntity.getLoginType().equals("WebLogin") && !userEntity.getPassword().equals(null) ) {
            return true;
        }
        return false;
    }
}
