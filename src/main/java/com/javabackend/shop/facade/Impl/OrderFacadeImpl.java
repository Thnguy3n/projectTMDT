package com.javabackend.shop.facade.Impl;

import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.facade.OrderFacade;
import com.javabackend.shop.model.dto.CartDTO;
import com.javabackend.shop.model.dto.OrderDTO;
import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.repository.OrderRepository;
import com.javabackend.shop.service.ICartService;
import com.javabackend.shop.service.IOrderService;
import com.javabackend.shop.service.IShippingMethodService;
import com.javabackend.shop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Service
public class OrderFacadeImpl implements OrderFacade {
    @Autowired
    private IUserService userService;
    @Autowired
    private ICartService cartService;
    @Autowired
    private IShippingMethodService shippingMethodService;

    @Override
    public ModelAndView prepareOrderPage(OrderDTO orderDTO) {
        ModelAndView view = new ModelAndView("web/checkout");
        if (SecurityContextHolder.getContext().getAuthentication() != null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
            CartDTO cartDTO =cartService.loadCart(userService.LoggedinInformation().getId());
            view.addObject("cartItem",cartDTO.getItems());
        }
        view.addObject("order", orderDTO);
        view.addObject("shippingMethods", shippingMethodService.findAllShippingMethods());
        return view;
    }
}
