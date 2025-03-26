package com.javabackend.shop.Controller.admin;

import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.entity.OrderItemEntity;
import com.javabackend.shop.entity.UserEntity;
import com.javabackend.shop.model.dto.*;
import com.javabackend.shop.model.request.OrderSearchRequest;
import com.javabackend.shop.repository.OrderItemRepository;
import com.javabackend.shop.repository.OrderRepository;
import com.javabackend.shop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller(value = "orderManagementOfadmin")
public class OrderController {
    @Autowired
    private OrderRepository orderRepository;

    @RequestMapping(value = "/admin/order-list", method = RequestMethod.GET)
    public ModelAndView orderManagement(@RequestParam(defaultValue = "0") int page,
                                        @RequestParam(defaultValue = "5") int size,
                                        OrderSearchRequest orderSearchRequest) {
        ModelAndView modelAndView = new ModelAndView("admin/Order/list");
        Pageable pageable = PageRequest.of(page, size);
        int totalItems = (int) orderRepository.count();
        int totalPages = (int) Math.ceil((double) totalItems / size);
        List<OrderEntity> orderPageContent = orderRepository.findAll(orderSearchRequest, pageable);
        modelAndView.addObject("orderPageContent", orderPageContent);
        modelAndView.addObject("currentPage", page);
        modelAndView.addObject("pageSize", size);
        modelAndView.addObject("totalItems", totalItems);
        modelAndView.addObject("totalPages", totalPages);
        modelAndView.addObject("orderSearchRequest", orderSearchRequest);
        return modelAndView;
    }

}

