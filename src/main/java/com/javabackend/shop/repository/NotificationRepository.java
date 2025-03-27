package com.javabackend.shop.repository;

import com.javabackend.shop.entity.NotificationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.management.NotificationEmitter;
import java.time.LocalDateTime;
import java.util.List;

public interface NotificationRepository extends JpaRepository<NotificationEntity, Long> {
    List<NotificationEntity> findAllByIsRead(Integer isRead);
    List<NotificationEntity> findTop5ByIsReadOrderByCreatedDateDesc(Integer isRead);
    List<NotificationEntity> findByIsReadAndLastDisplayedAtBefore(Integer isRead, LocalDateTime lastDisplayedAtBefore);
    String countByIsRead(Integer isRead);

}
