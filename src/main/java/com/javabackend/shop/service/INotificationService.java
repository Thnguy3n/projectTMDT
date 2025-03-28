package com.javabackend.shop.service;

import com.javabackend.shop.model.dto.NotificationDTO;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface INotificationService {
    List<NotificationDTO> find5Notifications();
    ResponseEntity<String> countNotifications();
}
