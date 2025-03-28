package com.javabackend.shop.facade;

import com.javabackend.shop.model.dto.OrderDTO;
import org.springframework.web.servlet.ModelAndView;

public interface OrderFacade {
    ModelAndView prepareOrderPage(OrderDTO orderDTO);
}
