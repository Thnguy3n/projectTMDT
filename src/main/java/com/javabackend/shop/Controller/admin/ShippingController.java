package com.javabackend.shop.Controller.admin;

import com.javabackend.shop.model.dto.ShippingMethodDTO;
import com.javabackend.shop.service.IShippingMethodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "ShippingController")
public class
ShippingController {
    @Autowired
    private IShippingMethodService shippingMethodService;
    @RequestMapping(value = "/admin/shipping", method = RequestMethod.GET)
    public ModelAndView adminShipping() {
        ModelAndView mav = new ModelAndView("admin/Shipping/view");
        mav.addObject("ShippingMethodDTOs",shippingMethodService.findAllShippingMethods());
        return mav;
    }
    @RequestMapping(value = "/admin/shipping-edit", method = RequestMethod.GET)
    public ModelAndView adminShippingEdit(@ModelAttribute("shippingMethodDTO") ShippingMethodDTO shippingMethodDTO) {
        ModelAndView mav = new ModelAndView("admin/Shipping/edit");
        return mav;
    }
    @RequestMapping(value = "/admin/shipping-edit-{id}", method = RequestMethod.GET)
    public ModelAndView adminShippingUpdate(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/Shipping/edit");
        ShippingMethodDTO shippingMethodDTO = shippingMethodService.findShippingMethodById(id);
        mav.addObject("shippingMethodDTO", shippingMethodDTO);
        return mav;
    }
}
