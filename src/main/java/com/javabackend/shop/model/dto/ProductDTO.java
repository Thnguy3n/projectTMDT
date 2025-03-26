package com.javabackend.shop.model.dto;

import com.javabackend.shop.Utils.ValidationDiscountTime;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@ValidationDiscountTime
//@ValidationUploadImage
@Data
public class ProductDTO extends AbstractDTO{
    private Long id;

    @NotBlank(message = "Tiêu đề sản phẩm không được để trống")
    private String title;

    @NotNull(message = "Giá sản phẩm không được để trống")
    private Double price;

    private Integer discount;

//    @NotNull(message = "Hình ảnh sản phẩm không được để trống")
    private String image;

    @NotNull(message = "Số lượng tồn kho không được để trống")
    private Integer inventory;

    @NotBlank(message = "Mô tả sản phẩm không được để trống")
    private String description;

    private Integer deleted;

    private String imageBase64;

    private String imageName ;

    @NotNull(message = "Danh mục sản phẩm không được để trống")
    private Long categoryId;

    @NotNull(message = "Nhà cung cấp không được để trống")
    private Long supplierId;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime start_discount;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime end_discount;

    private Integer discountStatus;


}
