package com.javabackend.shop.Controller.web;

import com.javabackend.shop.model.dto.CartDTO;
import com.javabackend.shop.service.ICartService;
import com.javabackend.shop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "CartControllerOfAdmin")
//@ControllerAdvice
public class CartController {
    @Autowired
    private ICartService cartService;
    @Autowired
    private IUserService userService;
//
//    @GetMapping(value = "/cart")
//    public ModelAndView viewCart(Model model, @RequestParam Long userId) {
//        CartDTO cartDTO = cartService.loadCart(userId);
//        ModelAndView mav = new ModelAndView("web/cart-modal");
//        model.addAttribute("cart", cartDTO.getItems());
//        return mav;
//    }
//    @ModelAttribute
//    public void addCartToModel(Model model, @RequestParam Long userId) {
//        CartDTO cartDTO = cartService.loadCart(userId);
//        model.addAttribute("cart", cartDTO.getItems());
//    }
}
