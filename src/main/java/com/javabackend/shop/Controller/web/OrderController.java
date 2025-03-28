package com.javabackend.shop.Controller.web;

import com.javabackend.shop.entity.CartItemEntity;
import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.facade.Impl.OrderFacadeImpl;
import com.javabackend.shop.facade.OrderFacade;
import com.javabackend.shop.model.dto.CartDTO;
import com.javabackend.shop.model.dto.OrderDTO;
import com.javabackend.shop.repository.OrderRepository;
import com.javabackend.shop.security.utils.SecurityUtils;
import com.javabackend.shop.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.ByteArrayInputStream;

@Controller (value = "ordercontroller")
public class OrderController {
    @Autowired
    private OrderFacade orderFacade;
    @RequestMapping(value = "/order",method = RequestMethod.GET)
    public ModelAndView OrderPage(@ModelAttribute("newOrder") OrderDTO orderDTO) {
        return orderFacade.prepareOrderPage(orderDTO) ;
    }

}