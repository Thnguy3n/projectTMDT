package com.javabackend.shop.Controller.web;
import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.model.Response.DiscountResponse;
import com.javabackend.shop.model.dto.CategoryDTO;
import com.javabackend.shop.model.dto.MyUserDetail;
import com.javabackend.shop.model.dto.ProductDTO;
import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.repository.OrderRepository;
import com.javabackend.shop.repository.ProductRepository;
import com.javabackend.shop.repository.UserRepository;
import com.javabackend.shop.security.utils.SecurityUtils;
import com.javabackend.shop.service.*;
import com.javabackend.shop.service.Impl.CategoryServiceImpl;
import com.javabackend.shop.service.Impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;

import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller(value = "homeControllerOfWeb")

public class HomeController {
    @Autowired
    private IProductService productService;
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private IUserService userService;
    @Autowired
    private ISlidesService slidesService;
    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public ModelAndView homePage() {
        ModelAndView mav = new ModelAndView("home");
        ProductDTO productDTO = new ProductDTO();
        mav.addObject("Sliders", slidesService.findAllSlidesByStatus());
        mav.addObject("Bigsale",productService.findProductBigDiscount(productDTO));
        return mav;

    }
    @RequestMapping(value = "/OrderHistory", method = RequestMethod.GET)
    public ModelAndView OrderHistory() {
        ModelAndView mav = new ModelAndView("web/OrderHistory");
        if (SecurityContextHolder.getContext().getAuthentication() != null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
            List<OrderEntity> orderEntityList = orderRepository.findOrderByUserId(userService.LoggedinInformation().getId());
            mav.addObject("orderEntityList", orderEntityList);
        }
        return mav;
    }
    @RequestMapping(value = "/profile",method = RequestMethod.GET)
    public ModelAndView profile() {
        ModelAndView mav = new ModelAndView("web/UserProfile");
        if (SecurityContextHolder.getContext().getAuthentication() != null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
            UserDTO userDTO = userService.findUserById(userService.LoggedinInformation().getId());
            List<OrderEntity> orderEntityList = orderRepository.findOrderByUserId(userService.LoggedinInformation().getId());
            mav.addObject("orderEntityList", orderEntityList);
            mav.addObject("userDTO", userDTO);
        }
        return mav;
    }
    @RequestMapping(value = "/payment_success", method = RequestMethod.GET)
    public ModelAndView paymentSuccessPage() {
        ModelAndView mav = new ModelAndView("web/PaymentSuccessful");
        return mav;
    }
    @RequestMapping(value = "/payment_fail", method = RequestMethod.GET)
    public ModelAndView paymentFailPage() {
        ModelAndView mav = new ModelAndView("web/PaymentFail");
        return mav;
    }
    @RequestMapping(value = "/product-category", method = RequestMethod.GET)
    public ModelAndView productCategoryPage(@ModelAttribute("product") ProductDTO productDTO,
                                            @RequestParam(defaultValue = "0") int page,
                                            @RequestParam(defaultValue = "6") int size) {
        int totalItems = productService.countProducts().intValue();
        int totalPages = (int) Math.ceil((double) totalItems / size);
        ModelAndView mav = new ModelAndView("web/productCategory");
        mav.addObject("productList", productService.findAllPagination(page,size));
        mav.addObject("currentPage", page);
        mav.addObject("pageSize", size);
        mav.addObject("totalItems", totalItems);
        mav.addObject("totalPages", totalPages);
        mav.addObject("categoryList", categoryService.findAll());
        return mav;
    }
    @RequestMapping(value = "/product-category-{id}", method = RequestMethod.GET)
    public ModelAndView productCategory(@PathVariable("id") Long Id,
                                        @RequestParam(defaultValue = "0") int page,
                                        @RequestParam(defaultValue = "6") int size) {
        int totalItems = productService.countProductsByCategoryId(Id).intValue();
        int totalPages = (int) Math.ceil((double) totalItems / size);
        ModelAndView mav = new ModelAndView("web/productCategory");
        mav.addObject("currentPage", page);
        mav.addObject("pageSize", size);
        mav.addObject("totalItems", totalItems);
        mav.addObject("totalPages", totalPages);
        mav.addObject("categoryId", Id);
        mav.addObject("productList1",productService.findProductByCategoryId(Id, page, size));
        mav.addObject("categoryList", categoryService.findAll());
        return mav;
    }
//    @RequestMapping(value = "/product-categoryTest", method = RequestMethod.GET)
//    public ModelAndView productCategoryTest(
//                                            @RequestParam(defaultValue = "0") int page,
//                                            @RequestParam(defaultValue = "6") int size){
//        ModelAndView mav = new ModelAndView("web/productCategory");
//    }
    @RequestMapping(value="/product-detail-{id}",method = RequestMethod.GET)
    public ModelAndView ProductDetailPage(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        ModelAndView mav = new ModelAndView("web/productDetail");
        ProductDTO productDTO = productService.findProductById(id);
        if (SecurityContextHolder.getContext().getAuthentication() != null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
            mav.addObject("user", userService.LoggedinInformation());
        }
        DiscountResponse discountResponse = productService.updateDiscount(productDTO.getId());
        mav.addObject("RemainingDiscountTime",discountResponse.getDuration());
        mav.addObject("DiscountStatus",discountResponse.getDiscountStatus().toString());
        mav.addObject("productDTO", productDTO);
        mav.addObject("Bigsale2",productService.findProductBigDiscount(productDTO));
        return mav;
    }



    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return new ModelAndView("redirect:/trang-chu");
    }
}
