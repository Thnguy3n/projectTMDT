package com.javabackend.shop.Controller.admin;

import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.model.dto.OrderDTO;
import com.javabackend.shop.model.request.ProductRequest;
import com.javabackend.shop.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "ControllerOfShipper")
public class ShipController {
    @Autowired
    private OrderRepository orderRepository;
    @RequestMapping(value = "/admin/Shipper", method = RequestMethod.GET)
    public ModelAndView OrderVIew(@ModelAttribute OrderDTO orderDTO){
        ModelAndView modelAndView = new ModelAndView("admin/ShipperHome");
        List<OrderEntity> orderEntities=orderRepository.findAllByStatus("Đang xử lý");
        for (OrderEntity orderEntity : orderEntities) {
            modelAndView.addObject("paymentStatus", orderEntity.getPaymentEntity().getStatus());
        }
        modelAndView.addObject("order", orderEntities);
        return modelAndView;
    }
}
