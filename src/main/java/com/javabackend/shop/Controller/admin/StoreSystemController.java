package com.javabackend.shop.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "StoreSystem")
public class StoreSystemController {
    @RequestMapping(value = "/admin/Location",method = RequestMethod.GET)
    public ModelAndView location(){
        ModelAndView mav = new ModelAndView("admin/Location/Local");
        return mav;
    }

}
