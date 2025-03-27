package com.javabackend.shop.Utils;

import com.javabackend.shop.entity.NotificationEntity;
import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.model.event.OrderPlacedEvent;
import com.javabackend.shop.repository.NotificationRepository;
import com.javabackend.shop.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class AdminNotificationListener {
    @Autowired
    private NotificationRepository notificationRepository;
    @EventListener
    public void handleOrderPlacedEvent(OrderPlacedEvent event){
        OrderEntity orderEntity = event.getOrderEntity();
        NotificationEntity notificationEntity = new NotificationEntity();
        notificationEntity.setOrderEntity(orderEntity);
        notificationEntity.setIsRead(0);
        notificationEntity.setMessage("Đơn hàng mới đã được đặt bởi: "+orderEntity.getFullName());
        notificationRepository.save(notificationEntity);
    }
}
