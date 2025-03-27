package com.javabackend.shop.model.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class NotificationDTO extends AbstractDTO{
    private Long id;
    private String message;
    private Integer isRead;
    private Long orderId;
    private LocalDateTime lastDisplayedAt;
}
