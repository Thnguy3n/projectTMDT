package com.javabackend.shop.iterator.Impl;

import com.javabackend.shop.entity.NotificationEntity;
import com.javabackend.shop.iterator.NotificationCollection;
import com.javabackend.shop.iterator.NotificationIterator;

import java.util.List;

public class NotificationListCollection implements NotificationCollection {
    private final List<NotificationEntity> notifications;

    public NotificationListCollection(List<NotificationEntity> notifications) {
        this.notifications = notifications;
    }

    @Override
    public NotificationIterator<NotificationEntity> createIterator() {
        return new NotificationListIterator(notifications);
    }
}
