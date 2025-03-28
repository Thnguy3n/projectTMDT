package com.javabackend.shop.service.Impl;

import com.javabackend.shop.entity.CartEntity;
import com.javabackend.shop.entity.CartItemEntity;
import com.javabackend.shop.entity.ProductEntity;
import com.javabackend.shop.model.dto.CartDTO;
import com.javabackend.shop.model.dto.CartItemDTO;
import com.javabackend.shop.repository.CartItemRepository;
import com.javabackend.shop.repository.CartRepository;
import com.javabackend.shop.repository.ProductRepository;
import com.javabackend.shop.repository.UserRepository;
import com.javabackend.shop.service.ICartService;
import com.javabackend.shop.strategy.DiscountStrategy;
import com.javabackend.shop.strategy.context.DiscountContext;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CartServiceImpl implements ICartService {
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private CartItemRepository cartItemRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private DiscountContext discountContext;
    @Override
    public void addToCart(CartItemDTO cartItemDTO, Long userId, boolean isUpdateQuantity) {
        CartEntity cartEntity = cartRepository.findCartByUserId(userId)
                .orElseGet(() -> {
                    CartEntity newCartEntity = new CartEntity();
                    newCartEntity.setUserEntity(userRepository.findById(userId).get());
                    return cartRepository.save(newCartEntity);
                });

        ProductEntity productEntity = productRepository.findById(cartItemDTO.getProductId()).get();
        Optional<CartItemEntity> existingCartItem = cartEntity.getCartItemEntities().stream()
                .filter(item -> item.getProductEntity().getId().equals(cartItemDTO.getProductId()) &&
                        item.getSize().equals(cartItemDTO.getSize()) &&
                        item.getDiscount_status().equals(cartItemDTO.getDiscount_status()))
                .findFirst();

        if (existingCartItem.isPresent()) {
            CartItemEntity cartItemEntity = existingCartItem.get();
            if (isUpdateQuantity) {
                cartItemEntity.setQuantity(cartItemDTO.getQuantity());
            } else {
                cartItemEntity.setQuantity(cartItemEntity.getQuantity() + cartItemDTO.getQuantity());
            }

            DiscountStrategy strategy = discountContext.getStrategy(cartItemEntity.getProductEntity().getDiscountStatus());
            Double total = strategy.calculateTotal(cartItemEntity.getPrice(), productEntity.getDiscount(),cartItemEntity.getQuantity());

            cartItemEntity.setTotal(total);
            cartItemRepository.save(cartItemEntity);
        } else {
            CartItemEntity newCartItemEntity = new CartItemEntity();
            newCartItemEntity.setCartEntity(cartEntity);
            newCartItemEntity.setProductEntity(productEntity);
            newCartItemEntity.setSize(cartItemDTO.getSize());
            newCartItemEntity.setQuantity(cartItemDTO.getQuantity());
            newCartItemEntity.setPrice(productEntity.getPrice());
            newCartItemEntity.setDiscount_status(productEntity.getDiscountStatus());

            DiscountStrategy strategy = discountContext.getStrategy(newCartItemEntity.getDiscount_status());
            Double total = strategy.calculateTotal(newCartItemEntity.getPrice(),productEntity.getDiscount(),newCartItemEntity.getQuantity());
            newCartItemEntity.setTotal(total);

            cartItemRepository.save(newCartItemEntity);
        }
    }


    @Override
    public CartDTO  loadCart(Long userId) {
        CartEntity cartEntity = cartRepository.findCartByUserId(userId).get();
        CartDTO cartDTO = new CartDTO();
        cartDTO.setId(cartEntity.getId());
        cartDTO.setUserId(userId);
        List<CartItemDTO> cartItems = cartEntity.getCartItemEntities().stream().map(item -> {
            CartItemDTO cartItemDTO = new CartItemDTO();
            cartItemDTO.setId(item.getId());
            cartItemDTO.setProductId(item.getProductEntity().getId());
            cartItemDTO.setProductName(item.getProductEntity().getTitle());
            cartItemDTO.setImage(item.getProductEntity().getImage());
            cartItemDTO.setSize(item.getSize());
            cartItemDTO.setQuantity(item.getQuantity());
            cartItemDTO.setPrice(item.getPrice());
            if(item.getProductEntity().getDiscountStatus()==1){
                cartItemDTO.setDiscount(item.getProductEntity().getDiscount());
            }
            else {
                cartItemDTO.setDiscount(0);
            }
            cartItemDTO.setTotal(item.getTotal());
            cartItemDTO.setCartId(cartEntity.getId());
            cartItemDTO.setDiscount_status(item.getDiscount_status());
            cartItemDTO.setDiscounted_price(cartItemDTO.getPrice()-cartItemDTO.getPrice()*cartItemDTO.getDiscount()/100);
            return cartItemDTO;
        }).collect(Collectors.toList());
        cartDTO.setItems(cartItems);
            return cartDTO;
    }

    @Override
    public void removeFromCart(Long cartItemId) {
        Optional<CartItemEntity> cartItemEntity= cartItemRepository.findById(cartItemId);
        cartItemRepository.delete(cartItemEntity.get());
    }

    @Override
    public void addOrUpdateCartItem(CartItemDTO cartItemDTO) {
        CartItemEntity cartItemEntity = cartItemRepository.findById(cartItemDTO.getId()).get();
        ProductEntity productEntity = productRepository.findById(cartItemDTO.getProductId()).get();
        cartItemEntity.setQuantity(cartItemDTO.getQuantity());
        cartItemEntity.setPrice(cartItemDTO.getPrice());
        cartItemEntity.setTotal(cartItemDTO.getPrice() * cartItemDTO.getQuantity());
        cartItemEntity.setSize(cartItemDTO.getSize());
    }

    @Override
    public void removeCartItem(Long cartId) {
        List<CartItemEntity> cartItemEntity= cartItemRepository.findCartItemEntitiesByCartId(cartId);
        cartItemRepository.deleteAll(cartItemEntity);
    }

}
