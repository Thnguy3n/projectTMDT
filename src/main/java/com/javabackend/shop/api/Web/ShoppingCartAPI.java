package com.javabackend.shop.api.Web;

import com.javabackend.shop.model.dto.CartDTO;
import com.javabackend.shop.model.dto.CartItemDTO;
import com.javabackend.shop.model.dto.MyUserDetail;
import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.security.utils.SecurityUtils;
import com.javabackend.shop.service.ICartService;
import com.javabackend.shop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@RestController(value = "cartAPIOfUser")
@RequestMapping("/api/cart")
public class ShoppingCartAPI {
    @Autowired
    private ICartService cartService;
    @Autowired
    private IUserService userService;

    @PostMapping("/addOrUpdate")
    @ResponseBody
    public ResponseEntity<CartItemDTO> addOrUpdateCartItem(
            @RequestBody CartItemDTO cartItemDTO,
            @RequestParam(required = false, defaultValue = "false") boolean isUpdateQuantity) {
        if (SecurityContextHolder.getContext().getAuthentication() != null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
            cartService.addToCart(cartItemDTO, userService.LoggedinInformation().getId(), isUpdateQuantity);
        }
        return ResponseEntity.ok(cartItemDTO);
    }

    @GetMapping("/items")
    @ResponseBody
    public CartDTO viewCart() {
        if (SecurityContextHolder.getContext().getAuthentication() != null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
                return cartService.loadCart(userService.LoggedinInformation().getId());
        }
        else
            return new CartDTO();
    }

    @PostMapping("/remove")
    @ResponseBody
    public void removeItemFromCart( @RequestBody Long cartItemId) {
        cartService.removeFromCart(cartItemId);
    }

}
