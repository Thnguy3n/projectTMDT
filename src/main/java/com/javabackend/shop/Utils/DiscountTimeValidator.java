package com.javabackend.shop.Utils;

import com.javabackend.shop.model.dto.ProductDTO;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDateTime;

public class DiscountTimeValidator implements ConstraintValidator<ValidationDiscountTime, ProductDTO> {

    @Override
    public void initialize(ValidationDiscountTime constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(ProductDTO productDTO, ConstraintValidatorContext context) {
        LocalDateTime start = productDTO.getStart_discount();
        LocalDateTime end = productDTO.getEnd_discount();
        if(start==null && end==null) {
            return true;
        }
        if (start == null || end == null) {
            context.disableDefaultConstraintViolation();
            if (start == null) {
                context.buildConstraintViolationWithTemplate("Ngày bắt đầu giảm giá không được bỏ trống")
                        .addConstraintViolation();
            } else {
                context.buildConstraintViolationWithTemplate("Ngày kết thúc giảm giá không được bỏ trống")
                        .addConstraintViolation();
            }
            return false;
        }

        if(start.isAfter(end)) {
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Ngày bắt đầu giảm giá phải trước ngày kết thúc giảm giá")
                   .addConstraintViolation();
            return false;
        }
        return true;
    }
}
