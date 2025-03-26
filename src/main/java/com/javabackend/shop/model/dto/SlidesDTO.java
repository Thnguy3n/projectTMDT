package com.javabackend.shop.model.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class SlidesDTO extends AbstractDTO {
    private Long id;
    @NotBlank(message = "Không được để trống tên slider")
    private String title;
    private String image;
    private Integer isActive;
    private String imageBase64;
    private String imageName ;
}
