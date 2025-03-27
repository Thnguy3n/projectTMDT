package com.javabackend.shop.Controller.admin;

import com.javabackend.shop.repository.OrderRepository;
import com.javabackend.shop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {
    @Autowired
    private OrderRepository orderRepository;
//    @RequestMapping(value = "/admin/home", method = RequestMethod.GET)
//
//    public ModelAndView homePage() {
//
//        ModelAndView mav = new ModelAndView("admin/adminHome");
//
//        return mav;
//
//    }
@Controller
public class OrderStatisticsController {

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/admin/home")
    public ModelAndView getMonthlyRevenue(@RequestParam(defaultValue = "2024") int year,
                                          @RequestParam(required = false) Integer month,
                                          @RequestParam(required = false) String status) {
        ModelAndView modelAndView = new ModelAndView("admin/adminHome");
        List<Object[]> monthlyRevenueData;
        if ("Doanh thu".equals(status)) {
            monthlyRevenueData = orderRepository.getMonthlyRevenueWithStatuses(year, month, Arrays.asList("Đang xử lý", "Đã giao hàng"));
        } else if (status != null) {
            monthlyRevenueData = orderRepository.getMonthlyRevenueWithStatuses(year, month, Collections.singletonList(status));
        } else {
            monthlyRevenueData = orderRepository.getMonthlyRevenueWithoutStatuses(year, month);
        }
        Map<Integer, Double> monthlyRevenue = new LinkedHashMap<>();
        for (Object[] record : monthlyRevenueData) {
            Integer revenueMonth = (Integer) record[0];
            Double revenue = (Double) record[2];
            monthlyRevenue.put(revenueMonth, revenue);
        }
        long orderCount = orderRepository.count();
        long ProductCount = productRepository.countAllByDeleted(1);
        modelAndView.addObject("monthlyRevenue", monthlyRevenue);
        modelAndView.addObject("ProductCount",ProductCount);
        modelAndView.addObject("orderCount",orderCount);
        modelAndView.addObject("year", year);
        modelAndView.addObject("month", month);
        modelAndView.addObject("status", status);
        return modelAndView;
    }
}

}
