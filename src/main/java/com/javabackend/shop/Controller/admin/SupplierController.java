package com.javabackend.shop.Controller.admin;


import com.javabackend.shop.model.dto.CategoryDTO;
import com.javabackend.shop.model.dto.SupplierDTO;
import com.javabackend.shop.service.ICategoryService;
import com.javabackend.shop.service.ISupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class SupplierController {
    @Autowired
    private ISupplierService supplierService;


    @RequestMapping(value = "/admin/supplier-list",method = RequestMethod.GET)
    public ModelAndView supplierList(@ModelAttribute SupplierDTO supplierDTO, HttpServletRequest request) {
        ModelAndView view = new ModelAndView("admin/Supplier/list");
        view.addObject("supplier1",supplierService.findAll());
        return view;
    }

    @RequestMapping(value = "/admin/supplier-edit", method = RequestMethod.GET)
    public ModelAndView supplierEdit(@ModelAttribute("supplierEdit") SupplierDTO supplierDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/Supplier/edit");
        return mav;
    }


    @RequestMapping(value = "/admin/supplier-edit-{id}", method = RequestMethod.GET)
    public ModelAndView supplierEdit(@PathVariable("id") Long Id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/Supplier/edit");
        SupplierDTO supplierDTO = supplierService.findSupplierEntityById(Id);
        mav.addObject("supplierEdit",supplierDTO );
        return mav;
    }
}