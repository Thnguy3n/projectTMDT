package com.javabackend.shop.service.Impl;

import com.javabackend.shop.entity.NotificationEntity;
import com.javabackend.shop.iterator.Impl.NotificationListCollection;
import com.javabackend.shop.iterator.NotificationCollection;
import com.javabackend.shop.iterator.NotificationIterator;
import com.javabackend.shop.model.dto.NotificationDTO;
import com.javabackend.shop.repository.NotificationRepository;
import com.javabackend.shop.service.INotificationService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Service
public class NotificationServiceImpl implements INotificationService {
    @Autowired
    private NotificationRepository notificationRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<NotificationDTO> find5Notifications() {
        List<NotificationEntity> notifications = notificationRepository.findTop5ByIsReadOrderByCreatedDateDesc(0);
        NotificationCollection collection = new NotificationListCollection(notifications);
        NotificationIterator<NotificationEntity> iterator = collection.createIterator();

        List<NotificationDTO> notificationDTOS = new ArrayList<>();
        LocalDateTime now = LocalDateTime.now();

        while (iterator.hasNext()) {
            NotificationEntity notification = iterator.next();
            notification.setLastDisplayedAt(now);
            notificationDTOS.add(modelMapper.map(notification, NotificationDTO.class));
        }
        notificationRepository.saveAll(notifications);
        return notificationDTOS;
    }

    @Override
    public ResponseEntity<String> countNotifications() {
        return new ResponseEntity<>(String.valueOf(notificationRepository.count()), HttpStatus.OK);
    }

}
