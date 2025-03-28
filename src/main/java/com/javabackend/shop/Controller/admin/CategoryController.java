package com.javabackend.shop.Controller.admin;


import com.javabackend.shop.model.dto.CategoryDTO;
import com.javabackend.shop.model.dto.ProductDTO;
import com.javabackend.shop.model.dto.SupplierDTO;
import com.javabackend.shop.model.request.ProductRequest;
import com.javabackend.shop.service.ICategoryService;
import com.javabackend.shop.service.IProductService;
import com.javabackend.shop.service.ISupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    private ICategoryService categoryService;


    @RequestMapping(value = "/admin/category-list",method = RequestMethod.GET)
    public ModelAndView categoryList(@ModelAttribute CategoryDTO categoryDTO, HttpServletRequest request) {
        ModelAndView view = new ModelAndView("admin/Category/list");
        view.addObject("category",categoryService.findAll());
        return view;
    }

    @RequestMapping(value = "/admin/category-edit", method = RequestMethod.GET)
    public ModelAndView categoryEdit(@ModelAttribute("categoryEdit") CategoryDTO categoryDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/Category/edit");
        return mav;
    }


    @RequestMapping(value = "/admin/category-edit-{id}", method = RequestMethod.GET)
    public ModelAndView categoryEdit(@PathVariable("id") Long Id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/Category/edit");
        CategoryDTO categoryDTO = categoryService.findCategoryEntityById(Id);
        mav.addObject("categoryEdit",categoryDTO );
        return mav;
    }
}