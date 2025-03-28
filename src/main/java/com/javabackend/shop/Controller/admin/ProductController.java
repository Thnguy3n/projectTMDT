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

@Controller(value = "productControllerForAdmin")
public class ProductController {
    @Autowired
    private IProductService productService;
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private ISupplierService supplierService;
    @RequestMapping(value = "/admin/product-list",method = RequestMethod.GET)
    public ModelAndView productList(@ModelAttribute ProductRequest productRequest) {
        ModelAndView view = new ModelAndView("admin/Products/list");
        view.addObject("productRequest", productRequest);
        view.addObject("product",productService.findAll(productRequest));
        return view;
    }
    @RequestMapping(value = "/admin/product-edit", method = RequestMethod.GET)
    public ModelAndView productEdit(@ModelAttribute("productEdit") ProductDTO productDTO){
        ModelAndView mav = new ModelAndView("admin/Products/edit");
        List<CategoryDTO> categories = categoryService.findAll();
        List<SupplierDTO> suppliers = supplierService.findAll();
        mav.addObject("category",categories );
        mav.addObject("supplier",suppliers);
        return mav;
    }
    @RequestMapping(value = "/admin/product-edit-{id}", method = RequestMethod.GET)
    public ModelAndView productEdit(@PathVariable("id") Long Id){
        ModelAndView mav = new ModelAndView("admin/Products/edit");
        ProductDTO productDTO = productService.findProductById(Id);
        List<CategoryDTO> categories = categoryService.findAll();
        List<SupplierDTO> suppliers = supplierService.findAll();
        mav.addObject("category",categories );
        mav.addObject("supplier",suppliers);
        mav.addObject("productEdit",productDTO);
        return mav;
    }
}
