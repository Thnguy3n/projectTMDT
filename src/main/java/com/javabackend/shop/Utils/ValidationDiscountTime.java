package com.javabackend.shop.Utils;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = DiscountTimeValidator.class)
@Documented
public @interface ValidationDiscountTime {
    String message() default "Thời gian giảm giá không hợp lệ";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};

}
