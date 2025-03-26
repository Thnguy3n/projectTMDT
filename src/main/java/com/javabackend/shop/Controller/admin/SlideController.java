package com.javabackend.shop.Controller.admin;

import com.javabackend.shop.Utils.ValidationEmail;
import com.javabackend.shop.model.dto.SlidesDTO;
import com.javabackend.shop.service.ISlidesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller(value = "Slides")
public class SlideController {
    @Autowired
    private ISlidesService slidesService;
    @RequestMapping(value = "/admin/slide",method = RequestMethod.GET)
    public ModelAndView slide( SlidesDTO slidesDTO){
        ModelAndView mav = new ModelAndView("admin/Slides/view");
        mav.addObject("slidesDTOS", slidesService.findAllSlides());
        return mav;
    }
}
