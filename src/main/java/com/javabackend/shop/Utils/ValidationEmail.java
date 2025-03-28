package com.javabackend.shop.Utils;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = EmailValidator.class)
@Documented
public @interface ValidationEmail {
    String message() default "Địa chỉ Email không được để trống";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
