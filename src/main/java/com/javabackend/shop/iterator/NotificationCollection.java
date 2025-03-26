package com.javabackend.shop.iterator;

import com.javabackend.shop.entity.NotificationEntity;

public interface NotificationCollection {
    NotificationIterator<NotificationEntity> createIterator();
}
