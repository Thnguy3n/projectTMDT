package com.javabackend.shop.Controller.admin;

import com.javabackend.shop.model.dto.NotificationDTO;
import com.javabackend.shop.service.INotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller(value = "NotificationOfAdmin")
public class NotificationController {
    @Autowired
    private INotificationService notificationService;
    @RequestMapping(value = "/notifications")
    public ResponseEntity<List<NotificationDTO>> notifications() {
        return new ResponseEntity<>(notificationService.find5Notifications(), HttpStatus.OK);
    }
    @RequestMapping(value = "/notifications-count", method = RequestMethod.GET)
    public ResponseEntity<String> CountNotifications() {
        return notificationService.countNotifications();
    }

}
