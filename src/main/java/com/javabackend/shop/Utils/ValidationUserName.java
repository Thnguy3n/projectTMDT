package com.javabackend.shop.Utils;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UserNameValidator.class)
@Documented
public @interface ValidationUserName {
    String message() default "Tên đăng nhập không được để trống";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
