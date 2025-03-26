package com.javabackend.shop.iterator.Impl;

import com.javabackend.shop.entity.NotificationEntity;
import com.javabackend.shop.iterator.NotificationIterator;

import java.util.List;
import java.util.NoSuchElementException;

public class NotificationListIterator implements NotificationIterator<NotificationEntity> {
    private final List<NotificationEntity> notifications;
    private int position = 0;

    public NotificationListIterator(List<NotificationEntity> notifications) {
        this.notifications = notifications;
    }

    @Override
    public boolean hasNext() {
        return position < notifications.size();
    }

    @Override
    public NotificationEntity next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        return notifications.get(position++);
    }
}
