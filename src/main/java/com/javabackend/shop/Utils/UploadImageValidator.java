package com.javabackend.shop.Utils;

import com.javabackend.shop.model.dto.ProductDTO;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UploadImageValidator implements ConstraintValidator<ValidationUploadImage, ProductDTO> {
    @Override
    public void initialize(ValidationUploadImage constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(ProductDTO productDTO, ConstraintValidatorContext constraintValidatorContext) {
        if( productDTO.getImage().equals("/admin/img/defaul.png")){
            constraintValidatorContext.disableDefaultConstraintViolation();
            constraintValidatorContext.buildConstraintViolationWithTemplate("Hình ảnh không được để trống").addConstraintViolation();
            return false;
        }
        return true;
    }
}
