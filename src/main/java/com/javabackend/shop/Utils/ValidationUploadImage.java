package com.javabackend.shop.Utils;
import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UploadImageValidator.class)
@Documented
public @interface ValidationUploadImage {
    String message() default "Hình ảnh upload không hợp lệ";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
